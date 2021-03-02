class Admin::GistController < Admin::BaseController
  def index
    @gists = Gist.all
  end
end
