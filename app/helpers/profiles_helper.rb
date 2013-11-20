module ProfilesHelper
  def full_name(profile)
    name_array = []
    name_array << profile.first_name
    name_array << profile.middle_name
    name_array << profile.last_name
    name_array.compact!
    name_array.join(" ")
  end

  def match_percentage(match)
    percentage = current_user.profile.match_percentage(match) * 100.0
    klass = 'text-danger'

    if percentage >= 90
      klass = 'text-success'
    elsif percentage < 90 && percentage >= 75
      klass = 'text-warning'
    end

    content_tag :span, :class => klass do
      number_to_percentage(percentage, precision: 1)
    end
  end

  private

end
