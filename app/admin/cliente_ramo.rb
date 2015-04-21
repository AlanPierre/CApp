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

end
