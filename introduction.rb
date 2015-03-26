#!/usr/bin/env ruby

require 'Qt'

WIDTH = 250
HEIGHT = 150

class QtApp < Qt::Widget

  def initialize
    super

    setWindowTitle "Center"

    init_ui

    resize WIDTH, HEIGHT

    center
    show
  end

  def center
    qdw = Qt::DesktopWidget.new

    screenWidth = qdw.width
    screenHeight = qdw.height

    x = (screenWidth - WIDTH) / 2
    y = (screenHeight - HEIGHT) / 2

    move x, y
  end

  def init_ui
    quit = Qt::PushButton.new 'Quit', self
    quit.resize 80, 30
    quit.move ((WIDTH / 2) - 40), ((HEIGHT / 2) - 15)
    connect quit, SIGNAL('clicked()'), $qApp, SLOT('quit()')
  end
end

app = Qt::Application.new ARGV
QtApp.new
app.exec
