class ClientesController < InheritedResources::Base
    load_and_authorize_resource  
    before_filter :authenticate_user!
    
     def index
        @status = ClienteStatus.all
         @vendedores = User.where(departamento_id: 1)
         @ramos = ClienteRamo.order('name').all
         @clientes = Cliente.filter(params.slice(:status, :vendedor,:ramo, :search_with)).order("nome_fantasia ASC").paginate(:per_page => 50, :page => params[:page])

     end 

    def create  
        create! { collection_url }
        flash[:notice] = 'Cliente adicionado com sucesso!' 
    end
    
    def update  
        update! { edit_cliente_path}
        flash[:notice] = 'Cliente atualizado com sucesso!' 

    end
  
    
    private
   def cliente_params
      params.require(:cliente).permit(:nome_fantasia, :razao_social, :cnpj, :inscricao_municipal, :inscricao_estadual, :cliente_faturamento_id, :cliente_status_id, :user_id, :observacao, :notificao, :id,
          cliente_contatos_attributes: [:cliente_id, :nome, :email, :telefone, :observacao, :id, :_destroy],
        cliente_enderecos_attributes: [:id, :name, :cliente_id, :cidade_id,:estado_id, :bairro, :rua, :numero, :complemento, :cep, :rota, :forma_entrega_id, :observacao,  :_destroy, :_update, :_create],
        cliente_estoque_minimos_attributes: [:id, :cliente_id, :produto_id, :material_id, :quantidade, :_destroy, :_update, :_create]) 
    end
    


  

end

