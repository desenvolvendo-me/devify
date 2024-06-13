ActiveAdmin.register User do
  menu parent: I18n.t('active_admin.menu.management')

  index do
    id_column
    column :name
    actions
  end

  show do
    @user = User.find(params[:id])
    panel "Progresso do Usuário" do
      render 'admin/users/progress', user: user
    end

    attributes_table do
      # Esta linha irá gerar automaticamente uma linha na tabela para cada atributo do modelo
      default_attribute_table_rows.each do |field|
        row field
      end
    end
  end
end
