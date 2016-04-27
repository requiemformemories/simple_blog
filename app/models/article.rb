class Article < ActiveRecord::Base
    validates_presence_of :title
    validates_presence_of :introduction
    validates_presence_of :text
    has_many :comments
    belongs_to :category 
end
