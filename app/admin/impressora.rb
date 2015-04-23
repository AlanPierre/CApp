ActiveAdmin.register Impressora do
    
    menu parent: "Confecção", label:"Impressoras"

    permit_params :name, :active, impressora_configs_attributes:[:id, :name, :active, :impressora_id, :_destroy]

  index do
    selectable_column
    id_column
    column :name
    column :active
    actions
  end

  filter :name

  form do |f|
    f.inputs "Impressoras" do
      f.input :name
      f.check_box  :active, :label => "Ativo"
    end
    f.inputs do
      f.has_many :impressora_configs, heading: 'Configurações', allow_destroy: true, new_record: true do |a|
        a.input :name
        a.input :active
      end
    end  
      
      
    f.actions
  end

end

