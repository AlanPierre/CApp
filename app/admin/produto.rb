ActiveAdmin.register Produto do
 actions :all, except: [:destroy]

menu parent: "Mix de Produtos", label:"Produtos"
  permit_params :name, :active,  material_ids: [] 

    form do |f|
    f.inputs "Produto" do
      f.input :name
      f.input :active
      f.input :material_ids,  :as => :check_boxes, :collection => Material.all, :label => "Materiais"
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