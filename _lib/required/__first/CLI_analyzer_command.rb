class CLI

REG_RUBRIQUE = /([a-z_]+)/ # pour 'article' par exemple
REG_ITEM_ID = /([a-zA-Z0-9\-]+)/ # pour 20182219 par exemple
REG_CATEGORIE = /([a-zA-Z0-9_\-]+)/
REG_ANY = /([a-zA-Z0-9_\-]+)/
REG_MAYBE_CONTEXT = /(?: ([a-z]+))?/
REG_RUB_CONTEXT = /#{REG_RUBRIQUE}#{REG_MAYBE_CONTEXT}$/
REG_DESIGNATION = /#{REG_RUBRIQUE}(?:[ \/]#{REG_ITEM_ID})?#{REG_MAYBE_CONTEXT}$/
REG_DESIGNATION_CATE = /#{REG_RUBRIQUE}(?:[ \/]#{REG_ITEM_ID})?(?: #{REG_CATEGORIE})?#{REG_MAYBE_CONTEXT}$/
REG_ANY_THREE = /#{REG_ANY}(?: #{REG_ANY})?(?: #{REG_ANY})?/
class << self

def dispatch_command(command, init_command = nil)
  words = command.split(' ')
  puts "words: #{words.inspect}"
  operation = words.shift
  case operation
  when 'try'
    Sandbox.play
  when 'create'
    displatch_command_create(words)
  else
    puts "Je ne connais pas l'operation `#{operation}`.#{RC}Pour voir la liste des commandes, taper `help`.".rouge
  end
  return true
end

end #/self
end #/CLI

def displatch_command_create(words)
  choix = words.first || Q.select('Chose à créer') do |q|
    q.choices [
      {name:'Source (film, roman, …)', value: :source},
      {name:'Plan Fieldien', value: :pfa},
      {name:'Élements divers', value: :elements}
    ]
  end
  choix = choix.to_sym
  require './_lib/commands/create'
  Hermes.send("create_#{choix}".to_sym)
end #/ displatch_command_create
