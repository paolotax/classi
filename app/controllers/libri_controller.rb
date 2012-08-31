
class LibriController < ApplicationController
  # GET /libri
  # GET /libri.json
  def index
    @libri = Libro.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @libri }
    end
  end

  # GET /libri/1
  # GET /libri/1.json
  def show
    @libro = Libro.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @libro }
    end
  end

  # GET /libri/new
  # GET /libri/new.json
  def new
    @libro = Libro.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @libro }
    end
  end

  # GET /libri/1/edit
  def edit
    @libro = Libro.find(params[:id])
  end

  # POST /libri
  # POST /libri.json
  def create
    @libro = Libro.new(params[:libro])

    respond_to do |format|
      if @libro.save
        format.html { redirect_to @libro, notice: 'Libro was successfully created.' }
        format.json { render json: @libro, status: :created, location: @libro }
      else
        format.html { render action: "new" }
        format.json { render json: @libro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /libri/1
  # PUT /libri/1.json
  def update
    @libro = Libro.find(params[:id])

    respond_to do |format|
      if @libro.update_attributes(params[:libro])
        format.html { redirect_to @libro, notice: 'Libro was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @libro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /libri/1
  # DELETE /libri/1.json
  def destroy
    @libro = Libro.find(params[:id])
    @libro.destroy

    respond_to do |format|
      format.html { redirect_to libri_url }
      format.json { head :no_content }
    end
  end
end
