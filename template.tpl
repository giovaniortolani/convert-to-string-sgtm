___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Convert to String",
  "categories": [
    "UTILITY"
  ],
  "description": "Converts an entity of any type (string, number, boolean, null, undefined, Array, Object or Function) to a string.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "entity",
    "displayName": "Reference to an entity to be stringified",
    "simpleValueType": true,
    "help": "Enter a reference to a variable that contains an entity to be stringified. This entity can be of any type (string, number, boolean, null, undefined, Array, Object or Function).\n\u003cbr\u003e\nIf you pass a Function as an entity, it will return \u003ci\u003eundefined\u003c/i\u003e.\n\u003cbr\u003e\nOtherwise, it will return the entity stringified.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "alwaysInSummary": true
  }
]


___SANDBOXED_JS_FOR_SERVER___

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


___TESTS___

scenarios:
- name: function as input
  code: |-
    mockData.entity = function() {};

    let variableResult = runCode(mockData);

    assertThat(variableResult).isUndefined();
- name: object as input
  code: |-
    mockData.entity = { foo: 'bar' };

    const expectedResult = JSON.stringify(mockData.entity);

    let variableResult = runCode(mockData);

    assertThat(variableResult).isEqualTo(expectedResult);
- name: array as input
  code: |-
    mockData.entity = [1, 'foo', { foo: 'bar' }];

    const expectedResult = JSON.stringify(mockData.entity);

    let variableResult = runCode(mockData);

    assertThat(variableResult).isEqualTo(expectedResult);
- name: number as input
  code: |-
    mockData.entity = 123;

    const expectedResult = makeString(mockData.entity);

    let variableResult = runCode(mockData);

    assertThat(variableResult).isEqualTo(expectedResult);
- name: string as input
  code: |-
    const expectedResult = 'foobar';

    mockData.entity = expectedResult;

    let variableResult = runCode(mockData);

    assertThat(variableResult).isEqualTo(expectedResult);
- name: boolean as input
  code: |-
    mockData.entity = true;

    const expectedResult = makeString(mockData.entity);

    let variableResult = runCode(mockData);

    assertThat(variableResult).isEqualTo(expectedResult);
- name: null as input
  code: |-
    mockData.entity = null;

    const expectedResult = makeString(mockData.entity);

    let variableResult = runCode(mockData);

    assertThat(variableResult).isEqualTo(expectedResult);
- name: undefined as input
  code: |-
    mockData.entity = undefined;

    const expectedResult = makeString(mockData.entity);

    let variableResult = runCode(mockData);

    assertThat(variableResult).isEqualTo(expectedResult);
setup: |-
  const JSON = require('JSON');
  const makeString = require('makeString');

  const mockData = {};


___NOTES___

Created on 3/28/2024, 6:30:28 PM


