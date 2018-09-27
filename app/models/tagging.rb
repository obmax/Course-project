class Tagging < ApplicationRecord
  belongs_to :manual
  belongs_to :tag
end
