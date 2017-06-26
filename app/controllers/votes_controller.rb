class VotesController < ApplicationController
  def up_vote
    @employee = Employee.find(params[:employee_id])
    @vote = Vote.create(value: 1, employee: @employee)

    redirect_to :back
  end
end
