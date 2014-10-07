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

var App = require('app');
App.MainAdminSecurityAddStep1Controller = Em.Controller.extend({

  name: 'mainAdminSecurityAddStep1Controller',
  /**
   * identify whether ATS(Application Timeline Server) is installed
   * @return {Boolean}
   */
  isATSInstalled: function() {
    return false;
    /*return this.get('content.services').someProperty('serviceName', 'YARN') &&
      App.Service.find('YARN').get('hostComponents').someProperty('componentName', 'APP_TIMELINE_SERVER');*/
  }
});