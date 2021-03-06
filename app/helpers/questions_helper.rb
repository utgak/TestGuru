module QuestionsHelper
  def question_header(question)
    "#{question.new_record? ? t('create_new') : t('edit') } #{question.test.title} #{ t('question') }"
  end
end
