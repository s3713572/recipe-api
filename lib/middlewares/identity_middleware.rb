require 'jwt'

class IdentityMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    authorization = env['HTTP_AUTHORIZATION']
    if authorization.present?
      # Token should be like Barrer abc1235zxc
      # Split and get the second index
      token = authorization.split()[1]

      decoded_token = JWT.decode(token, nil, false, { algorithm: 'RS256' })
      env['username'] = decoded_token.first['username']

      expire_in = decoded_token.first['exp']

      env['is_expire'] = Time.now.getutc > Time.at(expire_in)
    end
    @app.call(env)
  end
end
