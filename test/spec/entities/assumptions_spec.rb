require_relative '../spec_helper.rb'

describe Bot_Report::Assumptions do 
	it 'It should be able to process all assumptions given.' do
		hash = {"company_name"=>[["company_name",'hello']],"tax_rate"=>[["tax_rate",'0.07']],"interest_rate"=>[["interest_rate",'0.03']],"future_growth"=>[["future_growth",'0.06']]}
		a = Bot_Report::Assumptions.new(hash)
		expect(a.name).to eq('hello')	
		expect(a.int_rate).to eq(0.03)	
		expect(a.tax_rate).to eq(0.07)	
		expect(a.growth).to eq(0.06)		
	end
end