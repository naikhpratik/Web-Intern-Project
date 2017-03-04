require 'carrierwave_backgrounder'

CarrierWave::Backgrounder.configure do |c|
  c.backend :delayed_job, queue: :carrierwave
end