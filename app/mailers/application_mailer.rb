class ApplicationMailer < ActionMailer::Base
  default from: 'support@' + ENV["MAILGUN_HOSTNAME"]
  layout 'mailer'
end
