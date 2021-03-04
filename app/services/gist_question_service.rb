class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    Result.new(@client.create_gist(gist_params))
  end

  private

  Result = Struct.new(:gist) do
    def url
      gist[:html_url] if success?
    end

    def success?
      gist[:html_url].present?
    end
  end

  def gist_params
    {
      description: I18n.t(".gist.description", test: @test.title),
      files: {
        'test-guru-question.txt': {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.title, *@question.answers.pluck(:title)].join("\n")
  end
end