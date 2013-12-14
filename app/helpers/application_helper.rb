module ApplicationHelper
  def glyphicon_link(text, url, glyph, opts = {})
    link_to raw("<span class=\"glyphicon glyphicon-#{glyph}\"></span> #{text}"), url, opts
  end

  def vote_link(record, direction)
    if direction == :up
      value = 1
      klass = "arrow-up"
    elsif direction == :down
      value = -1
      klass = "arrow-down"
    else
      return
    end

    glyphicon_link("", polymorphic_path([record, record.votes.build], vote: { value: value }, authenticity_token: form_authenticity_token), klass, method: :post)
  end

  def voteable_footer(model)
    vote_link(model, :up) +
    vote_link(model, :down) +
    content_tag(:div, :class => 'pull-right') do
      content_tag(:strong, 'Score: ') +
      content_tag(:span, (model.votes.ups - model.votes.downs), :class => (model.votes.ups < model.votes.downs ? 'text-danger' : ''))
    end
  end
end
