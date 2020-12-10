const path = require('path');
const yaml = require('js-yaml');
const fs = require('fs');
const Ajv = require('ajv');

function validateConfigMap(configMap) {
  const template = yaml.safeLoad(fs.readFileSync(path.resolve(__dirname, `../templates/datalab/${configMap}-configmap.template.yml`)));
  const schema = JSON.parse(fs.readFileSync(path.resolve(__dirname, `../schema/${configMap}-configmap.json`)));
  const config = JSON.parse(template.data.config);
  const ajv = new Ajv({ allErrors: true });
  const valid = ajv.validate(schema, config);
  if (!valid) {
    console.error(ajv.errors);
  }
  return valid;
}

describe('configMap JSONs are valid', () => {
  it('storage', () => {
    expect(validateConfigMap('storage')).toEqual(true);
  });
});

