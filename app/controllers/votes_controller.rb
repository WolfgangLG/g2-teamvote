class VotesController < ApplicationController
  def up_vote
    update_vote(1)
    redirect_to :back
  end

  def down_vote
    update_vote(-1)
    redirect_to :back
  end

  private

  def update_vote(new_value)
    @employee = Employee.find(params[:employee_id])
    @vote = Vote.create(value: new_value, employee: @employee)
  end

end
