class Questions  
    attr_accessor :title, :body, :author_id

    def initialize(options)
        @id = options["id"]
        @title = options["title"]
        @body = options["body"]
        @author_id = options["author_id"]
    end

    def self.find_by_id(id)
        data = QuestionDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM    
                questions
            WHERE
                id = ?;
        SQL
        return nil if data.length < 1
        Questions.new(data)
    end

end