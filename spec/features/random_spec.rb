# frozen_string_literal: true

require "securerandom"
require "base_x"
require "b3bm"

RSpec.describe "using b3bm with random alphanumerics" do
  1_000.times do
    string = SecureRandom.alphanumeric((rand * 100).to_i)

    it "encodes and decodes: #{string}" do
      expect(B3bm.decode(B3bm.encode(string))).to eq(string)
    end
  end
end

RSpec.describe "using b3bm with random bytes" do
  1_000.times do
    string = SecureRandom.random_bytes((rand * 100).to_i)

    it "encodes and decodes: #{string}" do
      expect(BaseX::Base62.decode(BaseX::Base62.encode(string))).to eq(string)
      expect(B3bm.decode(B3bm.encode(string))).to eq(string)
    end
  end
end
