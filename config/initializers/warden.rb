require Rails.root.join('lib/auth/failure_app')
require Rails.root.join('lib/auth/password_strategy')

Rails.configuration.middleware.use RailsWarden::Manager do |manager|
  manager.default_strategies :password_strategy
  manager.failure_app = Auth::FailureApp
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
