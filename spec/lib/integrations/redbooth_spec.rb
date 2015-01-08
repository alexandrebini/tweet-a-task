require 'spec_helper'

describe Integrations::Redbooth do
  it '#create_task' do
    proc { Integrations::Redbooth.new.create_task('foo') }.must_be_silent
  end
end