# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.create!(
  title: 'Squirel',
  description: %(Pellentesque massa placerat duis ultricies lacus sed. Tempus quam
    ellentesque nec nam aliquam sem et. Phasellus vestibulum lorem sed risus ultricies
    unc id cursus metus aliquam eleifend mi in nulla. Maecenas pharetra convallis
    posuere morbi leo. Volutpat ac tincidunt vitae semper quis. In fermentum et
    sollicitudin ac orci phasellus egestas tellus rutrum. Suspendisse in est ante in
    nibh mauris. Luctus accumsan tortor posuere ac ut consequat semper viverra nam.
    Montes nascetur ridiculus mus mauris vitae ultricies leo integer. Laoreet non
    curabitur gravida arcu. Eget gravida cum sociis natoque penatibus. Elementum
    sagittis vitae et leo duis. Donec ac odio tempor orci dapibus ultrices in. In vitae
    turpis massa sed elementum tempus. Dolor sed viverra ipsum nunc aliquet.),
  image_url: 'squirel.jpg',
  price: 1.99
)
Product.create!(
  title: 'Tiger',
  description: %(Bibendum enim facilisis gravida neque convallis a cras.
    Nisi scelerisque eu ultrices vitae auctor.
    Venenatis cras sed felis eget velit aliquet sagittis id consectetur.
    Feugiat nisl pretium fusce id velit.
    Urna condimentum mattis pellentesque id nibh tortor.
    Amet volutpat consequat mauris nunc.
    Eu turpis egestas pretium aenean. Euismod elementum nisi quis eleifend quam
    adipiscing. Posuere urna nec tincidunt praesent semper feugiat.
    Ultrices vitae auctor eu augue ut. Dictum at tempor commodo ullamcorper a.
    Faucibus turpis in eu mi bibendum neque egestas congue quisque.
    Massa id neque aliquam vestibulum morbi blandit cursus.
    Quam elementum pulvinar etiam non quam lacus suspendisse faucibus interdum.
    Auctor urna nunc id cursus metus aliquam. Diam maecenas ultricies mi eget.
    Pellentesque habitant morbi tristique senectus.
    Magna fermentum iaculis eu non diam phasellus vestibulum.
    Morbi tristique senectus et netus et malesuada fames ac turpis.
    Id diam maecenas ultricies mi.),
  image_url: 'tiger.jpg',
  price: 8.99
)
Product.create!(
  title: 'Dog',
  description: %(Sed vulputate mi sit amet mauris. Ultrices mi tempus imperdiet nulla. Pulvinar elementum integer enim neque volutpat ac. Odio aenean sed adipiscing diam donec. Tempus imperdiet nulla malesuada pellentesque elit eget gravida. Tristique magna sit amet purus gravida quis blandit turpis. Risus at ultrices mi tempus imperdiet. At erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Pellentesque nec nam aliquam sem. Rhoncus mattis rhoncus urna neque viverra justo nec. Tincidunt tortor aliquam nulla facilisi cras fermentum. Vestibulum lorem sed risus ultricies tristique nulla aliquet enim. Elementum facilisis leo vel fringilla est. Quis viverra nibh cras pulvinar mattis. Felis imperdiet proin fermentum leo vel. Tortor id aliquet lectus proin nibh nisl. Quam id leo in vitae turpis massa sed. Mauris nunc congue nisi vitae suscipit tellus mauris. Sit amet consectetur adipiscing elit ut aliquam purus.),
  image_url: 'dog.jpg',
  price: 4.99
)

Product.create!(
  title: 'Cat',
  description: %(Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.),
  image_url: 'cat.jpg',
  price: 9.99
)

