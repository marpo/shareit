class CodeSnippetsController < ApplicationController
  # GET /code_snippets
  # GET /code_snippets.json
  def index
    @code_snippets = CodeSnippet.where("user_id == #{session[:user_id]}")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @code_snippets }
    end
  end

  # GET /code_snippets/1
  # GET /code_snippets/1.json
  def show
    @code_snippet = CodeSnippet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @code_snippet }
    end
  end

  # GET /code_snippets/new
  # GET /code_snippets/new.json
  def new
    @code_snippet = CodeSnippet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @code_snippet }
    end
  end

  # GET /code_snippets/1/edit
  def edit
    @code_snippet = CodeSnippet.find(params[:id])
  end

  # POST /code_snippets
  # POST /code_snippets.json
  def create
    @code_snippet = CodeSnippet.new(params[:code_snippet])
    @code_snippet.user = User.find(session[:user_id])

    respond_to do |format|
      if @code_snippet.save
        format.html { redirect_to @code_snippet, notice: 'Code snippet was successfully created.' }
        format.json { render json: @code_snippet, status: :created, location: @code_snippet }
      else
        format.html { render action: "new" }
        format.json { render json: @code_snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /code_snippets/1
  # PUT /code_snippets/1.json
  def update
    @code_snippet = CodeSnippet.find(params[:id])

    respond_to do |format|
      if @code_snippet.update_attributes(params[:code_snippet])
        format.html { redirect_to @code_snippet, notice: 'Code snippet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @code_snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /code_snippets/1
  # DELETE /code_snippets/1.json
  def destroy
    @code_snippet = CodeSnippet.find(params[:id])
    @code_snippet.destroy

    respond_to do |format|
      format.html { redirect_to code_snippets_url }
      format.json { head :no_content }
    end
  end
end
