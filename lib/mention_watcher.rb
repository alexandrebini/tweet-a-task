class MentionWatcher
  include Singleton

  def initialize
    @client = TweetStream::Client.new
    @running = false
  end

  def start
    return if phrases.size == 0
    @running = true
    Thread.new do
      @client.track(phrases) do |status|
        Task.from_twitter(status)
      end
    end
  end

  def stop
    @client.stop if @running
  end

  def restart
    stop
    start
  end

  def phrases
    Phrase.pluck :text
  end
end