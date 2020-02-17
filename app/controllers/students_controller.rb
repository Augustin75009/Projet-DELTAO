class StudentsController < ApplicationController
  def create
    @student = Student.new(params_student)
    @student.signature_id = params[:signature_id]
    @student.save
    redirect_to signature_path(Signature.find(params[:signature_id]))
  end

  private

  def params_student
    params.require(:student).permit(:last_name,
                                :first_name,
                                :email,
                                :address,
                                :phone)
  end
end
