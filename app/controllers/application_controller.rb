class ApplicationController < ActionController::Base
    
    # rescue_from StandardError, with: :render_standard
    
    #   def render_standard(e = nil)
    #     if e
    #       logger.error e 
    #       logger.error e.backtrace.join("\n") 
    #     end
    #     #render template: '500', status: 500, layout: 'application', content_type: 'text/html'
    #   end
end
