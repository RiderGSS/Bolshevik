class Admin::VerificateController< ApplicationController
  def index
    @count_user= User.where(verificate:false).count
    @users= User.where(verificate:false)

  end

  def email

  end
end
