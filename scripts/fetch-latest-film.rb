#!/usr/bin/env ruby
# Fetches latest YouTube upload via public RSS feed (no API key).
require "net/http"
require "uri"
require "yaml"
require "fileutils"

CHANNEL_ID = ENV.fetch("YOUTUBE_CHANNEL_ID", "UCKoxl9AEeGte0uLwQxunldQ")
ROOT = File.expand_path("..", __dir__)
OUT = File.join(ROOT, "_data", "latest_film.yml")

def decode_xml_entities(s)
  s.gsub("&amp;", "&")
   .gsub("&lt;", "<")
   .gsub("&gt;", ">")
   .gsub("&quot;", '"')
   .gsub("&apos;", "'")
   .gsub("&#39;", "'")
end

# Keep the last known film so a dead RSS feed cannot fail the site build.
def keep_existing!(reason)
  abort "#{reason} (and no cached #{OUT})" unless File.exist?(OUT)
  warn "#{reason}; keeping #{OUT}"
  exit 0
end

def fetch(url)
  response = Net::HTTP.get_response(URI(url))
  response.is_a?(Net::HTTPSuccess) ? response.body.to_s : nil
rescue StandardError
  nil
end

xml = fetch("https://www.youtube.com/feeds/videos.xml?channel_id=#{CHANNEL_ID}")
keep_existing!("YouTube RSS unavailable") unless xml

entry = xml.match(/<entry>[\s\S]*?<\/entry>/)
keep_existing!("No entries in YouTube RSS feed") unless entry

body = entry[0]
id = body[/\<yt:videoId\>([^<]+)\<\/yt:videoId\>/, 1]
title = body[/\<title\>([^<]+)\<\/title\>/, 1]
published = body[/\<published\>([^<]+)\<\/published\>/, 1]
keep_existing!("Could not parse YouTube RSS entry") unless id && title
id = id.strip

# The main feed can't flag Shorts, but the UUSH playlist lists only Shorts — so membership means vertical.
shorts = fetch("https://www.youtube.com/feeds/videos.xml?playlist_id=#{CHANNEL_ID.sub(/\AUC/, 'UUSH')}")
vertical = shorts.to_s.include?("<yt:videoId>#{id}</yt:videoId>")

data = {
  "id" => id,
  "title" => decode_xml_entities(title.strip),
  "published_at" => published&.strip,
  "vertical" => vertical,
  "url" => "https://www.youtube.com/#{vertical ? "shorts/#{id}" : "watch?v=#{id}"}"
}

FileUtils.mkdir_p(File.dirname(OUT))
File.write(OUT, data.to_yaml)
puts "Wrote #{OUT}: #{data['title']}"
