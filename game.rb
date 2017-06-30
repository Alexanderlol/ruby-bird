require 'gosu'
require_relative 'defstruct'

GameState = DefStruct.new{{
	scroll_x: 0,
}}

class GameWindow < Gosu::Window
	def initialize(*args)
		super
		@images = {
			background: Gosu::Image.new(self, 'images/background.png', false),
		  foreground: Gosu::Image.new(self, 'images/foreground.png', true),
		}
		@state = GameState.new
	end

	def update
		@state.scroll_x += 3
		if @state.scroll_x > @images[:foreground].width
			@state.scroll_x = 0
		end
	end

	def draw
		@images[:background].draw(0, 0, 0)
		@images[:foreground].draw(-@state.scroll_x, 0, 0)
		@images[:foreground].draw(-@state.scroll_x + @images[:foreground].width, 0, 0)
	end
end

window = GameWindow.new(320, 480, false)
window.show