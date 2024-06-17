# frozen_string_literal: true

ActiveAdmin.register Operation do
  actions :all, except: %i[destroy new create]
end
