# frozen_string_literal: true

require "base64"
require "base_x"
require "benchmark/ips"
require "securerandom"

require "b3bm"

string = SecureRandom.random_bytes(128)

Benchmark.ips do |ips|
  ips.config(time: 5, warmup: 1)

  ips.report("b3bm") do
    B3bm.decode(B3bm.encode(string))
  end

  ips.report("base_x") do
    BaseX::Base62.decode(BaseX::Base62.encode(string))
  end

  ips.report("base64") do
    Base64.urlsafe_decode64(Base64.urlsafe_encode64(string, padding: true))
  end

  ips.compare!
end
