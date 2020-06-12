# encoding: UTF-8
class Hermes
class << self
  # Création d'un pfa
  #
  # Ça consiste à créer des éléments pour chaque élément
  def create
    values = []
    content = ''
    source_id = Q.ask('Source du PFA (ID)', required:true).to_i
    TypeElement.each do |typel|
      content = Q.ask('Description de “%s”'.freeze % [typel.name])
      values << {source_id: source_id, type_id: typel.id, content: content}
    end
    if ['o','y',"\r"].include?(Q.keyspress("Sauver tout ça ?").downcase)
      # On crée tous les éléments créés
      values.each do |value|
        new_id = db_compose_insert('field_elements', value)
        puts "Nouvel élément ##{new_id} créé.".bleu
      end
    end
  end #/ create

end # /<< self
end #/Hermes
puts "<- create/lib/Hermes.rb"
