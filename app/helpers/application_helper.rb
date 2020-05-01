module ApplicationHelper

  def step(num, of:)
    tag.ul(class: "steps is-horizontal") do
      [
        (num-1).times.map do |n|
          tag.li(class: "steps-segment") do
            tag.a(href: "#", class: "steps-marker") do
              (n+1).to_s
            end
          end
        end.join,
        tag.li(class: "steps-segment is-active") do
          tag.span(class: "steps-marker") do
            num.to_s
          end
        end,
        (of-num).times.map do |n|
          tag.li(class: "steps-segment") do
            tag.span(class: "steps-marker has-text-white") do
              (n+num+1).to_s
            end
          end
        end.join,
      ].join.html_safe
    end
  end
end

