return unless Rails.env.production?

puts 'seeding exchanges.......'
Rake::Task['exchanges:seed_db'].invoke

puts 'seeding coins...........'
Rake::Task['coins:seed_db'].invoke

puts 'attaching coin icons via S3...........'
Rake::Task['coin_icons:attach_files'].invoke
