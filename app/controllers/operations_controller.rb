class OperationsController < ApplicationController
  # GET /operations
  # GET /operations.json
  def index
    all_operations = Operation.all
    @operations = []
    all_operations.each do |operation|
      if operation.events.count > 0
        @operations << operation
      end
    end
    @operation = Operation.new

    @markers = '[{"lat":47.398349,"lng":-9.008789}]'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @operations }
    end
  end

  # GET /operations/1
  # GET /operations/1.json
  def show
    @operation = Operation.find(params[:id])
    @events = @operation.events.order(:event_date)
    @markers = @events.to_gmaps4rails
    logger.info "markers = #{@markers}"
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @operation }
      format.js
    end
  end

  # GET /operations/new
  # GET /operations/new.json
  def new
    @operation = Operation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @operation }
      format.js
    end
  end

  # GET /operations/1/edit
  def edit
    @operation = Operation.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /operations
  # POST /operations.json
  def create
    @operation = Operation.new(params[:operation])

    respond_to do |format|
      if @operation.save
        format.html { redirect_to @operation, notice: 'Operation was successfully created.' }
        format.json { render json: @operation, status: :created, location: @operation }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /operations/1
  # PUT /operations/1.json
  def update
    @operation = Operation.find(params[:id])

    respond_to do |format|
      if @operation.update_attributes(params[:operation])
        format.html { redirect_to @operation, notice: 'Operation was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /operations/1
  # DELETE /operations/1.json
  def destroy
    @operation = Operation.find(params[:id])
    @operation.destroy

    respond_to do |format|
      format.html { redirect_to operations_url }
      format.json { head :no_content }
      format.js
    end
  end
end
