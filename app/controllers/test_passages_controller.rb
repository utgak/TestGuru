class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.present?
      flash[:notice] =  "success, #{ result[:html_url] }"
      Gist.create!(gist_url: result[:html_url], user: current_user, question: @test_passage.current_question)
    else
      flash[:alert] = 'failure'
    end

    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
