class Admin::PaymentsController < Admin::AdminController
  def index
    @payments = Payment.all
  end
end
