class MainScene < MG::Scene
  include Scenes

  def initialize(name)
    self.gravity = [0, 0]

    @time = 0
    @zombie_update_position = 0

    add_survivor(name.downcase)
    add_zombie

    on_touch_begin do |touch|
      @survivor.move_to([touch.location.x, touch.location.y], 2)
    end

    on_contact_begin do
      MG::Director.shared.replace(GameOverScene.new(@time))
    end

    start_update
  end

  def add_zombie
    @zombie = MG::Sprite.new("zombie.png")
    @zombie.attach_physics_box
    @zombie.position = [400, get_center[:height]]
    @zombie.contact_mask = 1

    add @zombie
  end

  def add_survivor(name)
    @survivor = MG::Sprite.new("survivors/#{name}.jpg")
    @survivor.attach_physics_box
    @survivor.position = [100, get_center[:height]]
    @survivor.contact_mask = 1

    add @survivor
  end

  def update(delta)

    @time += delta
    @zombie_update_position += delta

    if @zombie_update_position >= 2.0
      @zombie.move_to([random_position[:x], random_position[:y]], 1)
      @zombie.scale += 0.1
      @zombie_update_position = 0
    end
  end

  private
  def random_position
    {
      x: Random.new.rand(0..MG::Director.shared.size.width),
      y: Random.new.rand(0..MG::Director.shared.size.height)
    }
  end
end
