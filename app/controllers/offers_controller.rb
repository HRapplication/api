class OffersController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index, :show, :all_offers]


	def index
    render json: JobOffer.all.where(is_available: available_param).to_json(include: :offers_content)
	end

	def show
    render json: JobOffer.where(id: id_param).first.to_json(include: :offers_content)
	end

  def update
    JobOffer.where(id: id_param).first.update(is_available: available_param)
    render json: JobOffer.where(id: id_param).first
  end

	def create
    offer = current_user.job_offers.create(
      title: title_param,
      is_available: true,
      offers_content_attributes: {
        content: content_param
        }
      )
    render json: offer.to_json(include: :offers_content)
	end

	def destroy
    render json: current_user.job_offers.where(id: id_param).first.destroy
	end

  def all_offers
  end

  private

  def title_param
    params.permit(:title)["title"]
  end

  def available_param
    params.permit(:is_available)["is_available"]
  end

  def content_param
    params.permit(:content)["content"]
  end

  def id_param
    params.permit(:id)["id"]
  end


  swagger_controller :offers, "Offers Management"

  swagger_api :index do
    summary "Zwraca wszystkie dodane aktualne oferty pracy"
    param :query, :is_available, :boolean, :required, "dostępne/niedostępne"
  end

  swagger_api :show do
    summary "Zwraca jedną pozycję ofery pracy"
    param :path, :id, :integer, :required, "Id danej pozycji"
  end

  swagger_api :update do
    summary "Aktualizuje is_available jeden pozycji ofery pracy"
    param :path, :id, :integer, :required, "Id danej pozycji"
    param :form, :is_available, :boolean, :required, "Id danej pozycji"
  end


  swagger_api :create do
    summary "Tworzy pozyjcę na terminarzu"
    notes "godziny są zwracane w strefie UTC"
    param :form, :title, :string, :required, "Tytuł oferty"
    param :form, :content, :string, :required, "Opis oferty"
  end

  swagger_api :destroy do
    summary "Usuwa pozycję oferty pracy z danym id"
    param :path, :id, :integer, :required, "Id danej pozycji"
  end
end
