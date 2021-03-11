module TestPassagesHelper
  def result(test_passage)
    if test_passage.success?
      t("t_passed", percent: test_passage.percent)
    else
      t("t_not_passed", percent: test_passage.percent)
    end
  end

  def test_progress(test_passage)
    "#{(test_passage.current_question.id.to_i - test_passage.test.questions.first.id.to_i) / test_passage.test.questions.size.to_f * 100}".to_f.round
  end
end
