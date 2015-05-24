ActiveAdmin.register ClienteFaturamento do

    menu parent: "Clientes", label:"Tipos de Faturamento"

    permit_params :name, :active

  index do
    selectable_column
    id_column
    column :name
    column :active
    actions
  end

  filter :name

  form do |f|
    f.inputs "Tipo de Faturamento" do
      f.input :name
      f.check_box  :active
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
