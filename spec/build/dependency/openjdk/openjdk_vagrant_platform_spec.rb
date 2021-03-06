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
require 'build/dependency/openjdk/openjdk_vagrant_platform'
require 'English'

describe Build::Dependency::OpenJDKVagrantPlatform do

  let(:platform) { described_class.new 'test-name', 'test-version', false }

  it 'should return 6 directory for 1.6' do
    expect(platform.send(:version_specific, '1.6.0')).to eq(File.expand_path 'resources/openjdk/6')
  end

  it 'should return 7 directory for 1.7' do
    expect(platform.send(:version_specific, '1.7.0')).to eq(File.expand_path 'resources/openjdk/7')
  end

  it 'should return 8 directory for 1.8' do
    expect(platform.send(:version_specific, '1.8.0')).to eq(File.expand_path 'resources/openjdk/8')
  end

  it 'should raise error for unknown version' do
    expect { platform.send(:version_specific, '1.5.0') }.to raise_error("Unable to process version '1.5.0'")
  end

end
