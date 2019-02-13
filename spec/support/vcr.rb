VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.allow_http_connections_when_no_cassette = false
  config.default_cassette_options = {
    record: ENV['CIRCLECI'].present? ? :none : :new_episodes
  }

  config.ignore_request do |request|
    URI(request.uri).path == '/__identify__'
  end
end

RSpec.configure do |config|
  config.around(:each) do |example|
    if example.metadata.fetch(:vcr, false)
      begin
        VCR.turn_on!
        example.run
      ensure
        VCR.turn_off!
      end
    else
      VCR.turned_off do
        example.run
      end
    end
  end
end

def use_vcr_cassette(cassette, **params, &block)
  if block_given?
    VCR.turn_on!
    VCR.use_cassette(cassette, **params, &block)
  else
    let(:vcr_cassette) { cassette }

    around do |example|
      use_vcr_cassette(vcr_cassette, **params) do
        example.run
      end
    end
  end
end
