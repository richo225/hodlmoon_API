# frozen_string_literal: true

namespace :coin_icons do
  desc 'Attach icon files to coin models'
  task :attach_files, [:path] => :environment do |_t, args|
    ICONS_DIRECTORY = args[:path] || 'lib/import/icons/32@2x'

    start_time = Time.now

    puts 'Iterating through icon files........'
    Dir.each_child(ICONS_DIRECTORY) do |file_name|
      puts 'Retrieving file name.....'
      icon_name = file_name.match(/.+?(?=@)/)

      puts "Finding coin #{icon_name}....."
      coin = Coin.find_by(symbol: icon_name.to_s.upcase)
      next unless coin

      puts "Attaching #{file_name}....."
      coin.icon.attach(io: File.open("#{ICONS_DIRECTORY}/#{file_name}"), filename: file_name)
      coin.icon.analyze

      puts "#{file_name} attached successfully"
    end

    puts "Completed in #{Time.now - start_time} seconds"
  end
end
