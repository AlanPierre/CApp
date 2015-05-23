class ClienteEstoqueMinimosController < InheritedResources::Base

 respond_to :html, :js


private

  
  def cliente_estoque_minimo_params
    params.require(:cliente_estoque_minimo).permit(:id, :cliente_id, :produto_id, :material_id, :quantidade)
  end

end


