class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.all.inspect
  end

  def show
    render plain: Question.find(params['id']).inspect
  end

  def new; end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      render plain: @question.inspect
    else
      render plain: 'Invalid data'
    end
  end

  def destroy
    Question.find(params['id']).destroy
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
    render plain: 'Record was not found'
  end
end
