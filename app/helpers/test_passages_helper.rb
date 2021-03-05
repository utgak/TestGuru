module TestPassagesHelper
  def result(test_passage)
    if test_passage.success?
      content_tag :p, "#{t('t_passed')}, <br>
                   #{t('c_persent')} <strong style='color :green; '> #{test_passage.percent} </strong>%".html_safe
    else
      content_tag :p, "#{t('t_npassed')}, <br>
                   #{t('c_persent')} <strong style='color :red; '> #{test_passage.percent} </strong>%".html_safe
    end
  end

  def test_progress(test_passage)
    content_tag :p, "#{ t('question') } #{test_passage.current_question.id - test_passage.test.questions.first.id + 1}
     / #{test_passage.test.questions.size}".html_safe
  end
end
