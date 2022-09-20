const path = require('path');
const yaml = require('js-yaml');
const fs = require('fs');
const Ajv = require('ajv');
const { execSync } = require('child_process');

function renderHelmTemplate(templatePath) {
  const directoryToRenderFrom = path.resolve(__dirname, '../helm/');
  const chartName = 'datalab';

  // Render the template using helm's templating engine.
  // Removes need for special handling of the Helm templating syntax.
  return execSync(
    `helm template ${chartName} --show-only ${templatePath}`,
    { cwd: directoryToRenderFrom },
  ).toString();
}

function renderConfigMap(configMapName) {
  const templatePath = `templates/configmaps/${configMapName}-configmap.template.yml`;
  return renderHelmTemplate(templatePath);
}

function getSchema(filePath) {
  const fullSchemaPath = path.resolve(__dirname, filePath);
  return JSON.parse(fs.readFileSync(fullSchemaPath).toString());
}

function getConfigMapSchema(configMapName) {
  const configMapPath = `../schema/${configMapName}-configmap.json`;
  return getSchema(configMapPath);
}

function validateConfigMap(configMapName) {
  const configMap = yaml.safeLoad(renderConfigMap(configMapName));
  const config = JSON.parse(configMap.data.config);
  const schema = getConfigMapSchema(configMapName);
  const ajv = new Ajv({ allErrors: true, strictTypes: true, strictTuples: true });
  const valid = ajv.validate(schema, config);
  if (!valid) {
    console.error(ajv.errors);
  }
  return valid;
}

describe('configMap JSON are valid', () => {
  it('catalogue asset repo', () => {
    expect(validateConfigMap('catalogue-asset-repo')).toEqual(true);
  });

  it('clusters', () => {
    expect(validateConfigMap('clusters')).toEqual(true);
  });

  it('image', () => {
    expect(validateConfigMap('image')).toEqual(true);
  });
  it('oidc', () => {
    expect(validateConfigMap('oidc')).toEqual(true);
  });

  it('storage', () => {
    expect(validateConfigMap('storage')).toEqual(true);
  });

  it('feature-flags', () => {
    expect(validateConfigMap('feature-flags')).toEqual(true);
  });
});

