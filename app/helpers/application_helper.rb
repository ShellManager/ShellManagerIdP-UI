module ApplicationHelper
  def gravatar(email, size)
    gravatar_id = Digest::MD5.hexdigest(email)
    "https://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
end
