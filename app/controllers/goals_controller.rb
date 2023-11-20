class GoalsController < ApplicationController
  before_action :set_goal, only: %i[show edit update complete destroy]
  #include ApplicationHelper

  def index
    @goals_count = current_user.goals.count
    @goals_completed_count = current_user.goals.by_status(true).count
    @goals_incompleted_count_count = current_user.goals.by_status(false).count
    if @goals_count > 0
      @goals = current_user.goals.by_status(params[:status])
      render
    else
      render :nogoals
    end
  end

  def new
    @goal = Goal.new
  end

  def edit 
    render :new
  end

  def create
    @goal = current_user.goals.build(goal_params)

    if @goal.save
      redirect_to goals_url, status: :created,
                  notice: "Your goal has been successfully created."
    else
      redirect_to new_goal_url, status: :unprocessable_entity,
                  alert: "Your goal has NOT been created: #{@goal.errors.full_messages}"
    end
  end

  def update
    if @goal.update(goal_params)
      redirect_to goals_url, 
        notice: "Your goal has been successfully updated."
    else
      redirect_to edit_goal_url, status: :unprocessable_entity,
        alert: "Your goal has NOT been updated: #{@goal.errors.full_messages[0]}!"
    end
  end

  def complete
    if @goal.update(goal_param_compl)
      respond_to do |format|
          format.html { render inline: helpers.goal_status_btn(@goal) }
      end
    end
  end

  def destroy
    @goal.destroy
    redirect_to goals_url, status: :see_other, 
      notice: "Your goal has been successfully deleted."
  end

  private

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:title,:description,:priority,:due_date,completed: false)
  end

  def goal_param_compl
    params.require(:goal).permit(:completed)
  end
end
