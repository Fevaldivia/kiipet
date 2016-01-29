class Payment < ActiveRecord::Base

  after_initialize :set_initial_status

  belongs_to :booking
  belongs_to :profile

  state_machine :state, :initial => :pending do
    state :pending, :paid, :cancel

    event :paid do
      transition pending: :paid
    end

    event :cancel do
      transition pending: :cancel
    end
  end

  def set_initial_status
    self.state ||= :pending
  end
end
