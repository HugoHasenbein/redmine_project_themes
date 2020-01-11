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
    module ProjectQueryPatch
    
      def self.included(base) # :nodoc:
        
        base.send(:prepend, InstanceMethods)
        base.class_eval do 
          unloadable
          
          self.available_columns += [
            QueryColumn.new(:theme_name, :sortable => "#{Project.table_name}.theme_id", :groupable => Project.themes_for_group_statement)
          ]
          
        end
        
      end #included
      
      module InstanceMethods
      
        def initialize_available_filters
          super
          add_available_filter "theme_id", 
            :type => :list_optional,
            :values => Redmine::Themes.themes.map{|t| [t.name, t.id]}
        end #def
        
      end #module InstanceMethods
      
    end  #module
  end  #module
end  #module

unless ProjectQuery.included_modules.include?(RedmineProjectThemes::Patches::ProjectQueryPatch)
  ProjectQuery.send(:include, RedmineProjectThemes::Patches::ProjectQueryPatch)
end
