class AddAttachmentMainImageToProjects < ActiveRecord::Migration[5.1]
  def self.up
    change_table :projects do |t|
      t.attachment :main_image
    end
  end

  def self.down
    remove_attachment :projects, :main_image
  end
end
