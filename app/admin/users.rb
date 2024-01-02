ActiveAdmin.register User do
  permit_params :name, :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :roles do |user|
      user.roles.map(&:name).join(', ')
    end
    actions
  end

  filter :email

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  before_create do |user|
    user.add_role(:editor)
  end
  
end
