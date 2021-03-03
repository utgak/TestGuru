class GistController < ApplicationController
  def gist
    @test_passage = TestPassage.find(params[:id])
    @result = GistQuestionService.new(@test_passage.current_question).call

    if success?
      flash[:notice] =  "#{ I18n.t("success") }, #{ @result.html_url }"
      Gist.create!(gist_url: @result.html_url, user: current_user, question: @test_passage.current_question)
    else
      flash[:alert] = "#{ I18n.t("failure") }"
    end

    redirect_to @test_passage
  end

  private

  def success?
    @result.html_url.present?
  end
end
