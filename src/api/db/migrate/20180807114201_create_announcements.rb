class CreateAnnouncements < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :content

      t.timestamps
    end

    create_table :announcements_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :announcement, index: true
    end
  end
end
