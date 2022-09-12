module ApplicationHelper
    def gravatar_for(user, options = {size: 80})
        email_address = "gggg@vgf.com".downcase
        hash = Digest::MD5.hexdigest(email_address)
        size = options[:size]
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}"
        image_tag(gravatar_url, alt: "username")
    end

    

    
end
