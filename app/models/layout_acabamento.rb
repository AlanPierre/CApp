class LayoutAcabamento < ActiveRecord::Base
    attr_accessible :name, :active,  :id
    has_and_belongs_to_many :layouts
    has_and_belongs_to_many :ordem_producao_items
end
