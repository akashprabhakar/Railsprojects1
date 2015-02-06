class Post < ActiveRecord::Base
		validates :title, presence: true
		validates :sdesc, presence: true, length: { maximum: 160 }
		validates :body, presence: true
		has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "400x400>" }, :default_url => "/images/:style/missing.png"
  		validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
