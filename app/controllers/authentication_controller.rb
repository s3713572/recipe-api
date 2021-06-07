class AuthenticationController < ApplicationController
  def authorize
    @data = AuthService.new.bearer(params[:code])

    if params[:code].blank?
      redirect_to "#{web_login_url}&error=invalid code"
    elsif @data['error']
      redirect_to "#{web_login_url}&error=#{@data['error']}"
    else
      redirect_to web_login_url
    end

  end

  def request_new_token
    @data = AuthService.new.request_new_token(params[:refresh_token])

    @data['error'] = 'Invalid token' unless params[:refresh_token].present?

    render json: @data
  end

  def user_info
    data = AuthService.new.user_info(params[:access_token])
    render json: {
      data: data
    }
  end

  private

  def web_login_url
    url = ENV['WEB_LOGIN_URL'] || 'http://localhost:8080'
    uri = URI url
    query = { 'access_token': @data['access_token'], 'expires_in': @data['expires_in'],
              type: @data['token_type'], refresh_token: @data['refresh_token'] }.to_query
    uri.query = query
    uri.to_s
  end
end
