ActiveAdmin.register User do
    menu  label:"Usuários"
   
  permit_params :email,:name, :login, :password, :password_confirmation, :departamento_id, role_ids: []
  index do
    selectable_column
    id_column
    column :login
    column :email
    column :name
    column :current_sign_in_at
    column :created_at
    actions
  end
    
     filter :departamento_id,  :as => :select,:collection => Departamento.all

  form do |f|
    f.inputs "User" do
      f.input :login
      f.input :email
      f.input :name
      f.input :password
      f.input :password_confirmation
      f.input :departamento_id,  :as => :select, :collection => Departamento.all
      f.input :role_ids,  :as => :check_boxes, :collection => Role.all, :label => "Permissões"
    end
    f.actions
  end

end
