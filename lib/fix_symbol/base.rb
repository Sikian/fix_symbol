# Copyright (C) 2013 FixSymbol contributers

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# In order to contact the author of this gem, please write to sikian@gmail.com.

require 'yaml'

module FixSymbol
	class Base
		# @todo if FixSymbol is extended to use db or other data structures, should change Base to Yml and call
		# 	new classes accordigly.
		
		# Both id and token can be accessed as method.
		attr_accessor :id, :token

		@@use = nil
		@@file = nil

		public
		
		###
		# @!method initialize
		# 	Initializing, which is usually executed by AnvylToken (insted of being called directly)
		# 	allows the token/id to be set and searches for the correspondig pair.
		# 	If no value is set, the Token will just be empty.
		# 
		# 	@param value [Fixnum] Token's id.
		# 	@param value [Symbol] Token's token (symbol).
		# 	@param value [String] Token's token (symbol) which is converted to symbol.
		#
		def initialize(value=nil)
			if value
				if value.is_a? Fixnum
					self.id=value
				elsif value.is_a? Symbol
					self.token = value
				elsif value.is_a? String
					self.token = value.to_sym
				end
			end
		end
		
		###
		# @!method id
		# 	Sets Token's id and searches corresponding symbol.
		#
		def id=(id)
			@id = id
			@token = find_by_id(id)
		end
		
		###
		# @!method token
		# 	Sets Token's token and searches corresponding id.
		#
		def token=(token)
			@token = token
			@id = find_by_token(token)
		end

		###
		# @!method config
		# 	@deprecated config done when inheriting.
		# 	Sets Token's config in order to know where to get the relations from.
		# 
		# 	@option values [Symbol] :use (:yml) Where to get the data from (yml, mysql, etc.). At the moment, yml 
		# 		is the only supported parsing method.
		# 	@option values [String] :file Path to the file to parse.
		#
		# def self.config(values)
		# 	if values.is_a? Hash
		# 		values[:use] ||= :yml
		# 		@@use = values[:use] # Makes sense?
		# 		@@file = values[:file]
		# 	end
		#end

		# These methods maybe should be static to allow just searching.

		###
		# @!method find_by_id
		# Searches for the correspoding token for a given id.
		# @return [Fixnum] found id
		# @return [NilClass] nil when token is not found 	
		#
		# @note	YAML:
		# 		Make sure file exists, load with YAML and fetch in array.
		#
		def find_by_id(id)
			if @@use == :yml
				if File.exists? @@file
					data = YAML.load_file(@@file)
					begin
						token = data[id].to_sym unless data == nil
					rescue
						raise 'Token not found.'
					end
				else
					raise 'No file found.'
				end
			end
			return token
		end

		###
		# @!method find_by_token
		# Searches for the correspoding id for a given token.
		# @return [Fixnum] found id
		# @return [NilClass] nil when token is not found
		#  	
		# @note YAML:
		# 		Make sure file exists, load with YAML and use index in array.
		#
		def find_by_token(token)
			if @@use == :yml
				if File.exists? @@file
					data = YAML.load_file(@@file)
					id = data.index token.to_s unless data == nil
				else
					raise 'No file found.'
				end
			end
			return id
		end

	end
end