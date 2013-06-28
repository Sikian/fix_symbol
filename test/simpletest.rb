lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "fix_symbol"

file = File.dirname(__FILE__) + '/tokens.yml'

class MySymbol < FixSymbol::Base
	@@use = :yml
	@@file = File.dirname(__FILE__) + '/tokens.yml'
end

puts MySymbol.new(:new).id