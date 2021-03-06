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

if Redmine::VERSION::MAJOR >= 4

  class AddProjectTheme < ActiveRecord::Migration[5.1]
    def self.up
      add_column :projects, :theme_id, :string
    end
  
    def self.down
      remove_column :projects, :theme_id
    end
  end
  
else

  class AddProjectTheme < ActiveRecord::Migration
    def self.up
      add_column :projects, :theme_id, :string
    end
  
    def self.down
      remove_column :projects, :theme_id
    end
  end

end #def
