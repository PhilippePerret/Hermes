# encoding: UTF-8

def require_folder(dossier)
  # puts "require_folder(#{dossier.inspect})"
  Dir["#{dossier}/**/*.rb"].each{|m|require m}
end #/ required_folder
