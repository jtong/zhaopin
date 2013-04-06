module HamlHelper
  def custom_render(content, args)
    engine = Haml::Engine.new(content)
    engine.render self, args
  end
end