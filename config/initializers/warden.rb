require Rails.root.join('lib/warden/failure_app')
require Rails.root.join('lib/warden/password_strategy')

Rails.configuration.middleware.use RailsWarden::Manager do |manager|
  manager.default_strategies :password_strategy
  manager.failure_app = FailureApp
end

# Setup Session Serialization
class Warden::SessionSerializer
  def serialize(record)
    record.id
  end

  def deserialize(keys)
    klass, id = keys
    klass.find_by(id: id)
  end
end
