class Task < ApplicationRecord
  belongs_to :flow_step

  has_rich_text :description

  enum level: {
      trainee: 0,
      junior: 1,
      middle: 5,
      senior: 10
  }
end
