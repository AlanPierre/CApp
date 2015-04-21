class Role < ActiveRecord::Base
     attr_accessible :name, :user_id, :role_id
    has_and_belongs_to_many :users
end
