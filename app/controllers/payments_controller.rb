class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def create
    @payment = Payment.new(:animal_id => params[:animal_id],:user_id =>params[:user_id])
    if @payment.save!
      @animal = Animal.find(params[:animal_id])
      redirect_to paypal_url(animal_path(params[:animal_id]))
    end
  end



  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def paypal_url(return_path)
    values = {
        business: "a.b.kaluga-facilitator@gmail.com",
        cmd: "_xclick",
        upload: 1,
        return: return_path,
        amount: 5,
        item_name: @animal.name,
        item_number: @animal,
        quantity: '1'
    }
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:user_id, :animal_id)
    end

end
