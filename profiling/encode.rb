# frozen_string_literal: true

require "ruby-prof"
require "securerandom"

require "b3bm"

string = SecureRandom.random_bytes(128)

RubyProf.start

10_000.times do
  B3bm.encode(string)
end

result = RubyProf.stop

printer = RubyProf::FlatPrinter.new(result)
printer.print($stdout)
