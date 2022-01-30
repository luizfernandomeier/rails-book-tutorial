module IndexCounter
  private

  def initialize_index_counter
    session[:index_counter] = 0 if session[:index_counter].nil?
  end

  def increment_index_counter
    initialize_index_counter
    session[:index_counter] += 1
  end

  def reset_index_counter
    session[:index_counter] = 0
  end
end
