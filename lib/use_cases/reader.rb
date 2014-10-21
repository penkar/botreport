require 'csv'
module Bot_Report
	class Reader
		attr_accessor :company, :years
		def readfile(filename)
			report_line = CSV.read(filename)
			report_hash = Hash.new([])
			report_hash = report_line.group_by{|i| i[0]}
			create_assumption(report_hash['assumptions'])
			create_income_stmt(report_hash['income_stmt'])
			create_balance_sheet(report_hash['bal_sheet'])
			create_cash_flow_stmt(report_hash['cf_stmt'])
			create_ratios
		end

		def create_assumption(input_array)
			#removes the key from the values array. Result of using group_by.
			input_array.map!{|array| array[1..-1]}
			#creates a new hash of each assumption title as key, and the values as values.
			assumption_array = input_array.group_by{|x| x[0]}
			a  = Bot_Report::Assumptions.new(assumption_array)
			#Links all the assumption records into teh record so there is a central repository from which to access everything.
			Bot_Report.record.entities[:assumption] = a
		end
		def create_income_stmt(input_array)
			input_array.map!{|array| array[1..-1]}
			is_array = input_array.group_by{|x| x[0]}
			a  = Bot_Report::Income_stmt.new(is_array)
			Bot_Report.record.entities[:income_statement] = a
		end
		def create_balance_sheet(input_array)
			input_array.map!{|array| array[1..-1]}
			bal_sht = input_array.group_by{|x| x[0]}
			a  = Bot_Report::Balance_sheet.new(bal_sht)
			Bot_Report.record.entities[:balance_sheet] = a
		end
		def create_cash_flow_stmt(input_array)
			input_array.map!{|array| array[1..-1]}
			cf_stmt = input_array.group_by{|x| x[0]}
			a  = Bot_Report::Cashflow.new(cf_stmt)
			Bot_Report.record.entities[:cash_flows] = a
		end
		def create_ratios
			a  = Bot_Report::Ratio_Class::Performance.new
			Bot_Report.record.entities[:ratio_performance] = a
		end
	end
end


