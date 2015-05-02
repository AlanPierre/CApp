class Cliente < ActiveRecord::Base
      include Filterable

    attr_accessible :nome_fantasia, :razao_social, :cnpj, :inscricao_municipal, :inscricao_estadual, :cliente_faturamento_id, :cliente_status_id, :user_id, :observacao, :notificacao, :cliente_contatos_attributes, :cliente_enderecos_attributes, :cliente_estoque_minimos_attributes
    
    scope :status, -> (status) {
        statuses = status.split(',')
        where cliente_status_id: statuses }
    
    scope :vendedor, -> (vendedor) {
        vendedores = vendedor.split(',')
        where user_id: vendedores }
    
        scope :ramo, -> (ramo) {
        ramos = ramo.split(',')
        where cliente_ramo_id: ramos }
    
    
    scope :search_with, -> (search) {where('nome_fantasia LIKE ?', "%#{search}%")  }

    
    belongs_to :user
    belongs_to :cliente_status
    belongs_to :cliente_ramo
    belongs_to :cliente_faturamento
    has_many :cliente_contatos, :dependent => :destroy
    has_many :cliente_enderecos, :dependent => :destroy
    has_many :cliente_estoque_minimos, :dependent => :destroy
    has_many :pedido_vendas
    has_many :cliente_estoques
    has_many :orcamentos
    
    accepts_nested_attributes_for :cliente_contatos, :reject_if => :all_blank, :allow_destroy => true
    accepts_nested_attributes_for :cliente_enderecos, :reject_if => :all_blank, :allow_destroy => true
    accepts_nested_attributes_for :cliente_estoque_minimos, :reject_if => :all_blank, :allow_destroy => true
    
    include PublicActivity::Model
    tracked :owner => proc {|controller, model| controller.current_user}
      
        
end
