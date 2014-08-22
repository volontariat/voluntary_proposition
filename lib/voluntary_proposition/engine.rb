require 'voluntary'

module VoluntaryProposition
  class Engine < ::Rails::Engine
    config.autoload_paths << File.expand_path("../../../app/models/concerns", __FILE__)
    config.autoload_paths << File.expand_path("../../../app/controllers/concerns", __FILE__)
    config.i18n.load_path += Dir[File.expand_path("../../../config/locales/**/*.{rb,yml}", __FILE__)]
    
    SimpleNavigation::config_file_paths << File.expand_path("../../../config", __FILE__)
    
    config.generators do |g|
      g.orm :active_record
    end
    
    config.to_prepare do
      Organization.send :include, ::VoluntaryProposition::Concerns::Model::Organization::HasUnits
      
      ::Ability.add_after_initialize_callback(VoluntaryProposition::Ability.after_initialize)
      
      VoluntaryProposition::Navigation.voluntary_menu_customization
    end
    
    initializer "voluntary_proposition.add_view_helpers" do |config|
      ActionView::Base.send :include, VoluntaryProposition::UnitsHelper
    end
  end
end
