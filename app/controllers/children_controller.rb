class ChildrenController < ApplicationController
  before_action :set_child, only: [:show, :edit, :update, :destroy]
   protect_from_forgery with: :null_session
  # GET /children
  # GET /children.json
  def index
    @children = Child.all
  end

  # GET /children/1
  # GET /children/1.json
  def show
  end

  # GET /children/new
  def new
    @child = Child.new
  end

  # GET /children/1/edit
  def edit
  end

  # POST /children
  # POST /children.json
  def create
    @child = Child.new(child_params)

    respond_to do |format|
      if @child.save
        ChildrenMailer.welcome_email(@child).deliver_now
        # AutoSendemailJob.perform_later @child.email

        format.html { redirect_to @child, notice: t('Child was successfully created.') }
        format.json { render :show, status: :created, location: @child }
      else
        format.html { render :new }
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /children/1
  # PATCH/PUT /children/1.json
  def update
    respond_to do |format|
      if @child.update(child_params)
        flash[:notice] = t('Child was successfully updated.')
        format.html { redirect_to @child}
        format.json { render :show, status: :ok, location: @child }
      else
        format.html { render :edit }
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /children/1
  # DELETE /children/1.json
  def destroy
    @child.destroy
    respond_to do |format|
      format.html { redirect_to children_url, notice: t('Child was successfully destroyed.') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child
      @child = Child.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def child_params
      params.require(:child).permit(:name, :description, :picture,:email,:login,:password)
    end
end
