require 'spec_helper'

describe Manager do
  it 'must belongs to a task' do
    build(:manager, task: nil).valid?.must_equal false
  end
end