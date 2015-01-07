class MentionWatcher
  include Singleton

  def initialize
    @client = TweetStream::Client.new
    @running = false
  end

  def start
    @running = true
    Thread.new do
      @client.track(phrases) do |status|
        puts "#{ status.text }"
      end
    end
  end

  def stop
    @client.stop if @running
  end

  def restart
    stop!
    start!
  end

  def phrases
    ['Brazil']
  end
end