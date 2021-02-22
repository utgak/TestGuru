module TestPassagesHelper
  def result(test_passage)
    percent = test_passage.correct_questions.to_f / test_passage.test.questions.count * 100.0

    if percent >= TestPassage::TEST_PASS_PERCENTAGE
      render html: "<p> Test passed successfully, <br>
                   percentage of correct answers <strong style='color :green; '> #{percent} </strong>%</p>".html_safe
    else
      render html: "<p> The test was not passed, <br>
                   percentage of correct answers <strong style='color :red; '> #{percent} </strong>%</p>".html_safe
    end
  end
end
