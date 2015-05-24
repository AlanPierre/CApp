ActiveAdmin.register Material do
actions :all, except: [:destroy]
menu parent: "Mix de Produtos", label:"Materiais"


    
     controller do
    def create
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end
 
    def update
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end
  end


end
