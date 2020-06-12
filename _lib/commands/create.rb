# encoding: UTF-8
=begin
  Module pour gérer la commande create
=end
class Hermes
class << self
  def create_source
    require_relative 'create/source'
    create
  end #/ create_source
  def create_pfa
    puts "Je vais créer un PFA"
    require_relative 'create/pfa'
  end #/ create_pfa
  def create_elements
    puts "Je vais créer un élément"
    require_relative 'create/elements'
  end #/ create_element
end # /<< self
end #/Hermes
