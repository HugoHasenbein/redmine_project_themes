# encoding: utf-8
#
# Redmine plugin for providing project specific themes
#
# Copyright © 2019 Stephan Wenzel <stephan.wenzel@drwpatent.de>
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

require 'redmine'

Redmine::Plugin.register :redmine_project_themes do
  name 'Redmine Project Themes'
  author 'Stephan Wenzel'
  description 'This plugin provides project specific themes'
  version '0.0.1'
  url 'https://github.com/HugoHasenbein/redmine_project_themes'
  author_url 'https://github.com/HugoHasenbein/redmine_project_themes'
  requires_redmine version_or_higher: '3.4'

  #---------------------------------------------------------------------------------------
  # Permissions
  #---------------------------------------------------------------------------------------
  
  # this adds the module to the project configuration
  project_module :redmine_project_themes do
  
    permission :edit_project_themes_settings, 
               :project_themes_settings => [:update]
               
  end
end

require 'redmine_project_themes'

