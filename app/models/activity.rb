class Activity < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :activity_type, presence: true, inclusion: { in: ['comment', 'status_change'] }
  validates :content, presence: true, if: -> { activity_type == 'comment' }
  validates :status_change, presence: true, if: -> { activity_type == 'status_change' }

  default_scope { order(created_at: :desc) }
end
