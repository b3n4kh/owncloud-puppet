require 'spec_helper'
describe 'owncloud' do

  context 'with defaults for all parameters' do
    it { should contain_class('owncloud') }
  end
end
