# song.rb

module R2d
  class Song

    def initialize(path)
      @song = Window.song(path)
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

    def song
      @song.stop
    end

    def volume
      @song.volume
    end

    def stop
      @song.stop
    end

  end
end
