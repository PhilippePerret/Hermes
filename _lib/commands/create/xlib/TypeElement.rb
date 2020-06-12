# encoding: UTF-8
=begin
  Class TypeElement
  -----------------
=end
class TypeElement < ContainerClass
# ---------------------------------------------------------------------
#
#   CLASSE
#
# ---------------------------------------------------------------------
class << self
  def table
    @table ||= 'types_element'
  end #/ table
end # /<< self
# ---------------------------------------------------------------------
#
#   INSTANCE
#
# ---------------------------------------------------------------------
attr_reader :data
def initialize data
  @data = data
end #/ initialize

def paire_tty
  {name:name, value:data[:id]}
end #/ paire_tty

end #/TypeElement
