VCR.configure do |config|
  config.default_cassette_options = {
    #record: :none
    record: :new_episodes
  }
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
end

VCR.turn_on!

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
end
