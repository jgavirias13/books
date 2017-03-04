class LibrosController < ApplicationController
  before_action :find_libro, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :find]
  load_and_authorize_resource :except => [:index, :show, :find]

  def index
    @libros = Libro.all.order("created_at DESC")
  end

  def show
  end

  def new
    @libro = Libro.new
  end

  def create
    @libro = Libro.new(libro_params)
    @libro.user = current_user

    if @libro.save
      redirect_to @libro, :notice => "Libro creado con exito"
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @libro.update(libro_params)
      redirect_to @libro, :notice => "Se ha actualizado con exito"
    else
      render "edit"
    end
  end

  def destroy
    @libro.destroy
    redirect_to libros_path, :notice => "Se ha borrado con exito"
  end

  def find
    @libros = Libro.search(params[:search_string])
  end

  private

  def libro_params
    params.require(:libro).permit(:titulo, :autor, :descripcion, :imagen)
  end

  def find_libro
    @libro = Libro.find(params[:id])
  end
end
