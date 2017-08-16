# Test2::Require::Dev [![Build Status](https://secure.travis-ci.org/plicease/Test2-Require-Dev.png)](http://travis-ci.org/plicease/Test2-Require-Dev)

Only run a test in development tree or in dev releases

# SYNOPSIS

    use Test2::Require::Dev;
    use Test2::v0;
    
    ok 1; # only tested during development
          # and development releases
    
    done_testing;

# DESCRIPTION

This is module skips the test file (.t) unless it detects that it is either
running in a development tree (one without a META.json file) or on a development
release (when release\_status does not equal stable).  This is useful for tests
that you want to run during development AND on development releases with the
intent of getting cpantesters results, but do not want such experimental tests
to run for production releases.

# SEE ALSO

- [Test2::Suite](https://metacpan.org/pod/Test2::Suite)
- [Test2::Require](https://metacpan.org/pod/Test2::Require)

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2017 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
