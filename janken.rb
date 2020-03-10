# じゃんけんゲーム！
class Player #自分の手
  def hand
    puts "数字を入力してください。"
    puts "0:グー\n1:チョキ\n2:パー"
    loop_flg = true
    while loop_flg
      player_hand = gets.chomp
      unless (player_hand == "0" || player_hand == "1" || player_hand == "2")
        puts "エラーです。もう一度数字を入力してください。"
        puts "0:グー, 1:チョキ, 2:パー"
        loop_flg = true #while処理を繰り返す
      else
        loop_flg = false #while処理を抜ける
        player_hand = player_hand.to_i
        return player_hand
      end
    end
  end
end

class Enemy # 相手の手
  def hand
    enemy_hand = rand(3)
  end
end

# プレイヤー(自分)が入力した「0 ~ 2」と、敵がランダムで生成した「0 ~ 2」をじゃんけんをさせて、その結果をコンソール上に出力
class Janken
  def pon(player_hand, enemy_hand)
    janken = ["グー", "チョキ", "パー"]
    puts "あなたの手は#{janken[player_hand]}で、相手の手は#{janken[enemy_hand]}です。"
    if (player_hand == enemy_hand)
      puts "あいこです。もう１回勝負！"
      return true #next_gameを繰り返す
    elsif (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
      puts "あなたの勝ちです！やったね！"
      return false
    else
      puts "あなたの負けです。ざんねん！"
      return false
    end
  end
end

# 変数「player」にPlayerをインスタンス化したものを代入します。
player = Player.new
# 変数「enemy」にEnemyをインスタンス化したものを代入します。
enemy = Enemy.new
# 変数「janken」にJankenをインスタンス化したものを代入します。
janken = Janken.new
# 変数「next_game」に「true」を代入します。
next_game = true
# 「next_game」が「false」にならない限り、永久にwhileで繰り返し処理を実行します。

while next_game
  next_game = janken.pon(player.hand, enemy.hand)
end
