class SignaturesController < ApplicationController
  def show
    @signature = Signature.find(params[:id])
    @students = Student.where(signature_id: params[:id])
    @student = @signature.students.build
  end
end
