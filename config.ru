require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch("REDIS_URL_MQ") }
end

require 'sidekiq/web'
run Rack::URLMap.new('/mq-monitor' => Sidekiq::Web)

