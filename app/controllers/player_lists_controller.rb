class PlayerListsController < ApplicationController

  before_filter :authenticate_user!

  # GET /player_lists
  # GET /player_lists.json
  def index
    @player_lists = current_user.player_lists

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @player_lists }
    end
  end

  # GET /player_lists/1
  # GET /player_lists/1.json
  def show
    @player_list = current_user.player_lists.find(params[:id])
#raise "Excepcion de prueba"
    if params[:op]
      case params[:op]
        when 'raffle'
          @player_list.raffle
          flash[:notice] = 'El sorteo se ha realizado correctamente.'
         
        when 'send'
          @player_list.send_raffle_results
          flash[:notice] = 'Correos enviados a los participantes.'

        when 'clear'
          @player_list.clear_assignments
          flash[:notice] = 'Se han eliminado los resultados del sorteo.'

      end
    end

    respond_to do |format|
      format.html {render "show" }
      format.json { render json: @player_list }
    end
  end

  # GET /player_lists/new
  # GET /player_lists/new.json
  def new
    @player_list = current_user.player_lists.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player_list }
    end
  end

  # GET /player_lists/1/edit
  def edit
    @player_list = current_user.player_lists.find(params[:id])
  end

  # POST /player_lists
  # POST /player_lists.json
  def create
    @player_list = current_user.player_lists.new(params[:player_list])

    respond_to do |format|
      if @player_list.save
        format.html { redirect_to @player_list, notice: 'Player list was successfully created.' }
        format.json { render json: @player_list, status: :created, location: @player_list }
      else
        format.html { render action: "new" }
        format.json { render json: @player_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /player_lists/1
  # PUT /player_lists/1.json
  def update
    @player_list = current_user.player_lists.find(params[:id])

    respond_to do |format|
      if @player_list.update_attributes(params[:player_list])
        format.html { redirect_to @player_list, notice: 'Player list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @player_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_lists/1
  # DELETE /player_lists/1.json
  def destroy
    @player_list = current_user.player_lists.find(params[:id])
    @player_list.destroy

    respond_to do |format|
      format.html { redirect_to player_lists_url }
      format.json { head :no_content }
    end
  end
end
