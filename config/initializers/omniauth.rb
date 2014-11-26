OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '704755216304395', 'c8d329ef829e1b6c453f1112a8059e2f'
end