#!/usr/bin/env ruby

require 'Qt'

WIDTH = 250
HEIGHT = 150

class QtApp < Qt::Widget

  def initialize
    super

    setWindowTitle "Center"
    setWindowFlags Qt::FramelessWindowHint

    qdw = Qt::DesktopWidget.new

    resize qdw.width, qdw.height

    init_ui(qdw)
    move 0,0
    # center(qdw)
    show
  end

  def center(qdw)
    screenWidth = qdw.width
    screenHeight = qdw.height

    x = screenWidth / 2
    y = screenHeight / 2

    move x, y
  end

  def init_ui(qdw)
    quit = Qt::PushButton.new 'Quit', self
    quit.resize 80, 30
    quit.move (qdw.width / 2 - 40), (qdw.height / 2 - 15)
    connect quit, SIGNAL('clicked()'), $qApp, SLOT('quit()')
  end
end

app = Qt::Application.new ARGV
QtApp.new
app.exec
