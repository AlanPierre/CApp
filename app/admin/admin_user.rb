ActiveAdmin.register AdminUser do
    
    menu parent: "Usuários", label:"Usuários Admin"
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :created_at

  form do |f|
    f.inputs "Cadastro de Admin" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
