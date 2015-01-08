require 'spec_helper'

describe Integrations::Redbooth do
  it '#create_task' do
    VCR.use_cassette('integrations/redbooth') do
      redbooth = Integrations::Redbooth.new
      redbooth.create_task('foo').response.code.must_equal '201'
    end
  end
end