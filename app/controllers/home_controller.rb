require './lib/use_cases/optionpricing.rb'

class HomeController < ApplicationController
  def login
  end

  def options
  	@user = current_user.id
  end

  def options_price
  	options = Black_Scholes.new(params['price'],params['time'],params['strike'],params['rf'],params['vol'])
  	options.build_options
  	results = options.return_hash
  	render json: results
  end

  def ggm
    @user = current_user.id
    # variable = FinanceEngine::Equity.gordon_growth_model(hash)
  end

  def ggm_calc
    @user = current_user.id
    hash = {}
    hash[:dividend]= params["dividend"].to_f if params["dividend"].length>0
    hash[:growth]= params["growth"].to_f if params["growth"].length>0
    hash[:value]= params["value"].to_f if params["value"].length>0
    hash[:rate]= params["rate"].to_f if params["rate"].length>0
    variable = FinanceEngine::Equity.gordon_growth_model(hash)
    render json: variable
  end
end


# # {:price=>15.0, :time=>2.0, :strike=>10.0, :rf=>0.05, :vol=>0.1, :d1=>1.1833, :d2=>1.0419, :call=>5.5222, :put=>-0.4294}
# "price"=>"", "strike"=>"", "time"=>"", "rf"=>"", "vol"=>"", "commit"=>"Create"}
# 	def initialize(stock=nil, time=nil, strike=nil, rf=nil, vol=nil)