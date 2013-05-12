require 'r2d'

window width: 100, height: 100

song = Song.new("../tmp/breakbeat.m4a")

on_key 'p' do
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

on_key 's' do
  song.stop
  puts "Song stopped"
end

# on_key 'c' do
#   puts "Window.current_song: #{Window.current_song}"
# end

on_key 'v' do
  puts "song.volume: #{song.volume}"
end

on_key 'l' do
  song.play_loop
  puts "Playing loop"
end

window :show
