APP_ROOT=File.dirname(__FILE__)
require "#{APP_ROOT}/lib/guide"

guide=Guide.new('restaurant.txt')
guide.launch!

