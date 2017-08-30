class LoginController < ApplicationController
  def login
    unless request.get?
      childname=params[:child][:name]
      password=params[:child][:password]
      @hint = "ok"
      @child = Child.find_by_name(childname)
      if @child.class == NilClass
        @hint = 'Unregisted Children!'
      elseif @child.password == params[:child][:password]
        @hint = "Welcome back,"
        redirect_to :controller=>'login', :action=>'index'
      else
        @hint="Login failed, please check up your info"
  end

  def index
  end
end
