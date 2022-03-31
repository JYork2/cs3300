class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    @projects = Projects.all
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @projects = Projects.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @projects = Projects.new(project_params)

    respond_to do |format|
      if @projects.save
        format.html { redirect_to project_url(@projects), notice: "Projects was successfully created." }
        format.json { render :show, status: :created, location: @projects }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @projects.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @projects.update(project_params)
        format.html { redirect_to project_url(@projects), notice: "Projects was successfully updated." }
        format.json { render :show, status: :ok, location: @projects }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @projects.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @projects.destroy

    respond_to do |format|
      format.html { redirect_to projects_index_url, notice: "Projects was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @projects = Projects.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:title, :description)
    end
end
