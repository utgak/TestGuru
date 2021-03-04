module QuestionsHelper
  def question_header(question)
    "#{question.new_record? ? I18n.t('create_new') : I18n.t('edit') } #{question.test.title} #{ I18n.t('question') }"
  end
end
