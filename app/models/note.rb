class Note < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :text

  def show_note
    "#{self.name} -> #{self.text}"
  end

end
