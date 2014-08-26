Given /^a proposition unit named "([^\"]*)" assigned to my organization$/ do |name|
  @unit = FactoryGirl.create(:proposition_unit, name: name, organization: @organization) 
  @unit.reload
end
