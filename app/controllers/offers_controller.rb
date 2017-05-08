class OffersController < ApplicationController
	def index
    render json: JobOffer.all
	end

	def show
    render json: current_user.job_offers.where(id: id_param).first.to_json(include: :offers_content)
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
end
