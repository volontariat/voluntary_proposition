SimpleNavigation::Configuration.run do |navigation|
  instance_exec navigation, &VoluntaryProposition::Navigation.code
end