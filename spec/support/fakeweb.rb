FakeWeb.allow_net_connect = false

Rspec.configure do |config|
  config.before(:each) do
    FakeWeb.clean_registry
  end
end
