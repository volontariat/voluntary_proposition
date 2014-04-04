module VoluntaryProposition
  module Navigation
    def self.code
      Proc.new do |navigation|
        navigation.items do |primary|
          primary.dom_class = 'nav'
          
          if user_signed_in?
            primary.item :workflow, I18n.t('workflow.index.title'), proposition_workflow_path do |workflow|
              workflow.item :organization_owner, I18n.t('workflow.organization_owner.index.title'), proposition_workflow_organization_owner_index_path
            end
          end
          
          instance_exec primary, ::Voluntary::Navigation::Base.menu_options(:authentication), &::Voluntary::Navigation.menu_code(:authentication)
        end
      end
    end
  end
end
    