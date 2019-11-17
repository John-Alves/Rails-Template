class AdminsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :verify_user
  
  # GET /admins
  # GET /admins.json
  def index
    @users = User.not_ADMIN
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    @user = User.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to admins_path, notice: 'Usuário criado com sucesso.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to admins_path, error: 'Erro ao criar usuário.' }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      new_values = user_params
      if new_values[:password] == '' || new_values[:password].nil?
        new_values = new_values.except(:password, :password_confirmation)
      end

      if @user.update(new_values)
        format.html { redirect_to admins_path, notice: 'Usuário atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { redirect_to admins_path, error: 'Erro ao atualizar usuário.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Usuário removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    def verify_user
      unless current_user.ADMIN?
        respond_to do |format|
          format.html { redirect_to categories_path }
        end
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :plan_id)
    end
end
