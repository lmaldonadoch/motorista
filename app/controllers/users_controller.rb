class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users/1
  # GET /users/1.json
  def show; end

  # GET /users/new
  def new
    @user = User.new
    @user = if current_user.nil?
              User.new
            else
              User.find(current_user.id)
            end
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def sign_in
    @user = User.find_by(name: params[:user][:name]) unless params[:user].nil?
    if @user
      redirect_to root_path
    else
      @user = User.new
      redirect_to sign_in_path, alert: 'Please provide a valid name'
    end
  end

  def sign_out
    redirect_to destroy_user_session_path
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :passord_confirmation)
  end
end
