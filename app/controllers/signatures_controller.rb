class SignaturesController < ApplicationController
  before_action :define_signatue

  def show
    @students = @signature.student_ids
    @student = @signature.students.build
  end

  def update
    @signature.update(params)
    redirect_to signature_path(@signature)
  end

  private

  def define_signatue
    @signature = Signature.find(params[:id])
  end

  def params
    params.require(:pro).permit(
      student_ids: []
    )
  end
end
