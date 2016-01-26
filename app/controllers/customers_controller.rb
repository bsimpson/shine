class CustomersController < ApplicationController

  def index
    render template: 'customers/index', locals: {customers: Customer.all.limit(10) }
  end
end