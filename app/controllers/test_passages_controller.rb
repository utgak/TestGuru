class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result time_left?]

  def show
    unless time_left?
      redirect_to result_test_passage_path(@test_passage)
    end
  end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids]) if time_left?
    if @test_passage.completed? or !time_left?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def time_left?
    @test_passage.created_at + @test_passage.test.time_limit_in_minutes * 60 - @test_passage.updated_at > 0
  end
end
