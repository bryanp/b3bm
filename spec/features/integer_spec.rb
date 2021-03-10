# frozen_string_literal: true

require "b3bm"

RSpec.describe "integers encode/decode" do
  it "encodes" do
    expect(B3bm.encode(12321)).to eq("3Cj")
  end

  it "decodes" do
    expect(B3bm.decode("3Cj", string: false)).to eq(12321)
  end
end
