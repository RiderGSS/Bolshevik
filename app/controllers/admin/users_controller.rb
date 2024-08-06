 class Admin::UsersController < ApplicationController
   before_action :set_user!, except: [:index]
  def index
    @users=User.all
  end
   def verificate
     @user.update(verificate: true)
     UserMailer.with(user: @user).welcome_email("verificate_true_email").deliver_later
     redirect_to admin_index_path
   end
   def email
     UserMailer.with(user: @user).welcome_email("verificate_false_email").deliver_later
     redirect_to admin_verificate_index_path
   end
   def show
   end
  def edit
  end
   def update
     if @user.update user_params
       flash[:notice] = "Данные обновлены"

       redirect_to admin_users_path
     else
       flash[:success]= @user.errors.full_messages

       render :edit, status: :unprocessable_entity
     end
   end
   def destroy
     @user.destroy
     redirect_to admin_users_path
   end

   private

   def set_user!
     @user = User.find params[:id]
   end

   def user_params
     if  params.dig(:user,:update_pass)=="0"
       params.require(:user).permit(:email, :role, :verificate,  :update_pass )
     else
       params.require(:user).permit(:email, :role, :verificate, :password, :password_confirmation, :update_pass )
     end
   end

end
