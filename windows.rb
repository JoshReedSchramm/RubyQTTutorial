#!/usr/bin/env ruby

require 'Qt'

class QtApp < Qt::Widget
  def initialize
    super

    setWindowTitle 'Windows'

    init_ui

    resize 350, 300
    move 300, 300

    show
  end

  def init_ui
    vbox = Qt::VBoxLayout.new self

    vbox1 = Qt::VBoxLayout.new
    hbox1 = Qt::HBoxLayout.new
    hbox2 = Qt::HBoxLayout.new

    windLabel = Qt::Label.new "Windows", self
    edit = Qt::TextEdit.new self
    edit.setEnabled false

    activate = Qt::PushButton.new "Activate", self
    close = Qt::PushButton.new "Close", self
    help = Qt::PushButton.new "Help", self
    ok = Qt::PushButton.new "OK", self

    vbox.addWidget windLabel

    vbox1.addWidget activate
    vbox1.addWidget close, 0, Qt::AlignTop

    hbox1.addWidget edit
    hbox1.addLayout vbox1

    vbox.addLayout hbox1

    hbox2.addWidget help
    hbox2.addStretch 1
    hbox2.addWidget ok

    vbox.addLayout hbox2, 1
    setLayout vbox
  end
end

app = Qt::Application.new ARGV
QtApp.new
app.exec
