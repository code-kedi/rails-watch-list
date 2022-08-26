class BookmarksController < ApplicationController
  def index
    @bookmark = Bookmark.all
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), status: :see_other, notice: "Bookmark was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # bookmark DELETE /bookmarks/:id(.:format)
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    # Destroy
    @bookmark.destroy
    # Redirect
    redirect_to list_path(@list), status: :see_other, notice: "Successfully deleted review"
  end

  private

  def bookmark_params
    # here I had only :movie first, but it needs to be :movie_id
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
