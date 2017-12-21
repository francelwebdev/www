module CitiesHelper
  # def lead_teachers(city)
  #   lead_teachers_slugs = Static::LEAD_TEACHERS[city.slug.to_sym].nil? ? [] : Static::LEAD_TEACHERS[city.slug.to_sym]
  #   lead_teachers = city.current_batch.teachers
  #     .select { |teacher| lead_teachers_slugs.include?(teacher.user.github_nickname) }
  #     .sort_by { |teacher| lead_teachers_slugs.index(teacher.user.github_nickname) }
  # end

  def next_open_batch_date(city)
    next_date = (city.apply_batches.select do |b|
      b.apply_status ==  "last_seats" || b.apply_status == "open_for_registration"
    end).map(&:starts_at).sort.first
    next_date = Date.today + City::GAP_BETWEEN_BATCHES if next_date.nil?
    return next_date
  end
end
