class Task < ApplicationRecord
has_many :tags
  has_many :task_assignments
  has_many :assigned_users, through: :task_assignments, source: :user

  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :due_date, presence: true

  enum status:{
    incomplete: 0,
    complete: 1
  }

  enum priority: {
    low: 0,
    medium: 1,
    high: 2
  }
end
