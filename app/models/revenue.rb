class Revenue < ActiveRecord::Base
  belongs_to :projects
  serialize :amount
end
