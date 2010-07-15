# Warning : this script removes all the database content !

User.delete_all
Group.delete_all
Event.delete_all
Participant.delete_all
Team.delete_all
TeamMember.delete_all
TaskList.delete_all
Task.delete_all
Note.delete_all
GeoMap.delete_all

User.create(
  :login => 'wsmith',
  :email => 'will.smith@yopmail.com',
  :first_name => 'Will',
  :last_name => 'Smith')
User.create(
  :login => 'jdoe',
  :email => 'john.doe@yopmail.com',
  :first_name => 'John',
  :last_name => 'Doe')
User.create(
  :login => 'jdupont',
  :email => 'jean.dupont@yopmail.com',
  :first_name => 'Jean',
  :last_name => 'Dupont')

GeoMap.create(
  :address => "28 rue manoury, Bois Colombes",
  :width => 300,
  :zoom => 16)

Event.create(
  :title => 'RMLL 2010',
  :begining_at => Time.now.advance(:months => 1),
  :ending_at => Time.now.advance(:months => 1, :hours => 3),
  :abstract => 'Come discover a lot of free softwares at the RMLL !',
  :full_description => 'RMLL takes this year place in Bordeaux, it\'s origin place. Come discover a lot of free softwares at the RMLL !',
  :geo_map_id => GeoMap.find(:first).id)

Participant.create(
  :user => User.find(:first, :conditions => "login = 'jdupont'"),
  :event => Event.find(:first),
  :status => 0)
Participant.create(
  :user => User.find(:first, :conditions => "login = 'jdoe'"),
  :event => Event.find(:first),
  :status => 0)
Participant.create(
  :user => User.find(:first, :conditions => "login = 'wsmith'"),
  :event => Event.find(:first),
  :status => 0)

Team.create(
  :name => 'Lead Team',
  :event => Event.find(:first),
  :is_leading => true,
  :description => 'Lead team for this event')
Team.create(
  :name => 'Cleaning Team',
  :event => Event.find(:first),
  :is_leading => false,
  :description => 'Cleaning team for this event')

TeamMember.create(
  :user => User.find(:first, :conditions => "login = 'jdupont'"),
  :team => Team.find(:first, :conditions => "name = 'Lead Team'"),
  :auth_level => 0)
TeamMember.create(
  :user => User.find(:first, :conditions => "login = 'jdoe'"),
  :team => Team.find(:first, :conditions => "name = 'Cleaning Team'"),
  :auth_level => 1)
TeamMember.create(
  :user => User.find(:first, :conditions => "login = 'wsmith'"),
  :team => Team.find(:first, :conditions => "name = 'Cleaning Team'"),
  :auth_level => 2)

TaskList.create(
  :title => 'Cleaning the room',
  :description => 'Cleaning the room before and after the event',
  :event => Event.find(:first),
  :team => Team.find(:first, :conditions => "name = 'Cleaning Team'"))

Task.create(
  :task_list => TaskList.find(:first),
  :title => 'Clean the ground',
  :due_time => Time.now.advance(:months => 1, :days => -1))
Task.create(
  :task_list => TaskList.find(:first),
  :title => 'Clean the dishes',
  :due_time => Time.now.advance(:months => 1, :days => 1))

Note.create(
  :title => 'Organizational meeting',
  :event => Event.find(:first),
  :content => 'An organizational meeting will take place at the Room 5 on next Monday. Don\'t forget your notes')