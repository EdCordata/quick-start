$redis           = ::Redis.new(url: ::Settings['redis']['url'], thread_safe: false)
$redis_namespace = ::Redis::Namespace.new(::Settings['redis']['namespace'], redis: $redis)
