module VoluntaryProposition
  module Navigation
    def self.voluntary_menu_customization
      voluntary_menu_options.each do |resource, options|
        options.each do |option, value|
          ::Voluntary::Navigation::Base.add_menu_option(resource, option, value)
        end
      end
    end
    
    def self.voluntary_menu_options
      {
        organizations: {
          after_resource_has_many: Proc.new do |organization, options|
            organization.item :units, I18n.t('proposition_units.index.title'), organization_proposition_units_path(@organization) do |units|
              units.item :new, I18n.t('general.new'), new_organization_proposition_unit_path(@organization)
              
              unless (@unit.new_record? rescue true)
                units.item :show, "#{@unit.name} (#{@unit.organization.name})", proposition_unit_path(@unit) do |unit|
                  if can? :destroy, @unit
                    unit.item :destroy, I18n.t('general.destroy'), proposition_unit_path(@unit), method: :delete, confirm: I18n.t('general.questions.are_you_sure')
                  end
        
                  unit.item :show, I18n.t('general.details'), "#{proposition_unit_path(@unit)}#top"
                  unit.item :edit, I18n.t('general.edit'), edit_proposition_unit_path(@unit) if can? :edit, @unit
                end
              end
            end  
          end
        }
      }
    end
    
    def self.code
      Proc.new do |navigation|
        navigation.items do |primary|
          primary.dom_class = 'nav'
          
          instance_exec primary, VoluntaryProposition::Navigation.voluntary_menu_options[:organizations], &::Voluntary::Navigation.menu_code(:organizations)
          
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
    