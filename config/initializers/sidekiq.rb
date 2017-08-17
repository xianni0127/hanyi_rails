Sidekiq.configure_server do |config|
    config.redis = { url:'redis://localhost:6379', size: 100, reconnect_attempts: 1 }

  end

  Sidekiq.configure_client do |config|
    config.on(:startup) { }
    config.on(:quiet) { }
    config.redis = { url:'redis://localhost:6379', reconnect_attempts: 1 }
    config.on(:shutdown) do
      #result = RubyProf.stop

      ## Write the results to a file
      ## Requires railsexpress patched MRI build
      # brew install qcachegrind
      #File.open("callgrind.profile", "w") do |f|
        #RubyProf::CallTreePrinter.new(result).print(f, :min_percent => 1)
      #end
    end
  end


  redis_server = 'localhost' # redis服务器
  redis_port = 6379 # redis端口
  redis_db_num = 0 # redis 数据库序号
  # redis_namespace = 'xn_sidekiq' #命名空间，自定义的
