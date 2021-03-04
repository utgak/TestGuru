class GistController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:test_passages_id])
    @result = GistQuestionService.new(@test_passage.current_question).call

    if @result.success?
      flash[:notice] =  "#{ I18n.t("success") }, #{ @result.url }"
      Gist.create!(gist_url: @result.url, user: current_user, question: @test_passage.current_question)
    else
      flash[:alert] = "#{ I18n.t("failure") }"
    end

    redirect_to @test_passage
  end
end
