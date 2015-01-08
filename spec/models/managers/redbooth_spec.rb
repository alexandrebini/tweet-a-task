require 'spec_helper'

describe Managers::Redbooth do
  describe 'Api' do
    it '#create_task' do
      VCR.use_cassette('managers/redbooth') do
        api = Managers::Redbooth::Api.new
        api.create_task('foo').response.code.must_equal '201'
      end
    end
  end

  it '#publish!' do
    VCR.use_cassette('managers/redbooth') do
      redbooth = create(:managers_redbooth)
      redbooth.pending?.must_equal true
      redbooth.publish!
      redbooth.success?.must_equal true
    end
  end
end