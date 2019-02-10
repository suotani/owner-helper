namespace :mail_running_check do
  
  desc "お知らせをメールで通知する"
  
  task :send => :environment do
    ToAdminMailer.mail_running_check.deliver_now
  end
end