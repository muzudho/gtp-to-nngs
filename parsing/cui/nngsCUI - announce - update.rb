
  def update(args) 
    case args[0]
    when 'my_turn'
      puts '****** I am thinking now   ******'
    when 'his_turn'
      puts '****** wating for his move ******'
    end
  end
