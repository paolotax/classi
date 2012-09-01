
class ClassiController < ApplicationController


  def index
    @classi = Classe.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @classi }
    end
  end

  def show
    @classe = Classe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @classe }
    end
  end

  def new
    @classe = Classe.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @classe }
    end
  end

  def edit
    @classe = Classe.find(params[:id])
  end

  def create
    @classe = Classe.new(params[:classe])

    respond_to do |format|
      if @classe.save
        format.html { redirect_to @classe, notice: 'Classe was successfully created.' }
        format.json { render json: @classe, status: :created, location: @classe }
      else
        format.html { render action: "new" }
        format.json { render json: @classe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @classe = Classe.find(params[:id])

    respond_to do |format|
      if @classe.update_attributes(params[:classe])
        format.html { redirect_to @classe, notice: 'Classe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @classe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @classe = Classe.find(params[:id])
    @classe.destroy

    respond_to do |format|
      format.html { redirect_to :new_classi_inserter }
      format.json { head :no_content }
    end
  end
  
  def destroy_all
    @classi = Classe.destroy(params[:classi][:classe_ids])

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
  
end
