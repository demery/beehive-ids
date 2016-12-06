require 'digest/sha1'

class BeehiveIDs

  DEFAULT_OFFSET  = 0
  DEFAULT_SIZE    = 8

  def id  options={}
    options[:size]    ||= DEFAULT_SIZE
    options[:offset]  ||= DEFAULT_OFFSET
    options[:message] ||= srand.to_s

    digest = Digest::SHA1.hexdigest(options[:message])

    return digest if options[:size].to_s.upcase == 'ALL'

    start = options[:offset]
    stop  = options[:offset] + options[:size]
    digest[start..stop]
  end

  def tag options={}
    "#item-#{id options}"
  end
end