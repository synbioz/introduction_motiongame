class GameOverScene < MG::Scene
  include Scenes

  def initialize(score)
    add_label
    add_score(score)
  end

  def add_label
    label = MG::Text.new("Game over...", "Arial", 96)
    label.position = [get_center[:width], get_center[:height]]
    add label
  end

  def add_score(score)
    time = score.round(2)
    score = MG::Text.new("You survived #{time}s", "Arial", 40)
    score.position = [get_center[:width], get_center[:height] - 80]

    add score
  end
end
