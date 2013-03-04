module HamlHelper
  def cumstom_render(content, args)
    engine = Haml::Engine.new(content)
    engine.render self, args
  end
end