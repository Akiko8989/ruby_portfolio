class Date

  attr_accessor :name, :hobby, :food, :point
  
  def initialize(name:, hobby:, food:, point:)
    @name = name
    @hobby = hobby
    @food = food
    @point = point
  end

  def introduce
    puts "＜#{@name}＞"
    puts "はじめまして。#{@name}です！よろしくお願いします。"
  end

  def plan
    plans = [ "カフェ", "ドライブ", "水族館"]
    puts "夜ご飯の前にどこかへいきましょう！何がいいですか？"
    plans.each do |plan|
      puts "#{plan}"
    end
  end

  def talking(you)
    puts "＜#{@name}＞"
    puts "#{you.name}さんは休日はどう過ごされているんですか？"
  end

  def dinner
    dinners = [ "カニ", "中華", "イタリアン"]
    puts "そろそろお腹空きましたね。何を食べましょうか？"
    dinners.each do |dinner|
      puts "#{dinner}"
    end
  end

  def ending(you)
    puts "＜#{@name}＞"
    puts "美味しかったですね！"
    if @point >= 30
      puts <<~TEXT
      #{you.name}さん、今日はとっっっても楽しかったです！ありがとうございました！よかったらまた行きましょう
      〜次の日〜
      昨日はありがとうございました！次の週末とか空いてますか？よければまた！
      TEXT
    else
      puts "#{you.name}さん、今日は楽しかったです！ありがとうございました！"
    end
  end
end

class You

  attr_accessor :name, :hobby
  
  def info
    puts "あなたの情報を入力してください"
    puts "名前"
    @name = gets.chomp
    puts "趣味"
    @hobby = gets.chomp
  end

  def selected_plan(date)
    selected_plan = gets.chomp
 
    puts "＜#{@name}＞"
    puts "#{selected_plan}がいいです！"
    if selected_plan == "ドライブ"
      puts "〜#{selected_plan}しながら、おしゃべり〜"
    else
      puts "〜#{selected_plan}へ移動後、おしゃべり〜"
    end

    if selected_plan == "カフェ"
      date.point += 5
    elsif selected_plan == "ドライブ"
      date.point += 10
    else
      date.point += 3
    end
    puts date.point
  end

  def talking_answer(date)
    puts "＜#{@name}＞"
    puts "#{@hobby}をよくします"
    if date.hobby == @hobby
      puts "＜#{date.name}＞"
      puts "趣味同じじゃないですか！気が合いますね！"
      date.point += 10
    elsif "ドライブ" == @hobby
      puts "＜#{date.name}＞"
      puts "ドライブいいですよね〜！"
      date.point += 5
    else
      puts "＜#{date.name}＞"
      puts "そうなんですね〜"
      date.point += 0   
    end
    puts date.point
  end

  def select_dinner(date)
    selected_dinner = gets.chomp
    puts <<~TEXT
    ＜#{@name}＞
    #{selected_dinner}を食べたいです！
    〜#{selected_dinner}が美味しいお店へ移動し、食事を楽しむ〜
    TEXT
    if selected_dinner == "カニ"
      date.point += 10
    elsif selected_dinner == "中華"
      date.point += 5
    else
      date.point += 2
    end
    puts date.point
  end
end


you = You.new
you.info
date = Date.new(name: "りょう", hobby: "読書", food: "カニ", point: 10)
date.introduce
date.plan
you.selected_plan(date)
date.talking(you)
you.talking_answer(date)
date.dinner
you.select_dinner(date)
date.ending(you)

