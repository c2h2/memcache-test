require 'memcached'
require 'digest/sha2'
require 'digest/md5'


a=Memcached.new 'localhost'
j={}
def hash val
  #Digest::SHA2::hexdigest val
  #Digest::SHA2::digest val
  Digest::MD5::digest val
end


t0= Time.now
10000000.times do |i|
  #a.set(hash(i.to_s), i)
  #a.set(i.to_s, i)
  key = hash(i.to_s)
  if j[key].nil?
    j[key] = hash(i.to_s)
  else
    puts "alert"
  end
end
tt = Time.now - t0

puts tt
sleep 10
