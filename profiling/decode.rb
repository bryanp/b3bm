# frozen_string_literal: true

require "ruby-prof"
require "securerandom"

require "b3bm"

string = SecureRandom.random_bytes(128)
encoded = B3bm.encode(string)

RubyProf.start

10_000.times do
  B3bm.decode(encoded)
end

result = RubyProf.stop

printer = RubyProf::FlatPrinter.new(result)
printer.print($stdout)
