module EntriesHelper

  def rating_link(entry, value, user)
    html_options = {}
    html_options[:class] = "selected_rating" if entry.rating_for(user).value == value
    link_to(value, rate_challenge_entry_path(@challenge, @entry, {:value => value}, html_options)).html_safe
  end

end
