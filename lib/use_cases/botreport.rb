class BotReporter
	def self.readfile(filename)
		report_line = CSV.read(filename)
		report_hash = Hash.new([])
		report_hash = report_line.group_by{|i| i[0]}
		create_assumption(report_hash['assumptions'])
		# create_income_stmt(report_hash['income_stmt'])
		# create_balance_sheet(report_hash['bal_sheet'])
		# create_cash_flow_stmt(report_hash['cf_stmt'])
		# create_ratios
	end
end