class PaymentMethod < ActiveRecord::Base

  store :metadata

  scope :ascending, order('id asc')
  scope :enabled,  where(enabled: true)
  scope :disabled, where(enabled: false)

  include Permalink::Builder

  # By default payment_method does not require that application must use SSL.
  # Individual payment method should override this method.
  def use_ssl?
    false
  end

  def demodulized_underscore
    self.class.name.demodulize.underscore
  end

  def self.partialize
    name.gsub("PaymentMethod::","").underscore
  end

  # return true if payment method is running in live mode
  def live_mode?
    !test_mode?
  end

  # return true if payment method is running in test mode
  def test_mode?
    self.mode == 'test'
  end

  def self.current
    self.first
  end

end
