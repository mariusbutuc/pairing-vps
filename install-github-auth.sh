#!/bin/bash
#
# https://github.com/chrishunt/github-auth is a gem which lets me easily
# modify the pair user's public keys by pulling them from github if I the
# pairing partner has public keys on github.
#
# One day this should be packaged, but for now I use the system ruby's
# gem to install it.

set -e

gem install github-auth
