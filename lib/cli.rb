class Cli
  COLORS = { :green => 32, :red => 31 }

  def execute
    validate!
    if ARGV[0] == '--help' || ARGV[0] == '-h'
      print_instructions 
      exit 0
    end
    MalcolmX::find(ARGV) do |response|
      response.each do |x|
        text = "#{x[:domain]} => #{x[:available] ? "available" : "unavailable"}"
        color = x[:available] ? :green : :red
        puts colorize(text, color)
      end
    end
  end

  private

  def validate!
    if ARGV.empty?
      puts "invalid number of arguments\n"
      print_instructions
      exit 1
    end
  end


  def colorize(text, color)
    "\e[#{COLORS[color]}m#{text}\e[0m"
  end

  def print_instructions
    puts <<EOF
MalcolmX is a *cli* to [instantdomainsearch.com](http://instantdomainsearch.com),
it allows you to check if a given set of domain names are available. To start
using malcolmx install it via rubygems, and start using it like this:

    malcolmx cosmicvent minhajuddin myfunkyfreakydomain

Enjoy :)
EOF
  end

end
