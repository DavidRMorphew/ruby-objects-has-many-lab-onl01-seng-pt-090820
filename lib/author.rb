class Author
    attr_accessor :name
    #@@all_authors = []
    def initialize(name)
        @name = name
        # binding.pry
     #   @@all_authors << self unless @@all_authors.any? {|author| author.name = name} 
    end

    def posts
        Post.all.select {|post| post.author = self}
    end

    def add_post(post)
        post.author = self
    end

    def add_post_by_title(title)
        new_post = Post.new(title)
        add_post(new_post)
    end

    # def self.post_count
    #     @@all_authors.collect {|author| author.posts}.flatten.count
    # end

    def self.post_count
        Post.all.collect do |post|
            post if post.author_name
        end.count
    end

end