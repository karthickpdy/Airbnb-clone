class ApplicationController < ActionController::Base
  # helper :all # include all helpers, all the time
  protect_from_forgery 
  filter_parameter_logging :password, :password_confirmation 
  helper_method :current_user_session, :current_user
  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def require_user
      unless current_user
        store_location
        
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      logger.debug "ApplicationController::require_no_user"
      if current_user
        store_location
        
       # redirect_to home_index_path
        return false
      end
    end

    def store_location
      #session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

    def handle_redirection(result)

      flash[result[:class]]=result[:message]
       redirect_to result[:redirect]
    
    end

end