module Bot_Report
	module Ratio_Class
		class Performance
			attr_accessor :ratios
			def initialize
				@ratios = {}
				@path = Bot_Report.record.entities
				build_hashes
				# build_ratios
			end

			def build_ratios
				profit_margin; asset_turnover; financial_leverage; return_on_equity; 
				p @ratios
			end

			def build_hashes
				@ratios[:profit_margin]= {
					:ratio => ' ', :name=>'Profit Margin', :description => 'Measure of profitability calculated as net income divided by revenues. Of every dollar created how much does the company keep in earnings as compared to paid out as expenses. The higher the ratio the more profitable the revenue source.'
				}
				@ratios[:asset_turnover]= {
					:ratio => ' ', :name=>'Asset Turnover Ratio', :description => 'Measure of the gross sales revenue to total dollar values of assets used to create said revenue. The higher the ratio the better the more efficient the asset usage..'
				}
				@ratios[:financial_leverage]= {
					:ratio => ' ', :name=>'Financial Leverage Ratio', :description => 'The measure of assets on hand compared to the value of owners equity. Used to evaluate a company\'s dependeance on debt for funding. Evaluation depends on industry.'
				}
				@ratios[:return_on_equity]= {
					:ratio => ' ', :name=>'Return on Equity', :description => 'Measure of dollar earnings compared to the value of owners equity. Essentially how much has been earned per shareholder.'
				}
			end

			def profit_margin
				@ratios[:profit_margin][:ratio] = (@path[:income_statement].file['net_income'].last.to_f / @path[:income_statement].file['total_revenue'].last).round(4)
			end
			def asset_turnover
				@ratios[:asset_turnover][:ratio] = (@path[:income_statement].file['total_revenue'].last.to_f / @path[:balance_sheet].file['total_assets'].last).round(4)
			end
			def financial_leverage
				@ratios[:financial_leverage][:ratio] = (@path[:balance_sheet].file['total_assets'].last.to_f / @path[:balance_sheet].file['equity'].last).round(4)
			end
			def return_on_equity
				@ratios[:return_on_equity][:ratio] = (@path[:income_statement].file['net_income'].last.to_f / @path[:balance_sheet].file['equity'].last).round(4)
			end
		end

	end
end