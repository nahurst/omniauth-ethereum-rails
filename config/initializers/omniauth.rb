Rails.application.config.middleware.use OmniAuth::Builder do
  provider :ethereum #, :form => SessionsController.action(:new)
end
