module VoluntaryProposition
  class Ability
    def self.after_initialize
      Proc.new do |ability, user, options|
        ability.can :read, [
          Proposition::Unit
        ]
        
        if user.present?
          ability.can(:restful_actions, Proposition::Unit) {|unit| unit.organization.blank? || unit.organization.user_id == user.id }
        end
      end
    end
  end
end
