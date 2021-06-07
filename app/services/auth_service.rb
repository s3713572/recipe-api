class AuthService
  COGNITO_DOMAIN = 'https://recipe-share.auth.us-east-1.amazoncognito.com'
  CLIENT_ID = '6qa580mpo6fk1g1l7529sftado'

  attr_reader :cogni2_client, :logger
  attr_accessor :access_token, :refresh_token, :id_token

  def initialize(options = {})
    @cogni2_client = Cogni2::Client.new(domain: COGNITO_DOMAIN, client_id: CLIENT_ID, redirect_uri: redirect_uri)
    @logger = Logger.new('log/auth.log')
  end

  def bearer(code)
    cogni2_client.gain_token(code)
  end

  def user_info(access_token)
    cogni2_client.fetch_user_info(access_token)
  end

  def request_new_token(refresh_token)
    cogni2_client.request_new_token(refresh_token)
  end

  def redirect_uri
    ENV['REDIRECT_URL'] || 'http://localhost:3000/auth/authorize'
  end
end