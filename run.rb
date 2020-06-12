#!/usr/bin/env ruby
# encoding: UTF-8
=begin
  Commande principale pour entrer dans l'application site perso
=end
require 'readline'

require_relative 'lib/_required'
require_module('help')

clear

# Afficher l'aide minimale initiale
Help.initial_help

prompt = "siteperso> "
while buffer = Readline.readline(prompt, true) do

  init_buffer = String.new(buffer.strip)

  # Pré-transformation de la commande jouée
  case buffer
  when /^(c[0-9a-z])$/ # Jouer une commande
    buffer = Site::Commands.get($1.freeze)
    puts "#{buffer}" unless buffer.nil?
  else
    buffer = buffer.strip.nil_if_empty
  end

  # On récupère les options (connues)
  # On pourra les obtenir par 'option?(<long option>)'
  buffer = CLI::Options.desoptionnize(buffer).strip.nil_if_empty

  # Commande NEXT
  if buffer == '_'
    buffer = Site::Commands.get_next_or_error
  end

  next if buffer.nil?

  # Réinitialisation quand on force l'update
  if option?(:force)
    Site::Rubrique.reset
    PageSite.reset
  end

  CLI.dispatch_command(buffer, init_buffer) || break

end
