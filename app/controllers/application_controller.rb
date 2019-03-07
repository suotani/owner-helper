class ApplicationController < ActionController::Base
    
    # rescue_from StandardError, with: :render_standard
    rescue_from StandardError, with: :notify_standard
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    
  def render_404(e = nil)
    if e
      logger.info "Rendering 404 with exception: #{e.message}"
    end
    render file: Rails.root.join('public/404.html'), status: 404, layout: false, content_type: 'text/html'
  end
  
  def notify_standard(e = nil)
    if e
      logger.info "Rendering 404 with exception: #{e.message}" if e
      logger.error e.backtrace.join("\n")
      notifier = Slack::Notifier.new(Rails.application.config.slack_webhook_url)
      notifier.ping("-------------\n" + e.message + "\n" + e.backtrace.join("\n"))
    end
    render file: Rails.root.join('public/500.html'), status: 500, layout: false, content_type: 'text/html'
  end
end
