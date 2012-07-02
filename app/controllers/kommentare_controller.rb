class KommentareController < ApplicationController
  # GET /kommentare
  # GET /kommentare.json
  def index
    @kommentare = Komentar.where("user_id == #{session[:user_id]}")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @kommentare }
    end
  end

  # GET /kommentare/1
  # GET /kommentare/1.json
  def show
    @kommentar = Kommentar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kommentar }
    end
  end

  # GET /kommentare/new
  # GET /kommentare/new.json
  def new
    @kommentar = Kommentar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @kommentar }
    end
  end

  # GET /kommentare/1/edit
  def edit
    @kommentar = Kommentar.find(params[:id])
  end

  # POST /kommentare
  # POST /kommentare.json
  def create
    @kommentar = Kommentar.new(params[:kommentar])
    @kommentar.autor = User.find(session[:user_id]).name
    respond_to do |format|
      if @kommentar.save
        format.html { redirect_to @kommentar, notice: 'Kommentar was successfully created.' }
        format.json { render json: @kommentar, status: :created, location: @kommentar }
      else
        format.html { render action: "new" }
        format.json { render json: @kommentar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /kommentare/1
  # PUT /kommentare/1.json
  def update
    @kommentar = Kommentar.find(params[:id])

    respond_to do |format|
      if @kommentar.update_attributes(params[:kommentar])
        format.html { redirect_to @kommentar, notice: 'Kommentar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @kommentar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kommentare/1
  # DELETE /kommentare/1.json
  def destroy
    @kommentar = Kommentar.find(params[:id])
    @kommentar.destroy

    respond_to do |format|
      format.html { redirect_to kommentare_url }
      format.json { head :no_content }
    end
  end
end
