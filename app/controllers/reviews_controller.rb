class ReviewsController < ApplicationController
  def index
     @movie = Movie.find(params[:movie_id])
     @review = @movie.reviews
  end

  def edit
     @movie = Movie.find(params[:movie_id])
     @review = @movie.reviews.find(params[:id])
  end

  def show
     @movie = Movie.find(params[:movie_id])
     @review = @movie.reviews.find(params[:id])
  end

  def new
     @movie = Movie.find(params[:movie_id])
     @review = @movie.reviews.build
  end

  def create
     @movie = Movie.find(params[:movie_id])
     @review = @movie.reviews.build(params.require(:review).permit(:details))
     if @review.save
        redirect_to movie_reviews_url(@movie,@review)
     else
        render :action => "new"
     end

  end

  def update
     @movie = Movie.find(params[:movie_id])
     @review = @movie.reviews.find(params[:id])
     if @review.update_attributes(params.require(:review).permit(:details))
        redirect_to movie_reviews_url(@movie,@review)
     else
        render :action => "edit"
     end

  end

  def destroy
     @movie = Movie.find(params[:movie_id])
     @review = @movie.reviews.find(params[:id])

     @review.destroy

     respond_to do |format|
        format.html{ redirect_to movie_reviews_path(@movie) }
        format.xml{ head :ok }
  end

end

end
