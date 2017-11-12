class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]
  before_action :set_smoothie, only: [:create]

  def create
    @dose = Dose.new(dose_params)
    @dose.smoothie = @smoothie
    if @dose.save
      redirect_to smoothie_path(@dose.smoothie)
    else
      render "smoothies/show"
    end
  end

  def destroy
    @dose.destroy
    # no need for app/views/doses/destroy.html.erb
    redirect_to smoothie_path(@dose.smoothie)
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def set_smoothie
    @smoothie = Smoothie.find(params[:smoothie_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
