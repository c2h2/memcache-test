require 'memcached'
require 'digest/sha2'
require 'digest/md5'


a=Memcached.new 'localhost'

def hash val
  Digest::SHA2::hexdigest val
end


t0= Time.now
1000000.times do |i|
  a.get(hash(i.to_s))
  #a.set(i.to_s, i)
end
tt = Time.now - t0

puts tt
