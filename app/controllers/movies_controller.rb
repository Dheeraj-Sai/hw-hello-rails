class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  ALLOWED_SORT_COLUMNS = %w[title rating release_date].freeze
  ALLOWED_DIRECTIONS = %w[asc desc].freeze

  # GET /movies or /movies.json
  def index
    # Update session if explicit sort parameter is provided
    if params[:sort_by].present? && ALLOWED_SORT_COLUMNS.include?(params[:sort_by])
      session[:sort_by] = params[:sort_by]
      session[:sort_direction] = ALLOWED_DIRECTIONS.include?(params[:direction]) ? params[:direction] : "asc"
    end

    # Retrieve sort settings from session
    @sort_by = session[:sort_by]
    @sort_direction = session[:sort_direction] || "asc"

    if @sort_by.present? && ALLOWED_SORT_COLUMNS.include?(@sort_by)
      @movies = Movie.order(@sort_by.to_sym => @sort_direction.to_sym)
    else
      @movies = Movie.all
    end
  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @movie.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: "Movie was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @movie.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy!

    respond_to do |format|
      format.html { redirect_to movies_path, notice: "Movie was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.expect(movie: [ :title, :rating, :description, :release_date ])
    end
end
