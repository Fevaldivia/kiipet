require 'khipu-api-client'

Khipu.configure do  |c|
  c.secret           = ENV['KHIPU_SECRET']
  c.receiver_id      = ENV['KHIPU_RECEIVER_ID']
  c.platform         = 'Kiipet'  # (optional) please let us know :)
  c.platform_version = '0.1'
end
