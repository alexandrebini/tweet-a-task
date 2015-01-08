require 'spec_helper'

describe Phrase do
  it 'must have a text' do
    build(:phrase, text: nil).valid?.must_equal false
    build(:phrase, text: 'foo').valid?.must_equal true
  end

  it 'text must be uniq' do
    phrase = create(:phrase)
    build(:phrase, text: phrase.text).valid?.must_equal false
  end
end