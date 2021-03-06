# Encoding: utf-8
# Copyright (c) 2013 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'spec_helper'
require 'build/dependency/dependency_helper'
require 'build/dependency/auto_reconfiguration'

describe Build::Dependency::AutoReconfiguration do
  include_context 'dependency_helper'

  it 'should create auto-reconfiguration BUILD URI' do
    expect_version_uri '1.0.0.BUILD-123', 'http://maven.gopivotal.com.s3.amazonaws.com/snapshot/org/cloudfoundry/auto-reconfiguration/1.0.0.BUILD-SNAPSHOT/auto-reconfiguration-1.0.0.BUILD-123.jar'
  end

  it 'should create auto-reconfiguration RELEASE URI' do
    expect_version_uri '1.0.0.RELEASE', 'http://maven.gopivotal.com.s3.amazonaws.com/release/org/cloudfoundry/auto-reconfiguration/1.0.0.RELEASE/auto-reconfiguration-1.0.0.RELEASE.jar'
  end

  it 'should create auto-reconfiguration pre 1.0 URI' do
    expect_version_uri '0.9.8', 'http://maven.springframework.org.s3.amazonaws.com/milestone/org/cloudfoundry/auto-reconfiguration/0.9.8/auto-reconfiguration-0.9.8.jar'
  end

  it 'should return the MMMQ for normalized' do
    expect(dependency.send(:normalize, '1.0.0.RELEASE')).to eq('1.0.0_RELEASE')
  end

end
