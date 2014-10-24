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
				profit_margin; asset_turnover; financial_leverage; return_on_equity; price_earn; currentratio; quickratio; cashratio
				inerest_coverage; debt_ratio; debt_to_equity;
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
				@ratios[:price_earn] = {
					:project_id => @project_id, :ratio => ' ', :name=>'Price to Earnings Ratio', :description => 'The Price to Earnings Ratio is the Market Capitalization of a company divided by the company\'s Net Income. It is effectively a measurement of the value per dollar earned by the company. Companies with greater earnings potential tend to have greater EPS figures. IGNORED IN THE CASE OF NEGATIVE EARNINGS.'
				}
				@ratios[:currentratio] = {
					:project_id => @project_id, :ratio => ' ', :name=>'Current Ratio', :description => 'Measurement of the Short-Term assets divided by the Long-Term assets. Creditors prefer companies with higher current ratios as it indicates liquidity and and ability to pay off debt. Investors may prefer lower current ratios as it indicates the company is utilizing assets and not stockpiling cash.'
				}
				@ratios[:quickratio] = {
					:project_id => @project_id, :ratio => ' ', :name=>'Quick Ratio', :description => 'Like the Current Ratio, the Quick Ratio measures the ability of the company to pay out assets. Usually evaluated with towards the same end as the current ratio.'
				}
				@ratios[:cashratio] = {
					:project_id => @project_id, :ratio => ' ', :name=>'Cash Ratio', :description => 'Like the Current Ratio, the Cash Ratio measures the ability of the company to immediatly pay out assets. This is the more conservative of current ratios. Usually evaluated with towards the same end as the current ratio.'
				}
				@ratios[:inerest_coverage] = {
					:project_id => @project_id, :ratio => ' ', :name=>'Interest Coverage Ratio', :description => 'Like the other three liquidity ratios the Interest Coverage ratio is a measure of a company\'s ability to cover the interest payments on all sources of debt. Earnings before interest and taxes divided by Interest charges.'
				}
				@ratios[:debt_ratio] = {
					:project_id => @project_id, :ratio => ' ', :name=>'Debt Ratio', :description => 'Total debt divided by total assets. This is a leverage ratio that allows investors and interested parties to evaluate companies based on how much of their funding comes from outside debt. An overly leveraged company carries the risk of default, while an under-leveraged company will likely be using funds at a higher cost that is otherwise available.'
				}
				@ratios[:debt_to_equity] = {
					:project_id => @project_id, :ratio => ' ', :name=>'Debt to Equity Ratio', :description => 'Total debt divided by total equity. This is a leverage ratio that allows investors and interested parties to evaluate companies based on how much of their funding comes from outside debt. An overly leveraged company carries the risk of default, while an under-leveraged company will likely be using funds at a higher cost that is otherwise available.'
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
			def price_earn
				@ratios[:price_earn][:ratio] = (Project.find(@project_id).assumptions.first.price * Project.find(@project_id).assumptions.first.shareholders / Project.find(@project_id).income_stmts.first.net_income.first).round(4)
			end
			def currentratio
				@ratios[:currentratio][:ratio] = (Project.find(@project_id).balance_sheets.first.total_current_assets.first / Project.find(@project_id).balance_sheets.first.current_liabilities.first).round(4)
			end
			def quickratio
				@ratios[:quickratio][:ratio] = ((Project.find(@project_id).balance_sheets.first.total_current_assets.first - Project.find(@project_id).balance_sheets.first.inventories.first ) / Project.find(@project_id).balance_sheets.first.current_liabilities.first).round(4)
			end
			def cashratio
				@ratios[:cashratio][:ratio] = ((Project.find(@project_id).balance_sheets.first.marketable_securities.first + Project.find(@project_id).balance_sheets.first.cash_and_cash_equivalents.first) / Project.find(@project_id).balance_sheets.first.current_liabilities.first).round(4)
			end
			def inerest_coverage
				@ratios[:inerest_coverage][:ratio] = ((Project.find(@project_id).income_stmts.first.net_income.first + Project.find(@project_id).income_stmts.first.interest_expense.first + Project.find(@project_id).income_stmts.first.tax_expense.first ) / Project.find(@project_id).balance_sheets.first.current_liabilities.first).round(4)
			end
			def debt_ratio
				@ratios[:debt_ratio][:ratio] = ((Project.find(@project_id).balance_sheets.first.total_assets.first - Project.find(@project_id).balance_sheets.first.equity.first) / Project.find(@project_id).balance_sheets.first.total_assets.first).round(4)
			end
			def debt_to_equity
				@ratios[:debt_to_equity][:ratio] = ((Project.find(@project_id).balance_sheets.first.total_assets.first - Project.find(@project_id).balance_sheets.first.equity.first) / Project.find(@project_id).balance_sheets.first.equity.first).round(4)
			end
		end

	end
end