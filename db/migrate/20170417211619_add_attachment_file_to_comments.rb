class AddAttachmentFileToComments < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :comments, :file
  end
end
