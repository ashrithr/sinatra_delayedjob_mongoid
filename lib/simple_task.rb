# Simple task runs using delayed_job
class SimpleTask
  def doit
    puts "just did something simple!"
    $stdout.flush
  end
  handle_asynchronously :doit

  def doit_in_5secs
    puts "returning back after 5 seconds"
    $stdout.flush
  end
  handle_asynchronously :doit_in_5secs, :run_at => Proc.new { 5.seconds.from_now }
end
