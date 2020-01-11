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
    module RedmineThemesThemePatch
      def self.included(base)
        base.send(:include, InstanceMethods)
        
        base.class_eval do
          unloadable
          
          def to_s
            name
          end #def
          
          def inspect
            "#<#{ self.to_s} #{ self.instance_variables.collect{ |e| "#{e}: #{instance_variable_get(e)}" }.join(', ') }>"
          end #def
        end
      end
      
      module InstanceMethods
      end
    end
  end
end

unless Redmine::Themes::Theme.included_modules.include?(RedmineProjectThemes::Patches::RedmineThemesThemePatch)
  Redmine::Themes::Theme.send(:include, RedmineProjectThemes::Patches::RedmineThemesThemePatch)
end



