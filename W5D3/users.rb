require_relative 'replies'

class Users  
    attr_accessor :f_name, :l_name

    def initialize(options)
        @id = options["id"]
        @f_name = options["f_name"]
        @l_name = options["l_name"]
    end

    def self.find_by_id(id)
        data = QuestionDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM    
                users
            WHERE
                id = ?;
        SQL
        return nil if data.length < 1
        Users.new(data.first)
    end

    def self.find_by_name(first, last)
        data = QuestionDBConnection.instance.execute(<<-SQL, first, last)
            SELECT
                *
            FROM    
                users
            WHERE
                f_name = ? and
                l_name = ?;
        SQL
        return nil if data.length < 1
        Users.new(data.first)
    end

    def authored_questions
        Questions.find_by_author_id(@id)
    end

    def authored_replies
        Replies.find_by_user_id(@id)
    end

end