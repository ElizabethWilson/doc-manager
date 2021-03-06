class DocumentsController < ApplicationController

  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: DocumentsDatatable.new(view_context) }
    end
  end

  def show
    @document = Document.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document }
      format.pdf { render :pdf => "#{@document.title.underscore}.pdf",
                          :show_as_html => params[:debug]
      }
    end
  end

  def new
    @document = Document.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document }
    end
  end

  # GET /documents/1/edit
  def edit
    @document = Document.find(params[:id])
    @document.publication_date = @document.publication_date.strftime("%m/%d/%Y")
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(resource_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Primary document was successfully created.' }
        format.json { render json: @document, status: :created, location: @document }
      else
        format.html { render action: "new" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /documents/1
  # PUT /documents/1.json
  def update
    @document = Document.find(params[:id])

    respond_to do |format|
      if @document.update_attributes(resource_params)
        format.html { redirect_to @document, notice: 'Primary document was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document = Document.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to documents_url }
      format.json { head :no_content }
    end
  end

  def add_collections
    puts params.inspect
  end

  def resource_params
    params.require(:document).permit!
  end
end
