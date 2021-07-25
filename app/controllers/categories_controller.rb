class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categories or /categories.json
  def index
    @categories = Category.where(status: "Public")
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
    categories = Category.all
    @category_list = categories.map { |category| [category.cat_name, category.id] }
  end

  # GET /categories/1/edit
  def edit
    categories = Category.all
    @category_list = categories.map { |category| [category.cat_name, category.id] }
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    if @category.parent_category_id.nil?
      @category.parent_category_id = 0  
    end
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        unless @category.subcategories.empty?
          @category.subcategories.each do |child|
            child.status = @category.status
            child.save
          end
        end

        format.html { redirect_to @category, notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def get_categories
    global = {}
    categories = []
    category_list = Category.where(status: "Public")
    bookmarks = []
    bookmark_list = Bookmark.all


    category_list.map do |cat|
      object = {
        name: cat.cat_name,
        status: cat.status,
        main_category: cat.parent_category_id,
        subcategory: cat.subcategories,
        bookmark: cat.bookmarks
      }
      categories << object 
    end

    bookmark_list.map do |bookmark|
      object = [
        URL: bookmark.url,
        name: bookmark.name,
        category: bookmark.category_id,
        type: bookmark.kind_id
      ]
      bookmarks << object 
    end

    global["categories"] = categories
    global["bookmarks"] = bookmarks

    render json: global
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:cat_name, :status, :parent_category_id)
    end
end
