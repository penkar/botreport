module Bot_Report
	class Balance_sheet
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
			total_cash_cash_equivalents
			total_current_assets
			total_non_current_assets
			total_assets
			total_current_liabilities
			total_non_current_liabilities
			total_equity
		end

		def total(arrays)
			ans = arrays.transpose.map!{|x| x.inject(:+)}
			return ans
		end

		def total_cash_cash_equivalents(file=@file)
			if file["total_current_assets"]==0
				assets = []
				assets.push(file["cash_and_cash_equivalents"]).push(file["notes_and_accts_receivable_less_doubtful_amounts"]).push(file["marketable_securities"])
				file["total_cash_cash_equivalents"] = total(assets)
			end
		end

		def total_current_assets(file=@file)
			if file["total_current_assets"]==0
				assets = []
				assets.push(file["total_cash_cash_equivalents"]).push(file["accts_receivable"]).push(file["inventories"]).push(file["receivable_under_repurchase"]).push(file["deferred_income"]).push(file["prepaid_revenue"])
				file["total_current_assets"] = total(assets)
			end
		end

		def total_non_current_assets(file=@file)
			if file["total_noncurrent_assets"]==0
				assets = []
				assets.push(file["prepaid_revenue_non_current"]).push(file["non_marketable_equity_investments"]).push(file["property_plant_and_equipment"]).push(file["receivable_under_repurchase"]).push(file["intangible_assets"]).push(file["goodwill"])
				file["total_noncurrent_assets"] = total(assets)
			end
		end

		def total_assets(file=@file)
			if file["total_assets"]==0
				assets = []
				assets.push(file["total_noncurrent_assets"]).push(file["total_current_assets"])
				file["total_assets"] = total(assets)
			end
		end

		def total_current_liabilities(file=@file)
			if file["current_liabilities"]==0
				assets = []
				assets.push(file["accounts_payable"]).push(file["short_term_debt"]).push(file["accrued_compensation_and_benefits"]).push(file["accrued_expenses_and_other_current_liabilities"]).push(file["accrued_rev_share"]).push(file["securities_lending_payable"]).push(file["deferred_revenue"]).push(file["income_taxes_payable"])
				file["current_liabilities"] = total(assets)
			end
		end

		def total_non_current_liabilities(file=@file)
			if file["non_current_liabilities"]==0
				assets = []
				assets.push(file["long_term_debt"]).push(file["deferred_revenue_non_current"]).push(file["income_taxes_non_current"]).push(file["deferred_income_taxes_non_current"]).push(file["other_long_term_liabilities"])
				file["non_current_liabilities"] = total(assets)
			end
		end

		def total_equity(file=@file)
			if file["equity"]==0
				assets = []
				assets.push(file["stockholders_equity"]).push(file["stock_convertible"]).push(file["stock_common_class_a"]).push(file["retained_earnings"]).push(file["accumulated_other_comprehensive_income"])
				file["equity"] = total(assets)
			end
		end
	end
end