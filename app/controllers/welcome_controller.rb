class WelcomeController < ApplicationController
    skip_before_filter :authenticate_user!

    def index
        if user_signed_in?
            redirect_to events_path
        end
    end
end
