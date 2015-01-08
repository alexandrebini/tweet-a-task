module Integrations
  class Base
    def create_task(name)
      raise NoMethodError
    end

    def self.inherited(subclass)
      Integrations.push subclass
    end
  end
end