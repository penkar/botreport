module Bot_Report
	class Assumptions
		attr_accessor :tax_rate, :int_rate, :growth, :name, :price, :shareholders
		def initialize(input_array)
			@name = input_array['company_name'][0][1] || []
			@tax_rate = input_array['tax_rate'][0][1].to_f || []
			@int_rate = input_array['interest_rate'][0][1].to_f || []
			@growth =  input_array['future_growth'][0][1].to_f || []
			@shareholders =  input_array['shareholders'][0][1].to_f || []
			@price =  input_array['stock_price'][0][1].to_f || []
		end		
	end
end