#!/usr/bin/env ruby

require 'Qt'

class QtApp < Qt::Widget
  def initialize
    super

    setWindowTitle 'Buttons'

    init_ui

    resize 330, 170
    move 300, 300

    show
  end

  def init_ui
    vbox = Qt::VBoxLayout.new self
    hbox = Qt::HBoxLayout.new

    ok = Qt::PushButton.new "OK", self
    apply = Qt::PushButton.new "Apply", self

    hbox.addWidget ok, 1, Qt::AlignRight
    hbox.addWidget apply

    vbox.addStretch 1
    vbox.addLayout hbox
  end
end

app = Qt::Application.new ARGV
QtApp.new
app.exec
