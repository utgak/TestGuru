class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index

  end

  def show; end

  def edit; end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to question_url(@question)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to question_url(@question)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_url(@question.test_id)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Record was not found'
  end
end
