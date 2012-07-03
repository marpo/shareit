require 'net/http'
class LinksController < ApplicationController

  # GET /links
  # GET /links.json
  def index
  #  @links = Link.all
    @links = Link.where("user_id == #{session[:user_id]}")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @links }
    end
  end

  # GET /links/1
  # GET /links/1.json
  def show
    @link = Link.find(params[:id])
    @kommentar = @link.kommentare.build
    @kommentare = @link.kommentare.paginate :page=>params[:page], :order=>'created_at desc', :per_page => 5
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @link }
    end
  end

  # GET /links/new
  # GET /links/new.json
  def new
    @link = Link.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @link }
    end
  end

  # GET /links/1/edit
  def edit
    @link = Link.find(params[:id])
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(params[:link])
    @link.user = User.find(session[:user_id])
    @link.titel = nil if @link.titel.blank?
    @link.url = "http://#{@link.url}" unless (@link.url.start_with?('/http://') || @link.url.start_with?('/https://'))
    @link.titel = @link.titel || titel_auslesen(@link.url)
    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render json: @link, status: :created, location: @link }
      else
        format.html { render action: "new" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /links/1
  # PUT /links/1.json
  def update
    @link = Link.find(params[:id])

    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.html { redirect_to links_url }
      format.json { head :no_content }
    end
  end

  def titel_auslesen(url)
    uri = URI(url)
    rueckgabe = nil
    regular = Regexp.new(/^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix)
    if url.match(regular)
      Net::HTTP.start(uri.host, uri.port) do |http|
        unless uri.path.blank?
      #  request = Net::HTTP::Get.new uri.request_url
          pfad = uri.path
        else
          pfad = '/'
        end
        response = http.get(pfad)
        rueckgabe = verarbeitung(response.body)
      end
    end
    rueckgabe
  end

  def verarbeitung response
    rueckgabe = response.slice!(/<title>.+?<\/title>/)
    rueckgabe.sub!(/<title>/, '')
    rueckgabe.sub!(/<\/title>/, '')
    rueckgabe.strip
  end
end
