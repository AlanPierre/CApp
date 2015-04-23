class Impressora < ActiveRecord::Base
    attr_accessible  :id, :name, :active, :impressora_configs_attributes

    has_many :impressora_configs, :dependent => :destroy
    has_many :layouts
    accepts_nested_attributes_for :impressora_configs, :reject_if => :all_blank, :allow_destroy => true

end
