module TestPassagesHelper
  def result(test_passage)
    if test_passage.success?
      content_tag :p, "#{I18n.t('t_passed')}, <br>
                   #{I18n.t('c_persent')} <strong style='color :green; '> #{test_passage.percent} </strong>%".html_safe
    else
      content_tag :p, "#{I18n.t('t_npassed')}, <br>
                   #{I18n.t('c_persent')} <strong style='color :red; '> #{test_passage.percent} </strong>%".html_safe
    end
  end

  def test_progress(test_passage)
    content_tag :p, "#{ I18n.t('question') } #{test_passage.current_question.id - test_passage.test.questions.first.id + 1}
     / #{test_passage.test.questions.size}".html_safe
  end
end
