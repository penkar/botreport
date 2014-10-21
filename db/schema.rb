# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141021142719) do

  create_table "assumptions", force: true do |t|
    t.text     "company_name"
    t.decimal  "tax_rate",      precision: 6, scale: 4
    t.decimal  "interest_rate", precision: 6, scale: 4
    t.decimal  "future_growth", precision: 6, scale: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
  end

  create_table "balance_sheets", force: true do |t|
    t.text     "cash_and_cash_equivalents"
    t.text     "notes_and_accts_receivable_less_doubtful_amounts"
    t.text     "marketable_securities"
    t.text     "accts_receivable"
    t.text     "inventories"
    t.text     "receivable_under_repurchase"
    t.text     "deferred_income"
    t.text     "prepaid_revenue"
    t.text     "prepaid_revenue_non_current"
    t.text     "non_marketable_equity_investments"
    t.text     "property_plant_and_equipment"
    t.text     "intangible_assets"
    t.text     "goodwill"
    t.text     "accounts_payable"
    t.text     "short_term_debt"
    t.text     "accrued_compensation_and_benefits"
    t.text     "accrued_expenses_and_other_current_liabilities"
    t.text     "accrued_rev_share"
    t.text     "securities_lending_payable"
    t.text     "deferred_revenue"
    t.text     "income_taxes_payable"
    t.text     "total_current_liabilities"
    t.text     "long_term_debt"
    t.text     "deferred_revenue_non_current"
    t.text     "income_taxes_non_current"
    t.text     "deferred_income_taxes_non_current"
    t.text     "other_long_term_liabilities"
    t.text     "long_term_obligations"
    t.text     "stockholders_equity"
    t.text     "stock_convertible"
    t.text     "stock_common_class_a"
    t.text     "accumulated_other_comprehensive_income"
    t.text     "retained_earnings"
    t.text     "total_stockholders_equity"
    t.text     "total_liabilities_and_stockholder_equity"
    t.text     "total_cash_cash_equivalents"
    t.text     "total_current_assets"
    t.text     "total_noncurrent_assets"
    t.text     "total_assets"
    t.text     "current_liabilities"
    t.text     "non_current_liabilities"
    t.text     "equity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
  end

  create_table "cashflows", force: true do |t|
    t.text     "net_income"
    t.text     "cf_adjustments"
    t.text     "depreciation_and_amortization"
    t.text     "stock_based_compensation"
    t.text     "tax_benefits"
    t.text     "deferred_income_taxes"
    t.text     "impairment_of_equity_investments"
    t.text     "gain_on_divestitures"
    t.text     "other"
    t.text     "cf_change_in_assets"
    t.text     "purchase_property_plant_equipment"
    t.text     "purchase_marketable_securities"
    t.text     "maturities_sales_of_marketable_securities"
    t.text     "investments_in_non_marketable_equity_investments"
    t.text     "cash_collateral"
    t.text     "investments_in_reverse_repurchase_agreements"
    t.text     "proceeds_from_divestiture"
    t.text     "acquisitions"
    t.text     "net_payments_stock_awards"
    t.text     "excess_tax_benefits"
    t.text     "proceeds_from_debt_issuance"
    t.text     "debt_repayment"
    t.text     "exchange_rate_cash_equivalents"
    t.text     "net_increase_decrease_cash_equivalents"
    t.text     "cash_and_cash_equivalents_beg"
    t.text     "cash_paid_for_taxes"
    t.text     "cash_paid_for_interest"
    t.text     "non_cash_investing_and_financing"
    t.text     "net_cash_flow_operations"
    t.text     "net_cash_flow_investing"
    t.text     "net_cash_flow_financing"
    t.text     "cash_and_cash_equivalents_end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
  end

  create_table "income_stmts", force: true do |t|
    t.integer  "revenue_segments_id"
    t.text     "cost_and_expenses_segment1"
    t.text     "cost_and_expenses_segment2"
    t.text     "advertising"
    t.text     "depreciation"
    t.text     "research_and_development"
    t.text     "sales_general_and_administrative"
    t.text     "total_costs_and_expenses"
    t.text     "interest_and_other_income"
    t.text     "interest_expense"
    t.text     "tax_expense"
    t.text     "net_income_from_discontinued_operations"
    t.text     "total_revenue"
    t.text     "cost_and_expenses"
    t.text     "income_from_operations"
    t.text     "net_income_from_continuing_operations"
    t.text     "net_income"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "revenues", force: true do |t|
    t.string   "name"
    t.integer  "incomestmt_id"
    t.text     "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "revenues", ["incomestmt_id"], name: "index_revenues_on_incomestmt_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
