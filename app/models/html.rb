require 'sanitize'

class Html < ApplicationRecord
  acts_as :content

  # def html_source=(html)
  #   sanitized = Sanitize.document(html, :allow_doctype => true)
  #   write_attribute(:html_source, sanitized)
  # end
end
