class ApplicationController < ActionController::Base

  rescue_from StandardError, with: :rescue_exeption

  def rescue_exeption(e = nil)
    if e
      logger.info "StandardError!: #{e.message}"
      logger.info e.backtrace.join("\n")
    end
    redirect_to root_path, alert("エラーが発生しました。")
  end
end
