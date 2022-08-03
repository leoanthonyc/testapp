class ChargesController < ApplicationController
  def index
    @successful_charges = Charge.where(paid: true)
    @failed_charges = Charge.where(paid: false)
    @disputed_charges = Charge.where(disputed: true)
  end
end
