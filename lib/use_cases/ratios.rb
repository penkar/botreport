module Bot_Report
	module Ratio_Class
		class Performance
			attr_accessor :ratios, :project_id
			def initialize(project_id)
				@project_id = project_id
				@ratios = {}
				# @path = Bot_Report.record.entities
				build_hashes
				# build_ratios
			end

			def return_ratio
				return @ratios
			end

			def build_ratios
				profit_margin; asset_turnover; financial_leverage; return_on_equity
				p @ratios
			end

			def build_hashes
				@ratios[:profit_margin]= {
					:project_id => @project_id, :ratio => ' ', :name=>'Profit Margin', :description => 'Measure of profitability calculated as net income divided by revenues. Of every dollar created how much does the company keep in earnings as compared to paid out as expenses. The higher the ratio the more profitable the revenue source.'
				}
				@ratios[:asset_turnover]= {
					:project_id => @project_id, :ratio => ' ', :name=>'Asset Turnover Ratio', :description => 'Measure of the gross sales revenue to total dollar values of assets used to create said revenue. The higher the ratio the better the more efficient the asset usage..'
				}
				@ratios[:financial_leverage]= {
					:project_id => @project_id, :ratio => ' ', :name=>'Financial Leverage Ratio', :description => 'The measure of assets on hand compared to the value of owners equity. Used to evaluate a company\'s dependeance on debt for funding. Evaluation depends on industry.'
				}
				@ratios[:return_on_equity]= {
					:project_id => @project_id, :ratio => ' ', :name=>'Return on Equity', :description => 'Measure of dollar earnings compared to the value of owners equity. Essentially how much has been earned per shareholder.'
				}
				@ratios[:dupont]= {
					:project_id => @project_id, :ratio => ' ', :name=>'What is Dupont ROE', :description => 'Demonstrated above Dupont Analysis is a break down of the Return on Equity into three separate ratios. Return on Equity is seaparted into: Net Income / Gross Revenue ; Gross Revenue / Total Assets ; and Total Assets / Shareholder\'s Equity. This break down of return on equity reveals further information of a company\'s source of profits and ability to generate profits.'
				}
			end

			def profit_margin
				@ratios[:profit_margin][:ratio] = (Project.find(@project_id).income_stmts.first.net_income.first / Project.find(@project_id).income_stmts.first.total_revenue.first).round(4)
			end
			def asset_turnover
				@ratios[:asset_turnover][:ratio] = (Project.find(@project_id).income_stmts.first.total_revenue.first / Project.find(@project_id).balance_sheets.first.total_assets.first).round(4)
			end
			def financial_leverage
				@ratios[:financial_leverage][:ratio] = (Project.find(@project_id).balance_sheets.first.total_assets.first / Project.find(@project_id).balance_sheets.first.equity.first).round(4)
			end
			def return_on_equity
				@ratios[:return_on_equity][:ratio] = (Project.find(@project_id).income_stmts.first.net_income.first / Project.find(@project_id).balance_sheets.first.equity.first).round(4)
			end
		end

	end
end