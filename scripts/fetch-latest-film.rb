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

uri = URI("https://www.youtube.com/feeds/videos.xml?channel_id=#{CHANNEL_ID}")
response = begin
  Net::HTTP.get_response(uri)
rescue StandardError => e
  keep_existing!("YouTube RSS request failed: #{e.message}")
end

keep_existing!("YouTube RSS returned HTTP #{response.code}") unless response.is_a?(Net::HTTPSuccess)

xml = response.body.to_s
entry = xml.match(/<entry>[\s\S]*?<\/entry>/)
keep_existing!("No entries in YouTube RSS feed") unless entry

body = entry[0]
id = body[/\<yt:videoId\>([^<]+)\<\/yt:videoId\>/, 1]
title = body[/\<title\>([^<]+)\<\/title\>/, 1]
published = body[/\<published\>([^<]+)\<\/published\>/, 1]
keep_existing!("Could not parse YouTube RSS entry") unless id && title

data = {
  "id" => id.strip,
  "title" => decode_xml_entities(title.strip),
  "published_at" => published&.strip,
  "url" => "https://www.youtube.com/watch?v=#{id.strip}"
}

FileUtils.mkdir_p(File.dirname(OUT))
File.write(OUT, data.to_yaml)
puts "Wrote #{OUT}: #{data['title']}"
