require Rails.root.join('lib/auth/failure_app')

Rails.configuration.middleware.use RailsWarden::Manager do |manager|
  manager.failure_app = Auth::FailureApp
  manager.default_scope = :user

  %w(user admin).each do |scope|
    manager.serialize_into_session(scope) do |record|
      record.id
    end

    manager.serialize_from_session(scope) do |id|
      scope.capitalize.constantize.find(id)
    end
  end
end
