# sound.rb

module R2D
  class Sound
    
    def initialize(path)
      @sound = nil
    end
    
    def play
      @sound.play
    end
    
    def play_loop
      @sound.play(true)
    end
    
    def pause
      @sound.pause
    end
    
    def playing?
      @sound.playing?
    end
    
    def paused?
      @sound.paused?
    end
    
    def stop
      @sound.stop
    end
    
    def volume
      @sound.volume
    end
    
  end
end
