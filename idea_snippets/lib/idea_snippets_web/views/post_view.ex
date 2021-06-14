defmodule IdeaSnippetsWeb.PostView do
  use IdeaSnippetsWeb, :view
  alias IdeaSnippets.Codes

  def get_comments_count(post_id) do
    Codes.get_number_of_comments(post_id)
  end
end
