# b3bm

Base62 for Ruby.

This library offers Base62 encoding/decoding using a methodology that is generally compatible with encodings from other
ecosystems. Unfortunately the approach is very inefficient. Just how inefficient is it? Well, here's a comparison
between `b3bm`, `base_x`, and Ruby's url-safe Base64 encoder:

```
$ bundle exec ruby benchmarks/decode.rb
Warming up --------------------------------------
                b3bm   105.000  i/100ms
              base_x    97.000  i/100ms
              base64    40.921k i/100ms
Calculating -------------------------------------
                b3bm      1.079k (± 6.8%) i/s -      5.460k in   5.089545s
              base_x    951.151  (± 4.9%) i/s -      4.753k in   5.010191s
              base64    372.882k (±11.9%) i/s -      1.841M in   5.016939s

Comparison:
              base64:   372881.6 i/s
                b3bm:     1078.9 i/s - 345.61x  (± 0.00) slower
              base_x:      951.2 i/s - 392.03x  (± 0.00) slower
```

Use [`b3e`](https://github.com/metabahn/b3e) if you care about performance more than portability.
