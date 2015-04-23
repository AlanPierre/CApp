class ImpressoraConfig < ActiveRecord::Base
    attr_accessible  :id, :name, :active, :impressora_id
    belongs_to :impressora
    has_many :layouts
end
