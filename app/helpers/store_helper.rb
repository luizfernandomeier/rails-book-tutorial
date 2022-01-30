module StoreHelper
  def must_show_index_counter?
    session[:index_counter] > 5
  end

  def index_counter_message
    "The index page was accessed #{pluralize(session[:index_counter], 'time')}"
  end
end
