require 'csv'
module Bot_Report
	class Reader
		attr_accessor :company, :years
		def readfile(filename, project_id)
			report_line = CSV.read(filename)
			report_hash = Hash.new([])
			report_hash = report_line.group_by{|i| i[0]}
			create_assumption(report_hash['assumptions'], project_id)
			create_income_stmt(report_hash['income_stmt'], project_id)
			create_balance_sheet(report_hash['bal_sheet'], project_id)
			create_cash_flow_stmt(report_hash['cf_stmt'], project_id)
			# create_ratios
		end

		def create_assumption(input_array, project_id)
			input_array.map!{|array| array[1..-1]}
			assumption_array = input_array.group_by{|x| x[0]}
			a  = Bot_Report::Assumptions.new(assumption_array)
			assumption = Assumption.create(company_name: a.name, tax_rate: a.tax_rate, interest_rate: a.int_rate, future_growth: a.growth, project_id: project_id)
		end

		def create_income_stmt(input_array, project_id)
			input_array.map!{|array| array[1..-1]}
			is_array = input_array.group_by{|x| x[0]}
			a  = Bot_Report::Income_stmt.new(is_array)
			hash  = stringrocket(a, project_id)
			statement = IncomeStmt.create(hash)
		end

		def create_balance_sheet(input_array, project_id)
			input_array.map!{|array| array[1..-1]}
			bal_sht = input_array.group_by{|x| x[0]}
			a  = Bot_Report::Balance_sheet.new(bal_sht)
			hash  = stringrocket(a, project_id)
			sheet = BalanceSheet.create(hash)
		end

		def create_cash_flow_stmt(input_array, project_id)
			input_array.map!{|array| array[1..-1]}
			cf_stmt = input_array.group_by{|x| x[0]}
			a  = Bot_Report::Cash_flow.new(cf_stmt)
			hash  = stringrocket(a, project_id)
			stmt = Cashflow.create(hash)
		end

		def create_ratios
			a  = Bot_Report::Ratio_Class::Performance.new
			# Bot_Report.record.entities[:ratio_performance] = a
		end

		def stringrocket(a, project_id)
			hash={ :project_id => project_id}
			a.file.each do |x,y|
				hash[x.to_sym] = y
			end
			return hash
		end
	end
end


