class WelcomeController < ApplicationController
    def index 
        @category = Category.all
        @hide_header = true
        render 'welcome/index'
    end
    
end

 