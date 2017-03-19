# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create(first_name: 'Anton', last_name: 'Shevchuk', email: 'anton@shevchuk.name', password: 'admin', password_confirmation: 'admin', role: 'admin')

mateo = User.create(first_name: 'Mateo', last_name: 'Lazo', email: 'mateo@email.com', password: 'Mateo1', password_confirmation: 'Mateo1', role: 'editor', bio: "Mateo: a long time ago in a galaxy far, far away")
julian = User.create(first_name: 'Julian', last_name: 'Jones', email: 'julian@email.com', password: 'Julian1', password_confirmation: 'Julian1', role: 'editor', bio: "Julian specialist in computer and video games")
freida = User.create(first_name: 'Freida', last_name: 'Gray', email: 'freida@email.com', password: 'Freida1', password_confirmation: 'Freida1', role: 'editor', bio: "Freida - resulting in significant development")

cat1 = Category.create(name: 'Movie')
cat2 = Category.create(name: 'Cartoon')
cat3 = Category.create(name: 'Sport')
cat4 = Category.create(name: 'Documentary')

tag1 = Tag.create(name: 'Action')
tag2 = Tag.create(name: 'Adventure')
tag3 = Tag.create(name: 'Comedy')
tag4 = Tag.create(name: 'Drama')

page1 = Page.create(
  user_id: mateo.id,
  category_id: cat1.id,
  title: "Star Wars review",
  content: "
    <p>Star Wars is an American epic space opera franchise, centered on a film series created by George Lucas. It depicts the adventures of various characters 'a long time ago in a galaxy far, far away'.</p>
    <p>The franchise began in 1977 with the release of the film Star Wars (subtitled Episode IV: A New Hope in 1981[2][3]), which became a worldwide pop culture phenomenon. It was followed by the successful sequels The Empire Strikes Back (1980) and Return of the Jedi (1983); these three films constitute the original Star Wars trilogy. A prequel trilogy was released between 1999 and 2005, which received mixed reactions. A sequel trilogy began in 2015 with the release of Star Wars: The Force Awakens. All seven films were nominated for Academy Awards (with wins going to the first two films) and have been commercial successes, with a combined box office revenue of over $7.5 billion,[4] making Star Wars the third highest-grossing film series.[5] Spin-off films include Star Wars: The Clone Wars (2008) and Rogue One (2016), which is the first in an upcoming series of anthology films.</p>
    <p>The series has spawned an extensive media franchise—the Star Wars expanded universe—including books, television series, computer and video games, and comic books, resulting in significant development of the series's fictional universe. Star Wars also holds a Guinness World Records title for the 'Most successful film merchandising franchise. In 2015, the total value of the Star Wars franchise was estimated at USD $41.9 billion,[6] making Star Wars the second highest-grossing media franchise of all time.</p>"
)
page1.tags << [tag1, tag2]

page2 = Page.create(
  user_id: mateo.id,
  category_id: cat1.id,
  title: "Star Wars review. Part II",
  content: "
    <p>The events depicted in the Star Wars franchise take place in an unnamed fictional galaxy at an undetermined point in the distant past. Many species of alien creatures (often humanoid) are depicted. Robotic droids are also commonplace and are generally built to serve their owners. Space travel is common, and many planets in the galaxy are members of a single galactic government. In the prequel trilogy, this is depicted in the form of the Galactic Republic; at the end of the prequel trilogy and throughout the original trilogy, this government is the Galactic Empire. Preceding and during the sequel trilogy, this government is the New Republic.</p>
    <p>The films feature the Jedi, who adhere to the light side of the Force to serve as peacekeepers and guardians, and the Sith, who use the dark side of the Force for evil in an attempt to destroy the Jedi Order and the Republic and rule the galaxy for themselves. The sequel trilogy introduces the Knights of Ren, an order of practitioners of the dark side of the Force aligned with the First Order.</p>
    <p>The series has spawned an extensive media franchise—the Star Wars expanded universe—including books, television series, computer and video games, and comic books, resulting in significant development of the series's fictional universe. Star Wars also holds a Guinness World Records title for the 'Most successful film merchandising franchise. In 2015, the total value of the Star Wars franchise was estimated at USD $41.9 billion,[6] making Star Wars the second highest-grossing media franchise of all time.</p>"
)
page2.tags << [tag1, tag2]

page3 = Page.create(
  user_id: julian.id,
  category_id: cat2.id,
  title: "Lorem ipsum. Part I",
  content: "<p>
Praesent lobortis risus sed orci commodo viverra. Donec ullamcorper molestie convallis. Etiam sem velit, imperdiet a libero ac, tempor rhoncus nisi. Proin imperdiet auctor ipsum eget sollicitudin. Nunc volutpat purus mi, vel fringilla turpis hendrerit eget. Nunc pharetra semper lacus, et mattis diam euismod sit amet. Morbi vitae laoreet libero. Nulla vel posuere massa, ac consequat ligula. Duis accumsan accumsan dui a mattis. Morbi congue urna vel dapibus aliquam. Curabitur ut maximus magna. Aenean vel arcu nisl. Praesent eget massa non justo tincidunt tincidunt sed non mauris.
</p>
<p>
In faucibus, orci ac pulvinar vestibulum, dolor neque convallis nibh, non consectetur purus quam porta neque. Praesent tincidunt scelerisque purus nec iaculis. Cras eu nunc porttitor est dignissim sagittis. Proin eget lacinia nunc. Cras vitae sapien in nunc sagittis iaculis. Mauris posuere eros nec leo aliquet mollis. Nulla facilisi. Vivamus ut ultrices tellus, id volutpat mauris. Phasellus imperdiet urna nibh, ac venenatis tellus gravida a. Vestibulum sagittis ex at nibh bibendum aliquet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
</p>
<p>
Vestibulum id nisi tempus eros elementum tempor. Donec porta augue magna, ac consequat nisi scelerisque sed. Sed commodo, dui vel cursus sodales, orci nisl laoreet justo, nec luctus urna felis non neque. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur posuere nulla erat, sed auctor velit convallis eu. Proin eleifend augue vitae euismod egestas. Maecenas lobortis magna vel enim vulputate aliquet. Nullam pellentesque lobortis dignissim. Sed ac mi et quam posuere aliquam a a metus.
</p>
<p>
Cras blandit dictum velit, a malesuada sem fermentum in. Pellentesque eu libero erat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam aliquet mi a venenatis ultricies. Nunc malesuada quam nec sollicitudin dignissim. Vestibulum laoreet diam quis cursus sodales. Nullam condimentum dignissim fringilla. Donec facilisis semper ex, id bibendum tortor tincidunt facilisis. Nam tempus ornare arcu in fermentum. Vivamus odio quam, pretium ac nibh ac, porta scelerisque ipsum.
</p>"
)
page3.tags << [tag1, tag3]

page4 = Page.create(
  user_id: julian.id,
  category_id: cat2.id,
  title: "Lorem ipsum. Part II",
  content: "<p>
Praesent lobortis risus sed orci commodo viverra. Donec ullamcorper molestie convallis. Etiam sem velit, imperdiet a libero ac, tempor rhoncus nisi. Proin imperdiet auctor ipsum eget sollicitudin. Nunc volutpat purus mi, vel fringilla turpis hendrerit eget. Nunc pharetra semper lacus, et mattis diam euismod sit amet. Morbi vitae laoreet libero. Nulla vel posuere massa, ac consequat ligula. Duis accumsan accumsan dui a mattis. Morbi congue urna vel dapibus aliquam. Curabitur ut maximus magna. Aenean vel arcu nisl. Praesent eget massa non justo tincidunt tincidunt sed non mauris.
</p>
<p>
In faucibus, orci ac pulvinar vestibulum, dolor neque convallis nibh, non consectetur purus quam porta neque. Praesent tincidunt scelerisque purus nec iaculis. Cras eu nunc porttitor est dignissim sagittis. Proin eget lacinia nunc. Cras vitae sapien in nunc sagittis iaculis. Mauris posuere eros nec leo aliquet mollis. Nulla facilisi. Vivamus ut ultrices tellus, id volutpat mauris. Phasellus imperdiet urna nibh, ac venenatis tellus gravida a. Vestibulum sagittis ex at nibh bibendum aliquet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
</p>
<p>
Vestibulum id nisi tempus eros elementum tempor. Donec porta augue magna, ac consequat nisi scelerisque sed. Sed commodo, dui vel cursus sodales, orci nisl laoreet justo, nec luctus urna felis non neque. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur posuere nulla erat, sed auctor velit convallis eu. Proin eleifend augue vitae euismod egestas. Maecenas lobortis magna vel enim vulputate aliquet. Nullam pellentesque lobortis dignissim. Sed ac mi et quam posuere aliquam a a metus.
</p>
<p>
Cras blandit dictum velit, a malesuada sem fermentum in. Pellentesque eu libero erat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam aliquet mi a venenatis ultricies. Nunc malesuada quam nec sollicitudin dignissim. Vestibulum laoreet diam quis cursus sodales. Nullam condimentum dignissim fringilla. Donec facilisis semper ex, id bibendum tortor tincidunt facilisis. Nam tempus ornare arcu in fermentum. Vivamus odio quam, pretium ac nibh ac, porta scelerisque ipsum.
</p>"
)
page4.tags << [tag2, tag4]

page5 = Page.create(
  user_id: freida.id,
  category_id: cat3.id,
  title: "Sed ut perspiciatis",
  content: "<p>
Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem. ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur?
</p>
<p>
In faucibus, orci ac pulvinar vestibulum, dolor neque convallis nibh, non consectetur purus quam porta neque. Praesent tincidunt scelerisque purus nec iaculis. Cras eu nunc porttitor est dignissim sagittis. Proin eget lacinia nunc. Cras vitae sapien in nunc sagittis iaculis. Mauris posuere eros nec leo aliquet mollis. Nulla facilisi. Vivamus ut ultrices tellus, id volutpat mauris. Phasellus imperdiet urna nibh, ac venenatis tellus gravida a. Vestibulum sagittis ex at nibh bibendum aliquet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
</p>
<p>
Vestibulum id nisi tempus eros elementum tempor. Donec porta augue magna, ac consequat nisi scelerisque sed. Sed commodo, dui vel cursus sodales, orci nisl laoreet justo, nec luctus urna felis non neque. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur posuere nulla erat, sed auctor velit convallis eu. Proin eleifend augue vitae euismod egestas. Maecenas lobortis magna vel enim vulputate aliquet. Nullam pellentesque lobortis dignissim. Sed ac mi et quam posuere aliquam a a metus.
</p>
<p>
Cras blandit dictum velit, a malesuada sem fermentum in. Pellentesque eu libero erat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam aliquet mi a venenatis ultricies. Nunc malesuada quam nec sollicitudin dignissim. Vestibulum laoreet diam quis cursus sodales. Nullam condimentum dignissim fringilla. Donec facilisis semper ex, id bibendum tortor tincidunt facilisis. Nam tempus ornare arcu in fermentum. Vivamus odio quam, pretium ac nibh ac, porta scelerisque ipsum.
</p>"
)
page5.tags << [tag3, tag4]

page6 = Page.create(
  user_id: freida.id,
  category_id: cat4.id,
  title: "Vestibulum id nisi ",
  content: "<p>
Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem. ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur?
</p>
<p>
In faucibus, orci ac pulvinar vestibulum, dolor neque convallis nibh, non consectetur purus quam porta neque. Praesent tincidunt scelerisque purus nec iaculis. Cras eu nunc porttitor est dignissim sagittis. Proin eget lacinia nunc. Cras vitae sapien in nunc sagittis iaculis. Mauris posuere eros nec leo aliquet mollis. Nulla facilisi. Vivamus ut ultrices tellus, id volutpat mauris. Phasellus imperdiet urna nibh, ac venenatis tellus gravida a. Vestibulum sagittis ex at nibh bibendum aliquet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
</p>
<p>
Vestibulum id nisi tempus eros elementum tempor. Donec porta augue magna, ac consequat nisi scelerisque sed. Sed commodo, dui vel cursus sodales, orci nisl laoreet justo, nec luctus urna felis non neque. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur posuere nulla erat, sed auctor velit convallis eu. Proin eleifend augue vitae euismod egestas. Maecenas lobortis magna vel enim vulputate aliquet. Nullam pellentesque lobortis dignissim. Sed ac mi et quam posuere aliquam a a metus.
</p>
<p>
Cras blandit dictum velit, a malesuada sem fermentum in. Pellentesque eu libero erat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam aliquet mi a venenatis ultricies. Nunc malesuada quam nec sollicitudin dignissim. Vestibulum laoreet diam quis cursus sodales. Nullam condimentum dignissim fringilla. Donec facilisis semper ex, id bibendum tortor tincidunt facilisis. Nam tempus ornare arcu in fermentum. Vivamus odio quam, pretium ac nibh ac, porta scelerisque ipsum.
</p>"
)
page6.tags << [tag4]
