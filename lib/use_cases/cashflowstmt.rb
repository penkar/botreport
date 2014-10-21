module Bot_Report
	class Cash_flow
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

		def total(arrays)
			ans = arrays.transpose.map!{|x| x.inject(:+)}
			return ans
		end

		def build_totals
			net_cash_flow_operations
			net_cash_flow_investing
			net_cash_flow_financing
			cash_and_cash_equivalents_end
		end

		def net_cash_flow_operations(file=@file)
			if @file["net_cash_flow_operations"] == 0
				cf = []
				cf.push(file["net_income"]).push(file["cf_adjustments"]).push(file["depreciation_and_amortization"]).push(file["stock_based_compensation"]).push(file["tax_benefits"]).push(file["deferred_income_taxes"]).push(file["impairment_of_equity_investments"]).push(file["gain_on_divestitures"]).push(file["other"]).push(file["cf_change_in_assets"])
				@file["net_cash_flow_operations"] = total(cf)
			end
		end

		def net_cash_flow_investing(file=@file)
			if @file["net_cash_flow_investing"] == 0
				cf = []
				cf.push(file["purchase_property_plant_equipment"]).push(file["purchase_marketable_securities"]).push(file["maturities_sales_of_marketable_securities"]).push(file["investments_in_non_marketable_equity_investments"]).push(file["cash_collateral"]).push(file["investments_in_reverse_repurchase_agreements"]).push(file["proceeds_from_divestiture"]).push(file["acquisitions"])
				@file["net_cash_flow_investing"] = total(cf)
			end
		end

		def net_cash_flow_financing(file=@file)
			if @file["net_cash_flow_financing"] == 0
				cf = []
				cf.push(file["net_payments_stock_awards"]).push(file["excess_tax_benefits"]).push(file["proceeds_from_debt_issuance"]).push(file["debt_repayment"])
				@file["net_cash_flow_financing"] = total(cf)
			end
		end

		def cash_and_cash_equivalents_end(file=@file)
			if @file["cash_and_cash_equivalents_end"] == 0
				cf = []
				cf.push(file["net_cash_flow_financing"]).push(file["net_cash_flow_investing"]).push(file["net_cash_flow_operations"]).push(file["exchange_rate_cash_equivalents"]).push(file["net_increase_decrease_cash_equivalents"])
				cf = total(cf)
				cf = @file["cash_and_cash_equivalents_beg"].zip(cf).map { |x, y| y - x }
				@file["cash_and_cash_equivalents_end"] = cf
			end
		end
	end
end