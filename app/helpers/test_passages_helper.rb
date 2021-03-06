module TestPassagesHelper
  def result(test_passage)
    if test_passage.success?
      t("t_passed", percent: test_passage.percent)
    else
      t("t_not_passed", percent: test_passage.percent)
    end
  end

  def test_progress(test_passage)
    content_tag :p, "#{ t('question') } #{test_passage.current_question.id - test_passage.test.questions.first.id + 1}
     / #{test_passage.test.questions.size}".html_safe
  end
end
