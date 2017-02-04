class Answer < ApplicationRecord
  belongs_to :question

  attr_accessor :correct
end
