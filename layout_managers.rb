#!/usr/bin/env ruby

require 'Qt'

class QtApp < Qt::Widget

  def initialize
    super

    setWindowTitle 'Absolute'

    init_ui

    resize 300, 280
    move 300, 300

    show
  end

  def init_ui
    setStyleSheet "QWidget { background-color: #414141 }"

    bardejov = Qt::Pixmap.new "bardejov.jpg"
    rotunda = Qt::Pixmap.new "rotunda.jpg"
    mincol = Qt::Pixmap.new "mincol.jpg"

    barLabel = Qt::Label.new self
    barLabel.setPixmap bardejov
    barLabel.move 20, 20

    rotLabel = Qt::Label.new self
    rotLabel.setPixmap rotunda
    rotLabel.move 40, 160

    minLabel = Qt::Label.new self
    minLabel.setPixmap mincol
    minLabel.move 170, 50
  end
end

app = Qt::Application.new ARGV
QtApp.new
app.exec
