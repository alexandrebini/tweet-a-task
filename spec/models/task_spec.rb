require 'spec_helper'

describe Task do
  it 'must have a name' do
    build(:task, name: nil).valid?.must_equal false
    build(:task, name: 'foo').valid?.must_equal true
  end

  it 'must have a twitter id' do
    build(:task, twitter_id: nil).valid?.must_equal false
    build(:task, twitter_id: 'foo').valid?.must_equal true
  end

  it 'twitter id must be uniq' do
    task = create(:task)
    build(:task, twitter_id: task.twitter_id).valid?.must_equal false
  end
end