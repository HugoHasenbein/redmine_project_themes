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

module RedmineProjectThemes
  module Patches    
    module ProjectPatch
    
      def self.included(base) # :nodoc:
      
        if Rails::VERSION::MAJOR >= 5
          base.send(:include, InstanceMethods)
          base.class_eval do
            def self.ui_theme_for_group_statement
              "CASE #{self.table_name}.ui_theme " + 
              Redmine::Themes.themes.map { |t| "WHEN '#{t.id}' THEN '#{Redmine::Themes.theme(t.id).name}'" }.join(" ") +
              "END "
            end #def
          end #class_eval
        end #if
        
      end #included
      
      module InstanceMethods
        
        def ui_theme
          Redmine::Themes.theme(super) && Redmine::Themes.theme(super).name
        end #def
        
      end #module InstanceMethods
      
      module ClassMethods
      end  #module ClassMethods
      
    end  #module
  end  #module
end  #module

unless Project.included_modules.include?(RedmineProjectThemes::Patches::ProjectPatch)
  Project.send(:include, RedmineProjectThemes::Patches::ProjectPatch)
end
