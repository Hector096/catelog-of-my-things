require_relative '../author'
require_relative '../genre'
require_relative '../label'
require_relative '../music_album'
require_relative 'main_methods'
require_relative 'create_book'
require_relative 'create_game'
require_relative 'create_movie'

module CreateMusic
  include MainMethods

  def save_album
    File.write('json/album.json', JSON.dump(@music_albums))
  end

  def read_albums
    return unless File.exist?('json/album.json')

    file = File.read('json/album.json')
    file_data = JSON.parse(file)
    file_data.each do |album|
      album_instance = MusicAlbum.new(on_spotify: album['on_spotify'], publish_date: album['date'])
      label_instance = Label.new(title: album['title'], color: album['color'])
      album_instance.label = label_instance
      @music_albums.push(album_instance)
    end
  end

  def save_genre
    File.write('json/genre.json', JSON.dump(@genres))
  end

  def read_genre
    return unless File.exist?('json/genre.json')

    file = File.read('json/genre.json')
    file_data = JSON.parse(file)
    file_data.each do |genre|
      new_genre = Genre.new(name: genre['name'])
      @genres.push(new_genre)
    end
  end

  def create_music_album
    puts "\n When was the release date?(yyyy/mm/dd) "
    publish_date = gets.chomp

    print ' Is it on Spotify? Yes/No: '
    on_spotify = gets.chomp

    new_album = MusicAlbum.new(on_spotify: on_spotify, publish_date: publish_date)

    add_author(new_album)
    add_genre(new_album)
    add_label(new_album)
    add_source(new_album)

    save_genre
    save_label
    save_author
    save_source

    @music_albums.push(new_album)

    save_album

    puts Rainbow("\n Album created!").indianred.bright
    puts Rainbow('-----------------').indianred.bright
  end

  def album_list
    if @music_albums.length.zero?
      puts Rainbow("\n No albums added yet!").red.bright
      puts Rainbow('----------------------').red.bright
    else
      puts Rainbow("\n List of Albums:\n").aqua.bright.underline
      @music_albums.each_with_index do |album, index|
        print " #{index + 1}. Album title: #{album.label.title}\n  - "
        print " Published on: #{album.publish_date}\n  - Is it on Spotify #{album.on_spotify} #{album.label.title}\n"
        puts Rainbow("__________________________________________\n").aqua.bright
      end
    end
  end
end
