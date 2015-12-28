#!/bin/sh

gem install pry trash

gem install passenger
passenger-install-apache2-module
# この後 httpd.conf 設定必要


