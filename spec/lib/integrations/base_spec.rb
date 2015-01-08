require 'spec_helper'

describe Integrations::Base do
  it '#create_task' do
    proc { Integrations::Base.new.create_task('foo') }.must_raise NoMethodError
  end

  it 'adds any integration that extends the base to integrations stack' do
    new_class = Class.new(Integrations::Base)
    Integrations.all.find(new_class).wont_be_nil
  end
end