module ApplicationHelper

  def step(num, of:)
    tag.ul(class: "steps is-horizontal") do
      [
        (num-1).times.map do
          tag.li(class: "steps-segment") do
            tag.a(href: "#", class: "steps-marker")
          end
        end.join,
        tag.li(class: "steps-segment is-active") do
          tag.span(class: "steps-marker")
        end,
        (of-num).times.map do
          tag.li(class: "steps-segment") do
            tag.span(class: "steps-marker")
          end
        end.join,
      ].join.html_safe
    end
  end
end

