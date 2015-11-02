require Rails.root.join('lib/auth/failure_app')

Rails.configuration.middleware.use RailsWarden::Manager do |manager|
  manager.failure_app = Auth::FailureApp
end

# Setup Session Serialization
class Warden::SessionSerializer
  def serialize(record)
    record.id
  end

  def deserialize(id)
    User.find(id)
  end
end
