#!/usr/bin/env ruby
# encoding: UTF-8
=begin
  Fichier principal
=end
begin
  require './_lib/required'

  prompt = "hermes> "
  while buffer = Readline.readline(prompt, true) do

    init_buffer = String.new(buffer.strip)

    # Pré-transformation de la commande jouée
    case buffer
    when /^(c[0-9a-z])$/ # Jouer une commande
      puts "#{buffer}" unless buffer.nil?
    else
      buffer = buffer.strip.nil_if_empty
    end

    puts "buffer au final: #{buffer}"

    # On récupère les options (connues)
    # On pourra les obtenir par 'option?(<long option>)'
    buffer = CLI::Options.desoptionnize(buffer).strip.nil_if_empty

    break if buffer == 'exit' || buffer == 'x'

    # Commande NEXT
    if buffer == '_'

    end

    next if buffer.nil?

    # Réinitialisation quand on force l'update
    if option?(:force)

    end

    CLI.dispatch_command(buffer, init_buffer) || break

  end

rescue Exception => e
  puts e.message
  puts e.backtrace.join("\n")
end
