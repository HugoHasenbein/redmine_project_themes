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
    module ProjectsHelperPatch
      def self.included(base)
        base.send(:include, InstanceMethods)
        
        base.class_eval do
          unloadable
          
          if Rails::VERSION::MAJOR >= 5
            alias_method :project_settings_tabs_without_project_themes_setting, :project_settings_tabs
            alias_method :project_settings_tabs, :project_settings_tabs_with_project_themes_setting
          else
            alias_method_chain :project_settings_tabs, :project_themes_setting
          end
          
        end
      end
      
      module InstanceMethods
        # Append tab for issue templates to project settings tabs.
        def project_settings_tabs_with_project_themes_setting
          tabs = project_settings_tabs_without_project_themes_setting
          
          action = {  name:         'project_themes_settings',
                      partial:      'project_themes_settings/update',
                      controller:   'project_themes_settings',     #needed only for permission checking
                      action:       :update,                       #needed only for permission checking
                      label:        :label_project_themes_settings
          }
          tabs << action if User.current.allowed_to?(action, @project) 
          tabs
        end
      end
    end
  end
end

unless ProjectsHelper.included_modules.include?(RedmineProjectThemes::Patches::ProjectsHelperPatch)
  ProjectsHelper.send(:include, RedmineProjectThemes::Patches::ProjectsHelperPatch)
end



