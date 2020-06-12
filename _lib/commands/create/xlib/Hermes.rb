# encoding: UTF-8
=begin

=end
class Hermes
class << self
  def types_element_for_ttyp
    @types_element_for_ttyp ||= TypeElement.collect { |typel| typel.paire_tty }
  end #/ types_element
end # /<< self
end #/Hermes
