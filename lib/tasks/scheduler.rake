desc "Remind all users"
task :remind_users => :environment do
  puts "Reminding all users..."

  User.to_remind.each do |user|
    UserMailer.remind(user).deliver_now
  end

  puts "Done."
end
