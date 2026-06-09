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

uri = URI("https://www.youtube.com/feeds/videos.xml?channel_id=#{CHANNEL_ID}")
xml = Net::HTTP.get(uri)
entry = xml.match(/<entry>[\s\S]*?<\/entry>/)
abort "No entries in YouTube RSS feed" unless entry

body = entry[0]
id = body[/\<yt:videoId\>([^<]+)\<\/yt:videoId\>/, 1]
title = body[/\<title\>([^<]+)\<\/title\>/, 1]
published = body[/\<published\>([^<]+)\<\/published\>/, 1]
abort "Could not parse YouTube RSS entry" unless id && title

data = {
  "id" => id.strip,
  "title" => decode_xml_entities(title.strip),
  "published_at" => published&.strip,
  "url" => "https://www.youtube.com/watch?v=#{id.strip}"
}

FileUtils.mkdir_p(File.dirname(OUT))
File.write(OUT, data.to_yaml)
puts "Wrote #{OUT}: #{data['title']}"
