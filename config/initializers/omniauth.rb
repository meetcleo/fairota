Rails.application.config.middleware.use OmniAuth::Builder do
  provider :openid_connect,
    name: :okta,
    issuer: ENV["OKTA_ISSUER"],
    discovery: true,
    scope: %i[openid email profile],
    response_type: :code,
    pkce: true,
    client_options: {
      identifier: ENV["OKTA_CLIENT_ID"],
      secret: ENV["OKTA_CLIENT_SECRET"],
      redirect_uri: ENV.fetch("OKTA_REDIRECT_URI", "http://localhost:3000/auth/okta/callback")
    }
end
