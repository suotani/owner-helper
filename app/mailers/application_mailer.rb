class ApplicationMailer < ActionMailer::Base
  default from: 'support@' + (ENV["MAILGUN_HOSTNAME"] || "example.com")
  layout 'mailer'
end
