# frozen_string_literal: true

ActiveAdmin.register PlannedExpence do
  actions :all, except: %i[destroy new create]

end
