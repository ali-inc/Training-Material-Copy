class Post

  attr_accessor :id, :title, :body

  def save

      conn = self.open_connection

      if(!self.id)
        # Insert a new record in to the database
        sql = "INSERT INTO post (title , body) VALUES ( '#{self.title}', '#{self.body}')"
      else
        # Update an existing one
        sql = "UPDATE post SET title='#{self.title}', body='#{self.body}' WHERE id = #{self.id}"
      end

      conn.exec(sql)

  end

  def self.open_connection

      conn = PG.connect( dbname: "blog" )

  end

  def self.all

        conn = self.open_connection

        sql = "SELECT id,title,body FROM post ORDER BY id"

        results = conn.exec(sql)

        # create an array of post objects
        posts = results.map do |tuple|
            self.hydrate tuple
        end

        posts

  end

  def self.find id

        conn = self.open_connection

        sql = "SELECT * FROM post WHERE id = #{id} LIMIT 1"

        # PG always returns an array
        posts = conn.exec(sql)

        # puts posts.class

        # bind just the first and return
        post = self.hydrate posts[0]

        post

  end

  def self.destroy id

      conn = self.open_connection

      sql = "DELETE FROM post where id = #{id}"

      # handle delete here
      conn.exec(sql)

  end

  def self.hydrate post_data

    post = Post.new

    post.id = post_data['id']
    post.title = post_data['title']
    post.body = post_data['body']

    post

  end

end
