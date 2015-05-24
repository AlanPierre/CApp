ActiveAdmin.register CodigoBarra do
    
    menu parent: "Confecção", label:"Códigos de Barras"

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
    f.inputs "Códigos de Barras" do
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

