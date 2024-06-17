# frozen_string_literal: true

ActiveAdmin.register Expence do
  permit_params :user_id, :name, :description, :predefined

  index do
    column :id
    column :name
    column :description
    column :predefined
    column :created_at
    actions
  end

  filter :name
  filter :predefined
  filter :created_at

  form do |f|
    f.inputs do
      f.input :user
      f.input :name
      f.input :description
      f.input :predefined
    end
    f.actions
  end
end
