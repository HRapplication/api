class OffersController < ApplicationController
	def index
	end

	def show

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

	def delete
	end

  private

  def title_param
    params.permit(:title)["title"]
  end

  def content_param
    params.permit(:content)["content"]
  end
end
