AUTOCOMPLETIONS = [
  'histoire',
]
completion_proc = proc { |s| AUTOCOMPLETIONS.grep(/^#{Regexp.escape(s)}/) }

Readline.completion_append_character = ' '
Readline.completion_proc = completion_proc

# On utilise le mode vi
Readline.vi_editing_mode
