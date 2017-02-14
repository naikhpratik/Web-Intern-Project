require 'sanitize'

class Html < ApplicationRecord
  acts_as :content

  def html_source=(html)
    sanitized = Sanitize.document(html, Sanitize::Config.merge(Sanitize::Config::BASIC,
      allow_doctype: true,
      elements: %w[ address article body caption div footer h1 h2 h3 h4 h5 h6 head header hr br b strong html img figure figcaption main nav section span summary sub sup del ins table tbody td tfoot th thead title tr dt dd dh dir blockquote
      ],
      attributes: {
        :all       => %w[hidden id style title],
        'a'        => %w[href hreflang name rel],
        'img'      => %w[align alt border height src width],
        'li'       => %w[value],
        'ol'       => %w[reversed start type],
        'table'    => %w[align bgcolor border cellpadding cellspacing frame rules sortable summary width],
        'td'       => %w[abbr align colspan headers rowspan valign width],
        'th'       => %w[abbr align colspan headers rowspan scope sorted valign width],
        'ul'       => %w[type]
      }
    ))

    write_attribute(:html_source, sanitized)
  end
end
