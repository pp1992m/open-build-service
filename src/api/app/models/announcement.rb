# TODO: Please overwrite this comment with something explaining the model target
class Announcement < ApplicationRecord
  #### Includes and extends

  #### Constants

  #### Self config

  #### Attributes

  #### Associations macros (Belongs to, Has one, Has many)
  has_and_belongs_to_many :users

  #### Callbacks macros: before_save, after_save, etc.

  #### Scopes (first the default_scope macro if is used)

  #### Validations macros

  validates :title, :content, presence: true
  #### Class methods using self. (public and then private)

  def self.create_from_xml(xml)
    xml_hash = Xmlhash.parse(xml).with_indifferent_access
    create(xml_hash.slice(:title, :content))
  end
  #### To define class methods as private use private_class_method
  #### private


  #### Instance methods (public and then protected/private)

  #### Alias of methods
end
