require_relative 'entities/assumptions.rb'
require_relative 'entities/balancesheet.rb'
require_relative 'entities/incomestmt.rb'
require_relative 'entities/cashflowstmt.rb'
require_relative 'entities/reader.rb'
require_relative 'entities/ratios.rb'
require_relative 'entities/record.rb'


module Bot_Report
	# attr_accessor :record
	def self.record=(x)
		@record = x
	end	
	def self.record
		@record
	end
end
Bot_Report.record = Bot_Report::Records.new
newfile = Bot_Report::Reader.new
newfile.readfile('examplefile.csv')
Bot_Report.record.entities.each {|x| x.each {|y| p y }}