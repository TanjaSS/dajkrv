desc "Remind all users"
task :remind_users => :environment do
  puts "Reminding all users..."
  
  if Date.today.wday == 1
    User.to_remind.each do |user|
      UserMailer.remind(user).deliver_now
    end
  end

  puts "Done."
end
