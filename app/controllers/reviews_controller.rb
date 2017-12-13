class ReviewsController < ApplicationController
  def index
  end

   def new
    @review = Review.new
    @reviews = Review.all
  end

  def show
  	@review = Review.find(params[:id])
  end

  def create
  	 review = Review.new(review_params)
     review.save
     redirect_to review_path(review)
  end

  def edit
  	@review = Review.find(params[:id])
  end

  def update
  	review = Review.find(params[:id])
  	review.update(review_params)
  	redirect_to review_path(review)
  end

  def destroy
  	review = Review.find(params[:id])
  	review.destroy
    redirect_to :action => 'new'
  end

  def top
  end

  private
  def review_params
  	params.require(:review).permit(:title, :body)
  end

end
