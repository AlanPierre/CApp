class Cidade < ActiveRecord::Base
    attr_accessible :id, :estado_id, :name
    belongs_to :estado
    
end
