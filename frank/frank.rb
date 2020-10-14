require 'sinatra'
require 'json'
require 'set'

$data_file = File.read('./lyrics.json')
$lyrics = JSON.parse($data_file)
$stdout.sync = true

# cerner_2^5_2020
get '/search' do
    words = params['words']
    title = params['title']
    # if empty, return nothing
    if words.to_s.empty? and title.to_s.empty?
        return [200, "Nothing to search!"]
    end
    
    results = {}
    # find via title or words
    $lyrics.each do | song | 
        if !title.to_s.empty? and song["title"].include? title
            results[song["title"]]=song["words"]
        else
            song_words = song["words"]
            song_words.each do |lyric|
                if !words.to_s.empty? and lyric.include? words
                    results[song["title"]]=song["words"]
                end
            end
        end
    end

    return [200, results.to_json]
end