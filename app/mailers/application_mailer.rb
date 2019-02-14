class ApplicationMailer < ActionMailer::Base
  default from: 'irent-support@' + (ENV["MAILGUN_HOSTNAME"] || "example.com")
  layout 'mailer'
end
