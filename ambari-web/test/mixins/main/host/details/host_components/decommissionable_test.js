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

require('mixins/main/host/details/host_components/decommissionable');

var decommissionable,
  view,
  statusCases = [
    {
      status: App.HostComponentStatus.started,
      expected: false
    },
    {
      status: 'status',
      expected: true
    }
  ],
  responseCases = [
    {
      HostRoles: {
        desired_admin_state: 'state'
      },
      ServiceComponentInfo: 'info'
    },
    {
      HostRoles: {
        desired_admin_state: null
      },
      ServiceComponentInfo: null
    }
  ],
  textCases = [
    {
      available: true,
      text: Em.I18n.t('common.decommission')
    },
    {
      available: false,
      text: Em.I18n.t('common.recommission')
    }
  ];

describe('App.Decommissionable', function () {

  beforeEach(function () {
    decommissionable = Em.Object.create(App.Decommissionable);
  });

  describe('#isComponentDecommissionDisable', function () {
    statusCases.forEach(function (item) {
      it('should be ' + item.expected, function () {
        decommissionable.set('content', {
          service: {
            workStatus: item.status
          }
        });
        expect(decommissionable.get('isComponentDecommissionDisable')).to.equal(item.expected);
      });
    });
  });

  describe('#getDesiredAdminStateSuccessCallback', function () {
    responseCases.forEach(function (item) {
      var state = item.HostRoles.desired_admin_state;
      it('should return ' + state, function () {
        decommissionable.getDesiredAdminStateSuccessCallback(item);
        expect(decommissionable.get('desiredAdminState')).to.equal(state);
      });
    });
  });

  describe('#getDesiredAdminStateErrorCallback', function () {
    it('should return null', function () {
      decommissionable.getDesiredAdminStateErrorCallback();
      expect(decommissionable.get('desiredAdminState')).to.be.a('null');
    });
  });

  describe('#getDecommissionStatusSuccessCallback', function () {
    responseCases.forEach(function (item) {
      var state = item.ServiceComponentInfo;
      it('should return ' + state, function () {
        decommissionable.getDecommissionStatusSuccessCallback(item);
        expect(decommissionable.get('decommissionedStatusObject')).to.equal(state);
      });
    });
  });

  describe('#getDecommissionStatusErrorCallback', function () {
    it('should return null', function () {
      decommissionable.getDecommissionStatusErrorCallback();
      expect(decommissionable.get('decommissionedStatusObject')).to.be.a('null');
    });
  });

  describe('#decommissionView.text', function () {

    beforeEach(function () {
      view = decommissionable.decommissionView.create();
      view.reopen({
        parentView: decommissionable
      });
    });

    textCases.forEach(function (item) {
      it('should be ' + item.text, function () {
        view.set('parentView.isComponentDecommissionAvailable', item.available);
        expect(view.get('text')).to.equal(item.text);
      });
    });

  });

});
