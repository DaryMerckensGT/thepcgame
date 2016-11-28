class Image < ApplicationRecord
  belongs_to :user
  
  has_attached_file :image, 
  :styles => {
  	:thumb    => ['100x100#',  :jpg, :quality => 50],
  	:preview  => ['480x480#',  :jpg, :quality => 50],
  	:large    => ['600>',      :jpg, :quality => 80],
  	:retina   => ['1200>',     :jpg, :quality => 50]
  	},
  :url => ":s3_domain_url",
  :path => ":user_id/:id.:style.:extension"
  
  validates_attachment :image,
    	:presence => true,
    	:size => { :in => 0..2.megabytes },
    	:content_type => { :content_type => /^image\/(jpeg|png|gif|tiff|ico)$/ }
end
