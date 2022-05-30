class Universities::ProgramsController < ApplicationController
  before_action :set_university
  before_action :set_program, only: %i[ show edit update destroy ]

  # GET /programs or /programs.json
  def index
    @programs = @university.programs
  end

  # GET /programs/1 or /programs/1.json
  def show
  end

  # GET /programs/new
  def new
    @program = Program.new
  end

  # GET /programs/1/edit
  def edit
  end

  # POST /programs or /programs.json
  def create
    @program = @university.programs.build(program_params)

    respond_to do |format|
      if @program.save
        format.html { redirect_to university_programs_url(@program), notice: "Programa creado" }
        format.json { render :show, status: :created, location: @program }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programs/1 or /programs/1.json
  def update
    respond_to do |format|
      if @program.update(program_params)
        format.html { redirect_to university_programs_url(@program), notice: "Programa actualizado" }
        format.json { render :show, status: :ok, location: @program }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programs/1 or /programs/1.json
  def destroy
    @program.destroy

    respond_to do |format|
      format.html { redirect_to university_programs_url, notice: "Program was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_university
      @university = University.find(params[:university_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_program
      @program = Program.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def program_params
      params.require(:program).permit(:university_id, :name, :description, :beca)
    end
end
