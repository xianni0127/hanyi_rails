class LoginController < ApplicationController
  #  before_action :set_child, only: [:register, :login, :index]
   protect_from_forgery with: :null_session

  def login
    unless request.get?
      childname=params[:child][:name]
      password=params[:child][:password]
      @hint = "ok"
      @child = Child.find_by_name(childname)

      if @child.class == NilClass
        @hint = 'Unregisted Children!'
      # elseif @child.password_db == params[:child][:password]
    elsif @child.password_db == "password"

        @hint = "Welcome back,"
          render template: "children/index"
      else
        @hint="Login failed, please check up your info"
       end
     end

   end

  def index
    render template: "login/login"
  end


  def register
    @child = Child.new(child_params)

    respond_to do |format|
      if @child.save
        ChildrenMailer.welcome_email(@child).deliver_now
        # AutoSendemailJob.perform_later @child.email

        render template: "login/login"
      else
        render template: "login/register"
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child
      @child = Child.find(params[:name])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def child_params
      params.require(:child).permit(:name, :email,:password,:id)
    end

end
