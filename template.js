const getType = require('getType');
const JSON = require('JSON');
const makeString = require('makeString');

const entity = data.entity;
const entityType = getType(entity);

if (entityType === 'function') {
  return;
}

if (entityType === 'object' || entityType === 'array') {
  return JSON.stringify(entity);
}

return makeString(entity);
