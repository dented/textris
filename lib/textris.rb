require 'action_controller'
require 'action_mailer'
require 'phony'

begin
  require 'twilio-ruby'
rescue LoadError
end

begin
  require 'sidekiq'
rescue LoadError
  require 'textris/delay/sidekiq/missing'

  Textris::Delay::Sidekiq.include(Textris::Delay::Sidekiq::Missing)
else
  require 'textris/delay/sidekiq'
  require 'textris/delay/sidekiq/proxy'
  require 'textris/delay/sidekiq/serializer'
  require 'textris/delay/sidekiq/worker'
end

require 'textris/base'
require 'textris/message'
require 'textris/delivery'
require 'textris/delivery/base'
require 'textris/delivery/test'
require 'textris/delivery/mail'
require 'textris/delivery/log'
require 'textris/delivery/twilio'
