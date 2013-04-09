class Collection < ActiveRecord::Base
  attr_accessible :name, :primary, :description

  has_and_belongs_to_many :primary_documents
end