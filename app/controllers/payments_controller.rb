class PaymentsController < ApplicationController

	def create
		@payment = payment.new(payment_params)
		if @payment.save
			redirect_to @payment.paypal_url(payment_path(@payment))
		else
			render :new
		end
	end

	private
	def payment_params
		params.require(:payment).permit(:uid, :animal_id)
    end



end
