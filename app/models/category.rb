class Category < ActiveRecord::Base
  before_save {self.name = name.downcase}
  validates :name, presence: true, uniqueness: { case_sensitive: false}, length: {minimum: 3, maximum: 25}

end