require 'json'
require 'net/https'
http = Net::HTTP.new('api-v3.igdb.com',443)
http.use_ssl = true

# GENRES REQUEST

request = Net::HTTP::Post.new(URI('https://api-v3.igdb.com/genres'), {'user-key' => 'cac670736016aa74847db0ce9d59d19f'})

request.body = 'fields id,name; limit 50; sort id;'
response = JSON.parse(http.request(request).body)
genres = {}
response.each do |genre|
  genres[genre["id"]] = genre["name"]
end

# COVER PHOTO REQUEST

def get_photo_url(id)
  http = Net::HTTP.new('api-v3.igdb.com',443)
  http.use_ssl = true

  request = Net::HTTP::Post.new(URI('https://api-v3.igdb.com/covers'), {'user-key' => 'cac670736016aa74847db0ce9d59d19f'})

  request.body = "fields id,url; where id = #{id};"
  response = JSON.parse(http.request(request).body)
  if response.first['url'].nil?
    return nil
  else
    return "http:#{response.first['url']}"
  end
end


# GAMES REQUEST

request = Net::HTTP::Post.new(URI('https://api-v3.igdb.com/games'), {'user-key' => 'cac670736016aa74847db0ce9d59d19f'})

PLATFORMS = {
  6 => 'PC',
  48 => 'PS4',
  130 => 'Switch',
  49 => 'Xbox One'
}
Swap.destroy_all
Listing.destroy_all
puts "clearing games..."
Game.destroy_all
puts "games cleared!"

3.times do |i|
  p "Total number of games: #{Game.count}"
  request.body = "fields name,platforms,aggregated_rating,genres,first_release_date,cover; offset #{50 * i}; limit 50; where aggregated_rating > 80 & platforms = (48,49,130,6); sort date desc;"
  response = JSON.parse(http.request(request).body)
  response.each do |game|
    description = game["genres"] ? game["genres"].map { |genre_id| genres[genre_id] }.join(", ") : "No description"
    game['platforms'].select { |id| PLATFORMS.key?(id) }.each do |platform_id|
      new_game = Game.new(
        console: PLATFORMS[platform_id],
        description: description,
        title: game["name"],
        rating: game["aggregated_rating"],
        release_date: Date.strptime(game["first_release_date"].to_s,'%s'),
        cover_image: get_photo_url(game['cover'])
      )
      if new_game.save
        p "Created: #{new_game.title} for #{new_game.console} released on #{new_game.release_date.strftime("%b %d, %Y")}"
        p new_game.rating
      else
        p new_game.errors.full_messages
        p "Failed: #{new_game.title} for #{new_game.console}"
      end
    end
  end
end
