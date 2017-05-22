class OffersController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index, :show]


	def index
    render json: JobOffer.all
	end

	def show
    render json: JobOffer.where(id: id_param).first.to_json(include: :offers_content)
	end

	def create
    offer = current_user.job_offers.create(
      title: title_param,
      offers_content_attributes: {
        content: content_param
        }
      )
    render json: offer.to_json(include: :offers_content)
	end

	def destroy
    render json: current_user.job_offers.where(id: id_param).first.destroy
	end

  private

  def title_param
    params.permit(:title)["title"]
  end

  def content_param
    params.permit(:content)["content"]
  end

  def id_param
    params.permit(:id)["id"]
  end


  swagger_controller :offers, "Offers Management"

  swagger_api :index do
    summary "Zwraca wszystkie dodane oferty pracy"
  end

  swagger_api :show do
    summary "Zwraca jedną pozycję ofery pracy"
    param :path, :id, :integer, :required, "Id danej pozycji"
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
