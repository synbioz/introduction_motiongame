module Scenes

  def get_center
    {
      width: MG::Director.shared.size.width / 2,
      height: MG::Director.shared.size.height / 2
    }
  end
end
