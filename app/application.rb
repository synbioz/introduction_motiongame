class Application < MG::Application
  def start
    MG::Director.shared.run(SurvivorScene.new)
  end
end
