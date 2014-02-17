require 'r2d'

window = R2D::Window.new

sound = R2D::Sound.new(window, "media/note.wav")

window.on_key 'p' do
  sound.play
end

window.show
