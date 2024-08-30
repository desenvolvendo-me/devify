ActiveAdmin.register StudentProfile do
    # Aqui está configurado o que será mostrado na interface do ActiveAdmin
    permit_params :main_language, :track, :level
  
    index do
      selectable_column
      id_column
      column :main_language
      column :track
      column :level
      actions
    end
  end
  