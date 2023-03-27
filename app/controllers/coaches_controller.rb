class CoachesController < ApplicationController
  def index
    @coaches = Coach.order("created_at DESC")
  end

  def new
    @coach = Coach.new
  end

  def create
    @coach = Coach.new(coach_params)
    #binding.pry
    if @coach.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def coach_params
    params.require(:coach).permit(:rank_id, :kill_rate, {:character => []}, :play_time, {:play_device => []}, {:communication_tool => []}, :price, :times_to_teach, :rank_limit_id, :appeal_point).merge(user_id: current_user.id)
  end
end
