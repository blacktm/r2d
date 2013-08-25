require 'r2d'

window = R2D::Window.new(width: 100, height: 100)

song = R2D::Song.new("../tmp/breakbeat.m4a")

window.on_key 'p' do
  if song.playing?
    song.pause
    puts "song.playing?: #{song.playing?}"
    puts "song.paused?: #{song.paused?}"
  else
    song.play
    puts "song.playing?: #{song.playing?}"
    puts "song.paused?: #{song.paused?}"
  end
end

window.on_key 's' do
  song.stop
  puts "Song stopped"
end

window.on_key 'c' do
  puts "window.current_song: #{window.current_song}"
end

window.on_key 'v' do
  puts "song.volume: #{song.volume}"
end

window.on_key 'l' do
  song.loop
  puts "Playing loop"
end

window.show
