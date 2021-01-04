const path = require('path');
const yaml = require('js-yaml');
const fs = require('fs');
const Ajv = require('ajv');

// replace known booleans like {{ .Values.catalogueAvailable }} with false, so JSON can be parsed and checked
function replaceKnownBooleans(rawConfigString) {
  const knownBooleans = ['catalogueAvailable'];
  const reducer = (accumulator, currentValue) => accumulator.replace(`{{ .Values.${currentValue} }}`, 'false');
  const configString = knownBooleans.reduce(reducer, rawConfigString);
  return configString;
}

function validateConfigMap(configMap) {
  const template = yaml.safeLoad(fs.readFileSync(path.resolve(__dirname, `../helm/datalab/templates/configmaps/${configMap}-configmap.template.yml`)));
  const configString = replaceKnownBooleans(template.data.config);
  const config = JSON.parse(configString);
  const schema = JSON.parse(fs.readFileSync(path.resolve(__dirname, `../schema/${configMap}-configmap.json`)));
  const ajv = new Ajv({ allErrors: true });
  const valid = ajv.validate(schema, config);
  if (!valid) {
    console.error(ajv.errors);
  }
  return valid;
}

describe('configMap JSON are valid', () => {
  it('catalogue', () => {
    expect(validateConfigMap('catalogue')).toEqual(true);
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
});

