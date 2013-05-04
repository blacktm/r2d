# song.rb

class Song
  
  def initialize(path)
    @song = R2D::Window.song(path)
  end
  
  def play
    @song.play
  end
  
  def play_loop
    @song.play(true)
  end
  
  def pause
    @song.pause
  end
  
  def playing?
    @song.playing?
  end
  
  def paused?
    @song.paused?
  end
  
  def stop
    @song.stop
  end
  
  def volume
    @song.volume
  end
  
end
