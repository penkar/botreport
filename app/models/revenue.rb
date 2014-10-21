class Revenue < ActiveRecord::Base
  belongs_to :incomestmts
  serialize :amount
end
