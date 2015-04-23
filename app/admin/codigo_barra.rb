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

end

