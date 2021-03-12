module TestPassagesHelper
  def result(test_passage)
    if test_passage.success?
      t("t_passed", percent: test_passage.percent.round)
    else
      t("t_not_passed", percent: test_passage.percent.round)
    end
  end

  def time(test_passage)
    if test_passage.created_at + test_passage.test.time_limit_in_minutes * 60 - Time.current > 0
      test_passage.created_at + test_passage.test.time_limit_in_minutes * 60 - Time.current
    end
  end

  def test_progress(test_passage)
    "#{(test_passage.current_question.id.to_i - test_passage.test.questions.first.id.to_i) / test_passage.test.questions.size.to_f * 100}".to_f.round
  end
end
