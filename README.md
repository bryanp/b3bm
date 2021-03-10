# b3bm

Base62 for Ruby.

I built this when building a [branca](https://branca.io) implementation for Ruby. However, I would suggest you *not* use
this library and use a url-safe Base64 encoding instead as Base64 is much more efficient. How much more?

```
$ bundle exec ruby benchmarks/encode_decode.rb

Warming up --------------------------------------
                b3bm   210.000  i/100ms
              base_x   202.000  i/100ms
              base64    46.511k i/100ms
Calculating -------------------------------------
                b3bm      2.142k (± 3.2%) i/s -     10.710k in   5.006277s
              base_x      2.014k (± 3.0%) i/s -     10.100k in   5.019257s
              base64    508.645k (± 4.1%) i/s -      2.558M in   5.038325s

Comparison:
              base64:   508645.1 i/s
                b3bm:     2141.7 i/s - 237.50x  (± 0.00) slower
              base_x:     2014.2 i/s - 252.53x  (± 0.00) slower
```

Here's how to do a url-safe Base64 encode/decode in Ruby:

```ruby
require "base64"
require "securerandom"

string = SecureRandom.alphanumeric(128)
encoded = Base64.urlsafe_encode64(string, padding: false)
Base64.urlsafe_decode64(encoded)
```

Similar solutions probably exist for other languages.
