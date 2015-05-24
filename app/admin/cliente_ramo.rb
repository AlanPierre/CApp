ActiveAdmin.register ClienteRamo do

 menu parent: "Clientes", label:"Ramos de Mercado"

    permit_params :name

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  filter :name

  form do |f|
    f.inputs "Ramos de Mercado" do
      f.input :name
    end
    f.actions
  end

    
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
