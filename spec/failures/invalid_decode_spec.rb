# frozen_string_literal: true

require "b3bm"

RSpec.describe "decoding an invalid string" do
  it "raises" do
    expect {
      B3bm.decode("abc$")
    }.to raise_error(B3bm::Invalid, "`$' is not in the alphabet")
  end
end
