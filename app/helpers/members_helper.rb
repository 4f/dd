#encoding: UTF-8
module MembersHelper
  def print_role role
    ( [0,1,2,3].include?(role) ) ? ( ['-', 'Ведущий', 'Гость', 'Исполнитель'][role] ) : '-'
  end
  
end
