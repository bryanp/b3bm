# frozen_string_literal: true

require "b3bm"

RSpec.describe "simple encode/decode" do
  it "encodes" do
    expect(B3bm.encode("abc")).to eq("QmIN")
  end

  it "decodes" do
    expect(B3bm.decode("QmIN")).to eq("abc")
  end

  it "encodes single character strings" do
    expect(B3bm.encode("0")).to eq("m")
  end

  it "encodes a longer string" do
    string = "mGJnOID9uf7lOyrd4O7Z0QStsr0ySBRi55b6wXtaY4MFG8KgL4PFWtC7SJSEmpfHpOPd80hMwnOZxj363bkhsU3CMdB1D23T259HMUeJ2V9qiNq8rZpvxEQm1di1jYnq"
    result = "OK4fPCIiPD4q0yEFVZD59KLJxMl7PY1ZjJeu9ZLTTnbaEXkEMvkZ2Kl2gjFezCCEwhlydRH9H57WXFZyelGjppjeVbYNxQSoTNSFHETcSjNAwtgxQLqaoH9mgqOk1KhOFAv9uDAdc3IEGNZGOP0KplMf3hY7MvTReJ4YDnvfFcH3"

    expect(B3bm.encode(string)).to eq(result)
  end
end
