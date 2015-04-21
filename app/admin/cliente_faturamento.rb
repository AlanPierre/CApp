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

end
