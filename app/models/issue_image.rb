class IssueImage < ActiveRecord::Base
  belongs_to :issue
  belongs_to :society

  has_attached_file :issue_pic, :styles => {:carousel =>"860x640", :medium => "640x480", :thumb => "200x200", :ind => "320x240"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :issue_pic, :content_type => ['image/jpeg', 'image/jpg', 'image/png']
end
