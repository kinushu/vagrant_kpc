#!/bin/sh

gem update
gem install bundler

gem install passenger
passenger-install-apache2-module
# この後 httpd.conf 設定必要


