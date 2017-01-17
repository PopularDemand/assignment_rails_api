class ReviewsController < ApplicationController

  def index
    @reviews = Review.order(created_at: :desc)
  end

  def show
    @review = Review.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @review = Review.new(strong_review_params)
    if @review.save
      respond_to do |format|
        format.html { redirect_to reviews_path }
        format.js { render :show}
      end
    else
      render reviews_path
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private

  def strong_review_params
    params.require(:review).permit(:reviewer_name,
      :title, :review_text, :movie_id)
  end
end
