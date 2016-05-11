class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug, use: [:slugged, :finders, :history]
  validates_presence_of :title
  validates_presence_of :introduction
  validates_presence_of :text
  validates_uniqueness_of :slug
  has_many :comments
  belongs_to :category 
  acts_as_taggable  
end


