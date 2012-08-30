class ClassiInsertersController < ApplicationController

  def new
    @classi_inserter = ClassiInserter.new
  end
  
  def create
    @classi_inserter = ClassiInserter.new(params[:classi_inserter])
    if @classi_inserter.valid?
      @classi_inserter.insert_classi
      flash[:notice] = "Classi inserite."
      redirect_to classi_url
    else
      render :action => 'new'
    end
  end

end
