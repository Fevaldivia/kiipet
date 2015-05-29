class BankAccountTypesController < ApplicationController
  before_action :authenticate_user!

  before_action :load_bank!

  def index
    @bank_account_types = @bank.bank_account_types
  end

  private
    def load_bank!
      @bank = Bank.find(params[:bank_id])
    end
end
