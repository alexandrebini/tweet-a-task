module Integrations
  @all = []

  def self.push(klass)
    @all.push klass
  end

  def self.all
    @all
  end
end

require_relative 'integrations/base'
require_relative 'integrations/redbooth'