class MusiciansController < ApplicationController
  def index
    @musicians = Musician.all
  end

  def show
    @musician = Musician.find(params[:id])
  end

  def new
    @musician = Musician.new
  end

  def edit
    @musician = Musician.find(params[:id])
  end

  def create
    @musician = Musician.new(musician_params)

    if @musician.save
      redirect_to @musician
    else
      render 'new'
    end
  end

  def update
    @musician = Musician.find(params[:id])

    if @musician.update(musician_params)
      redirect_to @musician
    else
      render 'edit'
    end

  end

  def destroy
    @musician = Musician.find(params[:id])
    @musician.destroy

    redirect_to musicians_path
  end

  private

  def musician_params
    params.require(:musician).permit(:name,
                                     :surname,
                                     :date_of_birth,
                                     :description)
  end
end
