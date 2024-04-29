// Copyright 2024 Google LLC

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     https://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


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
let entityStringified;

if (entityType === 'function') {
  return;
}

if (entityType === 'object' || entityType === 'array') {
  entityStringified = JSON.stringify(entity);
} else {
  entityStringified = makeString(entity);
}

return entityStringified;


___TESTS___

scenarios: []


___NOTES___

Created on 3/28/2024, 6:30:28 PM
