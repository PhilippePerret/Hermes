# encoding: UTF-8
class Hermes
class << self
  # Création d'un pfa
  #
  # Pour crée un élément quelconque
  def create
    etype = nil
    value = ''
    source_id = nil
    dont_save = false # pour renoncer sans sauver
    while true
      source_id = Q.ask('Source de l’élément (ID)', required: true, default: source_id)
      puts "Source : #{Source.get(source_id).name}".vert
      etype = Q.select('Type de l’élément', default: etype) do |q|
        q.choices types_element_for_ttyp
        q.per_page types_element_for_ttyp.count
      end
      value = Q.ask('Description (texte utilisé)'.freeze, default: value)
      case Q.keypress('OK ? (y/n/ q:pour renoncer)').downcase
      when 'o','y',"\r" then break
      when 'q' then
        dont_save = true
      end
    end
    # On crée l'élément
    unless dont_save
      new_id = db_compose_insert('field_elements', {type_id: etype, content: value})
      puts "Nouvel élément ##{new_id} créé.".bleu
    end
  end #/ create

end # /<< self
end #/Hermes
puts "<- create/lib/Hermes.rb"
