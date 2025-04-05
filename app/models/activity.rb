class Activity < ApplicationRecord

  after_create_commit do
    broadcast_append_to "project_#{project_id}_activity",
                        target: "activity-list",
                        partial: "projects/activity",
                        locals: { activity: self }
  end

  belongs_to :project
  belongs_to :user

  validates :activity_type, presence: true, inclusion: { in: ['comment', 'status_change'] }
  validates :content, presence: true, if: -> { activity_type == 'comment' }
  validates :status_change, presence: true, if: -> { activity_type == 'status_change' }

  default_scope { order(created_at: :desc) }
end
