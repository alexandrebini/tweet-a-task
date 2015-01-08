class MentionWatcher
  include Singleton
  attr_reader :client, :running

  def initialize
    @client = TweetStream::Client.new
    @running = false
  end

  def start
    return if phrases.size == 0
    @running = true
    Thread.new do
      @client.track(phrases) do |status, i|
        Task.create_from_tweet(status)
        sleep 5
      end
    end
  end

  def stop
    if @running
      @client.stop rescue nil
      @running = false
    end
  end

  def restart
    stop
    start
  end

  def phrases
    Phrase.pluck :text
  end
end