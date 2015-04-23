class CodigoBarra < ActiveRecord::Base
    attr_accessible  :id, :name, :active
    has_many :layouts
end
