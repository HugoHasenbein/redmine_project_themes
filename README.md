# redmine_project_themes

Redmine plugin for providing project specific themes

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

`rm -r redmine_tint_issues`

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

* 1.0.2
  - English
  - German

### Change-Log* 

**1.0.2**
 - simplified module support
 - cleaned code
 
**1.0.1**
 - added module support
 - cleaned code
 
**1.0.0** 
  - running on Redmine 3.4.6, 3.4.11
