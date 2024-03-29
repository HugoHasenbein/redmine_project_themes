# redmine_project_themes

Redmine plugin for providing project specific themes

### if you come from an earlier version, prior to 1.1.0

migrate back first by 

`bundle exec rake redmine:plugins:migrate RAILS_ENV=production VERSION=0 NAME=redmine_project_themes`

### Use case(s)

* when working with many projects it is advantegous to clone existing themes and change only some aspects like main menu bar color or background colors. This way it is easy to recognize in which project one is working

### Install

1. download plugin and copy plugin folder redmine_project_themes to Redmine's plugins folder 

2. migrate

`bundle exec rake redmine:plugins:migrate RAILS_ENV=production NAME=redmine_project_themes`

3. restart server f.i.  

`sudo /etc/init.d/apache2 restart`

(no migration is necessary)

### Uninstall

1. migrate back

`bundle exec rake redmine:plugins:migrate RAILS_ENV=production VERSION=0 NAME=redmine_project_themes`

2. go to plugins folder, delete plugin folder redmine_project_themes

`rm -r redmine_project_themes`

3. restart server f.i. 

`sudo /etc/init.d/apache2 restart`

### Use

* Go to Administration->Roles and permissions and grant right to edit project theme setting in the box Redmine Project Themes  
* Go to Projects->&lt;your project&gt;->Settings->Modules and tick 'Project Themes'
* Go to Projects->&lt;your project&gt;->Settings->Project-Theme and select your theme and save
* reload

![PNG that represents a quick overview](/doc/project_setting.png)

note: if you leave this field empty (select empty menu item), then this project gets the standard theme selected in Administration->Settings->Display

**Have fun!**

### Localisations

* 1.2.0
  - English
  - German
  - French, thanks to Richard Lehaut

### Change-Log* 

**1.2.0
 - supports zeitwerk, redmine 5+
 
**1.1.1
 - correction of French accents

**1.1.0**
 - supports redmine 4+
 - cleaned code
 
**1.0.2**
 - simplified module support
 - cleaned code
 
**1.0.1**
 - added module support
 - cleaned code
 
**1.0.0** 
  - running on Redmine 3.4.6, 3.4.11
