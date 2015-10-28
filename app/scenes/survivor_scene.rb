class SurvivorScene < MG::Scene
  include Scenes

  def initialize

    add_label
    add_survivors
  end

  def add_label
    label = MG::Text.new("Choose your survivor", "Arial", 80)
    label.color = [0.7, 0.7, 0.7]
    label.position = [get_center[:width], MG::Director.shared.size.height - 100]

    add label
  end

  def add_survivors

    ["Martin", "Nico", "Victor", "Jon", "Numa", "Clement", "Theo", "Cedric"].each_with_index do |name, index|

      button = MG::Button.new("#{name}")
      button.font_size = 35
      button.position = [get_center[:width], (MG::Director.shared.size.height - 200) - (index * 50)]
      button.on_touch { MG::Director.shared.replace(MainScene.new(name)) }

      add button
    end
  end
end
