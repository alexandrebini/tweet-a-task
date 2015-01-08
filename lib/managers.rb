require Rails.root.join('app/models/manager')
Dir[Rails.root.join('app/models/managers/*.rb')].each { |f| require f }
