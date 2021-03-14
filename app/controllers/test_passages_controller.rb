class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result]

  def show
    redirect_to result_test_passage_path(@test_passage) if @test_passage.time_is_up?
  end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids]) unless @test_passage.time_is_up?
    if @test_passage.completed?
      BadgeService.new(current_user).new_badges.each do |badge_id|
        badge = Badge.find(badge_id)
        current_user.badges.push(badge)
        flash["#{badge}"] = t('new_badge', badge: badge.title)
      end
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
