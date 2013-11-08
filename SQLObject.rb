require 'active_support/inflector'

class SQLObject
  #class will interact with database

  def self.set_table(str)
    @table_name = str.tableize
    #let user specify the table for queries
  end

  def self.table_name
    @table_name ||= ''
  end

  def self.all
    everything =
    find
  end

end