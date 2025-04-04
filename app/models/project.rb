class Project < ApplicationRecord
  has_many :activities, dependent: :destroy

  validates :name, presence: true
  validates :status, presence: true

  # change the status of the project
  def change_status(user, new_status)
    old_status = status
    update(status: new_status)
    
    activities.create(
      user: user,
      activity_type: 'status_change',
      status_change: "#{old_status} to #{new_status}"
    )
  end

  # add a comment to the project
  def add_comment(user, content)
    activities.create(
      user: user,
      activity_type: 'comment',
      content: content
    )
  end
end
