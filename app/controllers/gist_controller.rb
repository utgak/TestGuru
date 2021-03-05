class GistController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    @result = GistQuestionService.new(@test_passage.current_question).call

    if @result.success?
      flash[:notice] =  t("gist_flash", url: @result.url, question_title: @test_passage.current_question.title)
      Gist.create!(gist_url: @result.url, user: current_user, question: @test_passage.current_question)
    else
      flash[:alert] = t("failure")
    end

    redirect_to @test_passage
  end
end
