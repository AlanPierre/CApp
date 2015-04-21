ActiveAdmin.register ClienteStatus do

 menu parent: "Clientes", label:"Status"

    permit_params :name

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  filter :name

  form do |f|
    f.inputs "Status de Clientes" do
      f.input :name
    end
    f.actions
  end

end
