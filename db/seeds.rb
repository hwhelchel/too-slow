require 'faker'

puts "Deleting users and karma_points..."
User.delete_all
KarmaPoint.delete_all

ActiveRecord::Base.logger = nil

puts "Creating users..."

now = Time.now

TOTAL_KARMA = 1_500_000
TOTAL_USERS = 100_000
SLICE_SIZE  = 20_000

fields = [:first_name, :last_name, :email, :username, :created_at, :updated_at]
TOTAL_USERS.times.each_slice(SLICE_SIZE).each_with_index do |ids, index|
  data = ids.map do |i|
    [Faker::Name.first_name, Faker::Name.last_name, "email_#{i}@example.com", "user_#{i}", now, now]
  end

  puts "Inserted #{(index + 1)*SLICE_SIZE} of #{TOTAL_USERS} users..."
  User.import(fields, data, :validate => false, :timestamps => false)
end

user_ids = User.pluck(:id)
fields = [:user_id, :value, :label, :created_at, :updated_at]


TOTAL_KARMA.times.each_slice(SLICE_SIZE).each_with_index do |ids, index|
  data = ids.map do
    user_id = user_ids.sample
    [user_id, rand(1..user_id), Faker::Lorem.word, now, now]
  end

  puts "Inserted #{(index + 1)*SLICE_SIZE} of #{TOTAL_KARMA} karma points..."
  KarmaPoint.import(fields, data, :validate => false, :timestamps => false)
end
