module Bot_Report
	class Income_stmt
		attr_accessor :file

		def initialize(is_array)
			@file = Hash.new(0)
			#converts the passed array into a hash containing the first entry as key, and the following numbers as fixed nums. 
			is_array.each do 
				|x,y|; @file[x]=y[0][1..-1].map! do |a| 
					if !a.nil?
						a.gsub(',','').to_f  
					end
				end
			end
			build_totals
		end

		def build_totals
			build_total_revenue
			build_costs_of_revenue
			build_total_costs_of_revenue
			gross_income_from_operations
			net_income_from_operations
			net_income
		end

		def total(arrays)
			ans = arrays.transpose.map!{|x| x.inject(:+)}
			return ans
		end
		
		def build_total_revenue(file=@file)
			if file["total_revenue"]==0
				revenue_source = []
				file.each_pair do |key,val|    
					revenue_source.push(val) if key[0..14]== "revenue_segment"
				end
				file["total_revenue"] = total(revenue_source)
			end
		end

		def build_costs_of_revenue(file=@file)
				costs = []
				file.each_pair do |key,val|    
					costs.push(val) if key[0..24]== "cost_and_expenses_segment"
				end
				@file["cost_and_expenses"] = total(costs)
		end

		def build_total_costs_of_revenue(file=@file)
			if file["total_costs_and_expenses"]==0
				costs = []
				costs.push(file["cost_and_expenses"]).push(file["advertising"]).push(file["research_and_development"]).push(file["sales_general_and_administrative"]).push(file["depreciation"])
				@file["total_costs_and_expenses"] = total(costs)
			end
		end

		def gross_income_from_operations(file=@file)
			if file["income_from_operations"]==0
				b = file["total_revenue"]
				a = file["total_costs_and_expenses"]
				c = a.zip(b).map { |x, y| y - x }
				@file["income_from_operations"] = c
			end		
		end

		def net_income_from_operations(file=@file)
			if file["net_income_from_operations"] == 0
				arr = []; arr2 = []
				arr.push(file["income_from_operations"]).push(file["interest_and_other_income"])
				a = total(arr)
				arr2.push(file["interest_expense"]).push(file["tax_expense"])
				b = total(arr2)
				c = a.zip(b).map { |x, y| x - y }
				@file["net_income_from_continuing_operations"] = c
			end		
		end		

		def net_income(file=@file)
			if file["net_income"]==0
				a = file["net_income_from_continuing_operations"]
				b = file["net_income_from_discontinued_operations"]
				c = a.zip(b).map { |x, y| x + y }
				@file["net_income"] = c
			end		
		end
	end
end