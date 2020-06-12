def option?(name)
  return CLI::Options.has?(name)
end
class CLI
class Options
  DEFOPTIONS = [
    ['all', 'a'],
    ['debug','d'],
    ['force','f'],
    ['quiet', 'q']
  ]
class << self
  def reset
    @options = {}
  end
  def add name, value = true
    @options.merge!(name.to_sym => value)
  end
  def has?(name)
    @options.key?(name.to_sym)
  end
  def desoptionnize(buffer)
    reset
    buffer = buffer.strip
    DEFOPTIONS.each do |long, short|
      if buffer.include?(" --#{long}") || buffer.include?(" -#{short}")
        Options.add(long)
        buffer.sub!(/( --#{long}| -#{short})/,'')
      end
    end
    DEBUG.on = option?(:debug)
    return buffer
  end
end #/ << self
end #/ Options
end #/ CLI
