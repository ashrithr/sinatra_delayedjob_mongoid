# Simple task runs using delayed_job
class SimpleTask
  def doit
    info "just did something simple!"
  end
  handle_asynchronously :doit

  def doit_in_5secs
    info "returning back after 5 seconds"
  end
  handle_asynchronously :doit_in_5secs, :run_at => Proc.new { 5.seconds.from_now }

  def info(text)
    Delayed::Worker.logger.info("#{Time.now.strftime('%FT%T%z')}: [#{self.class.name} (pid: #{Process.pid})] #{text}")
  end
end
