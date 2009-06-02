# Copyright (c) 2007-2008 Michael Specht
# 
# This file is part of Proteomatic.
# 
# Proteomatic is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# Proteomatic is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with Proteomatic.  If not, see <http://www.gnu.org/licenses/>.

require 'include/proteomatic'
require 'include/externaltools'
require 'yaml'
require 'set'


class DecoyFasta < ProteomaticScript
	def run()
		if @output[:outputDatabase]
			ls_Command = "#{ExternalTools::binaryPath('ptb.decoyfasta')} --output \"#{@output[:outputDatabase]}\" --method #{@param[:targetDecoyMethod]} --keepStart #{@param[:targetDecoyKeepStart]} --keepEnd #{@param[:targetDecoyKeepEnd]} --targetFormat \"#{@param[:targetEntryPrefix]}\" --decoyFormat \"#{@param[:decoyEntryPrefix]}\" #{@input[:databases].collect { |x| '"' + x + '"'}.join(' ')}"
			#puts ls_Command
			runCommand(ls_Command, true)
		end
	end
end

lk_Object = DecoyFasta.new
