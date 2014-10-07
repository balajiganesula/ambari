/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

var App = window.App = Ember.Application.create();

App.Helpers = Ember.Namespace.create();

App.initializer({

  name: "preload",

  initialize: function(container, application) {

    application.reopen({
      /**
       * Test mode is automatically enabled if running on localhost
       * @type {bool}
       */
      testMode: (location.hostname == 'localhost')
    });

  }
});


/* Order and include as you please. */
require('scripts/router');
require('scripts/store');
require('scripts/helpers/*');
require('scripts/models/**/*');
require('scripts/mappers/server_data_mapper.js');
require('scripts/mappers/**/*');
require('scripts/controllers/*');
require('scripts/routes/*');
require('scripts/components/*');
require('scripts/views/*');
