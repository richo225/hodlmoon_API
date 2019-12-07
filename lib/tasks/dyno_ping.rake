desc 'Pings heroku app to keep a dyno alive'
task dyno_ping: :environment do
  HTTParty.get(ENV['HODLMOON_URL'])
end
