class Post < ActiveRecord::Base
		has_many :comments
		validates :title, presence: true
		validates :sdesc, presence: true, length: { maximum: 160 }
		validates :body, presence: true
		has_attached_file :image,
						  :path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
						  :url => "/system/:attachment/:id/:basename_:style.:extension", 
						  :styles => { :medium => "700x300>", 
						  :thumb => "400x400>" }, 
						  :default_url => "/images/:style/missing.png"
  		validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  		def content
    		MarkdownService.new.render(body)
 	    end
end
