require './lib/use_cases/optionpricing.rb'

class HomeController < ApplicationController
  def login
  end

  def options
  end

  def options_price
  	options = Black_Scholes.new(params['price'],params['time'],params['strike'],params['rf'],params['vol'])
  	options.build_options
  	results = options.return_hash
  	render json: results
  end

  def american_options
  end

  def american_options_price
    option = FinanceEngine::American_Options.new(params['price'].to_f, params['vol'].to_f, params['rf'].to_f, params['strike'].to_f)
    option.build_american_options(1, 4)
    prices = {'put'=> option.tree['original_']['put'], 'call'=>option.tree['original_']['call']}
    render json: prices
  end

  def ggm
  end

  def ggm_calc
    hash = {}
    hash[:dividend]= params["dividend"].to_f if params["dividend"].length>0
    hash[:growth]= params["growth"].to_f if params["growth"].length>0
    hash[:value]= params["value"].to_f if params["value"].length>0
    hash[:rate]= params["rate"].to_f if params["rate"].length>0
    variable = FinanceEngine::Equity.gordon_growth_model(hash).round(2)
    render json: variable
  end
end
