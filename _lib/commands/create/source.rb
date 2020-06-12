# encoding: UTF-8
class Hermes
class << self
  def create
    data = {name:nil, type:nil}
    data[:name] = Q.ask('Nom de la source (titre)', required: true)
    data[:type] = Q.select('Type de source') do |q|
      q.choices source_types
      q.per_page source_types.count
    end
    # On doit enregistrer
    new_id = db_compose_insert('sources', data)
    puts "Création de la source d'id ##{new_id}"
  end #/ create

  def source_types
    @source_types ||= begin
      [
        {name:'Film cinéma', value: 1},
        {name:'Épisode de série', value:2},
        {name:'Roman', value: 3},
        {name:'Autre', value: 99}
      ]
    end
  end #/ source_types
end # /<< self
end #/Hermes
