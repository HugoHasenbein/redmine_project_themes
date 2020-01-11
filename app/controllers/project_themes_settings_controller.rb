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

class ProjectThemesSettingsController < ApplicationController

  unloadable

  before_action :find_project
  before_action :authorize


  def update
  
    begin
      @project.update_attribute(:theme_id, params.dig(:project, :theme_id))
      flash[:notice]= l(:label_project_theme_sucessfully_updated, :project => @project.name)
      
    rescue Exception => e
      flash[:error]= e.message
    end
    
    redirect_to :back
     
  end #def
  
end #class