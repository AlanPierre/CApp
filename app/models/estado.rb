class Estado < ActiveRecord::Base
    attr_accessible :id, :name, :uf
    has_many :cidades 
end
