module ApplicationHelper
  def body_class
    classes = []

    # for devise:
    classes << "login-page" if controller_name == "sessions" && action_name == "new"
    classes << "signup-page" if controller_name == "registrations" && action_name == "new"

    # for posts:
    classes << "posts-index-page" if controller_name == "posts" && action_name == "index"
    classes << "posts-show-page" if controller_name == "posts" && action_name == "show"

    classes.join(" ")
  end
end
