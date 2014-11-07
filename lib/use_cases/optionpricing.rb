require 'distribution'

class Black_Scholes
	attr_accessor :current_stock_price, :time, :strike_price, :risk_free_rate, :volatility, :d1, :d2, :call_price, :put_price
	def initialize(stock=nil, time=nil, strike=nil, rf=nil, vol=nil)
		@current_stock_price = stock.to_f
		@strike_price = strike.to_f
		@time = time.to_f
		@risk_free_rate = rf.to_f
		@volatility = vol.to_f
		@distr_normal = Distribution::Normal::Ruby_
	end

	def build_options
		build_call_premium
		build_put_premium
		return_hash
	end

	def build_call_premium
		@d1 = (Math.log(@current_stock_price / @strike_price.to_f) + @time * (@risk_free_rate + ((@volatility ** 2) / 2))/ (@volatility * (@time**0.5)))
		@d2 = (@d1 - (@volatility*(@time**0.5)))
		@call_price = ( @current_stock_price * @distr_normal.cdf(@d1)  ) - (@strike_price * Math::E**(@time * -@risk_free_rate) * @distr_normal.cdf(@d2) )
	end

	def build_put_premium
		@put_price = ( @call_price + ( @strike_price * (Math::E**(@time * -@risk_free_rate)) ) - @current_stock_price )
	end

	def output
		puts "Stock Call Price #{@call_price.round(4)}"
		puts "Stock Put Price #{@put_price.round(4)}"
		puts "Stock Price #{@current_stock_price}"
		puts "Time #{@time}"
		puts "Stock Strike Price #{@strike_price}"
		puts "Stock Risk Free Rate #{@risk_free_rate}"
		puts "Stock Volatility #{@volatility}"
	end

	def return_hash
		hash = {
			:price => @current_stock_price.to_f.round(4), 
			:time => @time.to_f.round(4), 
			:strike => @strike_price.to_f.round(4), 
			:rf => @risk_free_rate.to_f.round(4), 
			:vol => @volatility.to_f.round(4), 
			:d1 => @d1.to_f.round(4), 
			:d2 => @d2.to_f.round(4), 
			:call => @call_price.to_f.round(4), 
			:put => @put_price.to_f.round(4)
		}
		return hash
	end

end

# a = Black_Scholes.new(15, 10, 10, 0.05, 0.1)
# a.build_options
# b = Black_Scholes.new(15, 2, 10, 0.05, 0.1)
# p b.build_options
# b.return_hash