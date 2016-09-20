class MusiciansController < ApplicationController
  before_action :find_musician, only: [:show, :edit, :update, :destroy]
  before_action :find_genres, only: [:new, :edit]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    if params[:genre].blank?
      @musicians = Musician.all.order("created_at DESC")
    else
      @genre_id = Genre.find_by(name: params[:genre]).id
      @musicians = Musician.where(genre_id: @genre_id).order("created_at DESC")
    end
  end

  def show
  end

  def new
    @musician = Musician.new
  end

  def edit
  end

  def create
    @musician = Musician.new(musician_params)
    @musician.genre_id = params[:genre_id]

    if @musician.save
      redirect_to @musician
    else
      render 'new'
    end
  end

  def update
    if @musician.update(musician_params)
      redirect_to musician_path(@musician)
    else
      render 'edit'
    end

  end

  def destroy
    @musician.destroy

    redirect_to musicians_path
  end

  private

  def musician_params
    params.require(:musician).permit(:name,
                                     :surname,
                                     :date_of_birth,
                                     :description,
                                     :genre_id)
  end

  def find_musician
    @musician = Musician.find(params[:id])
  end

  def find_genres
    @genres = Genre.all.map{ |c| [c.name, c.id] }
  end
end
