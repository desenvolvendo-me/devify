ActiveAdmin.register ProjectSimulation do
  menu label: I18n.t('active_admin.resources.project_simulation.menu.label')

  permit_params :title, :description, :objectives, :tools, :expected_results, :difficulty, :complexity

  form do |f|
    f.inputs I18n.t('active_admin.resources.project_simulation.name') do
      f.input :title, label: I18n.t('activerecord.attributes.project_simulation.title')
      f.input :description, label: I18n.t('activerecord.attributes.project_simulation.description')
      f.input :objectives, label: I18n.t('activerecord.attributes.project_simulation.objectives')
      f.input :tools, label: I18n.t('activerecord.attributes.project_simulation.tools')
      f.input :expected_results, label: I18n.t('activerecord.attributes.project_simulation.expected_results')
      f.input :difficulty, as: :select, collection: ProjectSimulation::DIFFICULTIES, prompt: "Selecione", label: I18n.t('activerecord.attributes.project_simulation.difficulty')
      f.input :complexity, as: :select, collection: ProjectSimulation::COMPLEXITIES, prompt: "Selecione", label: I18n.t('activerecord.attributes.project_simulation.complexity')
    end
    f.actions
  end

  show title: I18n.t('active_admin.resources.project_simulation.name') do
    attributes_table do
      row(I18n.t('activerecord.attributes.project_simulation.title')) { |project| project.title }
      row(I18n.t('activerecord.attributes.project_simulation.description')) { |project| project.description }
      row(I18n.t('activerecord.attributes.project_simulation.objectives')) { |project| project.objectives }
      row(I18n.t('activerecord.attributes.project_simulation.tools')) { |project| project.tools }
      row(I18n.t('activerecord.attributes.project_simulation.expected_results')) { |project| project.expected_results }
      row(I18n.t('activerecord.attributes.project_simulation.difficulty')) { |project| project.difficulty }
      row(I18n.t('activerecord.attributes.project_simulation.complexity')) { |project| project.complexity }
    end
  end

  index title: I18n.t('active_admin.resources.project_simulation.name') do
    selectable_column
    id_column
    column I18n.t('activerecord.attributes.project_simulation.title'), :title
    column I18n.t('activerecord.attributes.project_simulation.difficulty'), :difficulty
    column I18n.t('activerecord.attributes.project_simulation.complexity'), :complexity
    actions
  end

  filter :title, label: I18n.t('activerecord.attributes.project_simulation.title')
  filter :difficulty, as: :select, collection: ProjectSimulation::DIFFICULTIES, prompt: "Selecione", label: I18n.t('activerecord.attributes.project_simulation.difficulty')
  filter :complexity, as: :select, collection: ProjectSimulation::COMPLEXITIES, prompt: "Selecione", label: I18n.t('activerecord.attributes.project_simulation.complexity')
end
