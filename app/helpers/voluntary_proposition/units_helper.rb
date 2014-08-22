module VoluntaryProposition
  module UnitsHelper
    def unit_tree(unit)
      if unit.has_children?
        children_units = ''
        
        unit.children.each do |child_unit|
          children_units += content_tag(:li, link_to(child_unit.name, child_unit) + unit_tree(child_unit))
        end
        
        raw content_tag :ul, children_units.html_safe
      end
    end
  end
end