class CategoriesController < ApplicationController
before_action :set_category, only: [:show, :edit, :update, :destroy]
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    respond_to  do |format|
      if @category.save
        format.html { redirect_to root_url, notice: 'Categoria criada com sucesso.'}
      else
        format.html {render 'new'}
      end
    end
  end

  def edit
  end

  def update
    respond_to  do |format|
      if @category.update(category_params)
        format.html { redirect_to root_url, notice: 'Categoria atualizada com sucesso.'}
      else
        format.html {render 'new'}
      end
    end
  end

  def destroy
    @category.destroy
    respond_to  do |format|
        format.html { redirect_to root_url, notice: 'Categoria excluída com sucesso.'}
    end
  end

  def set_category
    @category = Category.find(params[:id])
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
