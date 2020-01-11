# encoding: utf-8
#
# Redmine plugin for providing project specific themes
#
# Copyright © 2019-2020 Stephan Wenzel <stephan.wenzel@drwpatent.de>
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#

module RedmineProjectThemes
  module Patches    
    module ProjectPatch
    
      def self.included(base) # :nodoc:
      
        base.send(:include, InstanceMethods)
        base.class_eval do
        
          def self.themes_for_group_statement
            "CASE #{self.table_name}.theme_id " + 
              Redmine::Themes.themes.map { |t| "WHEN '#{t.id}' THEN '#{t.name}'" }.join(" ") +
            " END"
          end #def
          
        end #class_eval
        
      end #included
      
      module InstanceMethods
        
        def theme_name
          theme.name if theme
        end #def
        
        def theme
          Redmine::Themes.theme(self.theme_id)
        end #def
        
      end #module InstanceMethods
      
    end  #module
  end  #module
end  #module

unless Project.included_modules.include?(RedmineProjectThemes::Patches::ProjectPatch)
  Project.send(:include, RedmineProjectThemes::Patches::ProjectPatch)
end
