class QuestionsController < ApplicationController

  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.all.inspect
  end

  def show
    render plain: @test.questions.find(params['id']).inspect
  end

  def new; end

  def create
    question = Question.create!(question_params)
    render plain: question.inspect
  end

  def destroy
    @test.questions.find(params['id']).destroy
    render plain: 'deleted'
  end

  private

  def find_test
    @test = Test.find(params['test_id'])
  end

  def question_params
    params.require(:question).permit(:title, :test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
