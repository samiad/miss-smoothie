class SmoothiesController < ApplicationController
  before_action :set_smoothie, only: [:show, :edit, :update]

  def index
    @smoothies = Smoothie.all
  end

  def show
    @dose = Dose.new
  end


  def new
    @smoothie = Smoothie.new
  end

  def create
    @smoothie = Smoothie.new(smoothie_params)
    if @smoothie.save
      redirect_to smoothie_path(@smoothie)
    else
      render :new
    end
  end

  private

  def set_smoothie
    @smoothie = Smoothie.find(params[:id])
  end

  def smoothie_params
    params.require(:smoothie).permit(:name, :picture)
  end
end


