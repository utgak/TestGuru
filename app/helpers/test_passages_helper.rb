module TestPassagesHelper
  def result(test_passage)
    if test_passage.success?
      content_tag :p, "Test passed successfully, <br>
                   percentage of correct answers <strong style='color :green; '> #{test_passage.percent} </strong>%".html_safe
    else
      content_tag :p, "The test was not passed, <br>
                   percentage of correct answers <strong style='color :red; '> #{test_passage.percent} </strong>%".html_safe
    end
  end

  def test_progress(test_passage)
    content_tag :p, "Question #{test_passage.current_question.id - test_passage.test.questions.first.id + 1}
     / #{test_passage.test.questions.size}".html_safe
  end
end
