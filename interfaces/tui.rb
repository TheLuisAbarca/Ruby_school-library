require 'os'

module Tui
  MAIN_INPUT_MESSAGE = 'Enter an option number here --> '.freeze
  MAIN_PRESSENTER_MESSAGE = 'Press ENTER to continue'.freeze

  def main_greeting_message
    puts ' ____       _                 _   _     _ _                          '
    puts '/ ___|  ___| |__   ___   ___ | | | |   (_) |__  _ __ __ _ _ __ _   _ '
    puts '\___ \ / __| \'_ \ / _ \ / _ \| | | |   | | \'_ \| \'__/ _` | \'__| | | |'
    puts ' ___) | (__| | | | (_) | (_) | | | |___| | |_) | | | (_| | |  | |_| |'
    puts '|____/ \___|_| |_|\___/ \___/|_| |_____|_|_.__/|_|  \__,_|_|   \__, |'
    puts '                                                               |___/ '

    puts '                 ____            _                 '
    puts '                / ___| _   _ ___| |_ ___ _ __ ___  '
    puts '                \___ \| | | / __| __/ _ \ \'_ ` _ \ '
    puts '                 ___) | |_| \__ \ ||  __/ | | | | |'
    puts '                |____/ \__, |___/\__\___|_| |_| |_|'
    puts '                       |___/                       '
  end

  def exit_greeting_message
    clear_screen

    puts ' _____ _                 _                           __            '
    puts '|_   _| |__   __ _ _ __ | | __  _   _  ___  _   _   / _| ___  _ __ '
    puts '  | | | \'_ \ / _` | \'_ \| |/ / | | | |/ _ \| | | | | |_ / _ \| \'__|'
    puts '  | | | | | | (_| | | | |   <  | |_| | (_) | |_| | |  _| (_) | |   '
    puts '  |_| |_| |_|\__,_|_| |_|_|\_\  \__, |\___/ \__,_| |_|  \___/|_|   '
    puts '                                |___/                              '
    puts
    puts '                                 _             '
    puts '                       _   _ ___(_)_ __   __ _ '
    puts '                      | | | / __| | \'_ \ / _` |'
    puts '                      | |_| \__ \ | | | | (_| |'
    puts '                       \__,_|___/_|_| |_|\__, |'
    puts '                                         |___/ '

    puts
    main_greeting_message
  end

  def clear_screen
    system('cls') if OS.windows?
    system('clear') if OS.posix?
  end

  def loading_effect
    system('timeout 5') if OS.windows?
    system('sleep 5') if OS.posix?
  end

  def progress_bar
    loading = 'Loading System ['
    1000.times do |i|
      j = i + 1
      next unless (j % 10).zero?

      loading << '='
      print "\r"
      print loading + " #{j / 10} %" if j / 10 != 100
      print loading + " #{j / 10} %]" if j / 10 == 100
      $stdout.flush
      sleep 0.05
      print "\r"
    end
    puts
  end

end
