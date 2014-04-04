module VoluntaryProposition
  class Ability
    def self.after_initialize
      Proc.new do |ability, user, options|
      end
    end
  end
end
