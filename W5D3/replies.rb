require_relative 'questions'


class Replies  
    attr_accessor :users_id, :questions_id, :reply_id, :body

    def initialize(options)
        @id = options["id"]
        @reply_id = options["reply_id"]
        @users_id = options["users_id"]
        @questions_id = options["questions_id"]
        @body = options["body"]
    end

    def self.find_by_id(id)
        data = QuestionDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM    
                replies
            WHERE
                id = ?;
        SQL
        return nil if data.length < 1
        Replies.new(data.first)
    end

    def self.find_by_user_id(id)
        data = QuestionDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM    
                replies
            WHERE
                users_id = ?;
        SQL
        return nil if data.length < 1
        Replies.new(data.first)
    end

    def self.find_by_questions_id(id)
        data = QuestionDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM    
                replies
            WHERE
                questions_id = ?;
        SQL
        return nil if data.length < 1
        Replies.new(data.first)
    end
   
    def author 
        data = QuestionDBConnection.instance.execute(<<-SQL, @users_id)
            SELECT
                f_name, l_name
            FROM    
                users
            JOIN replies
                ON replies.users_id = users.id
            WHERE
                users_id = ?
        SQL
        return nil if data.length < 1
        data.first.values.join(" ")
    end

    def question
        data = QuestionDBConnection.instance.execute(<<-SQL, @questions_id)
            SELECT
                questions.body
            FROM    
                questions
            JOIN replies
                ON replies.questions_id = questions.id
            WHERE
                questions_id = ?
        SQL
        return nil if data.length < 1
        data.first.values.join("")
    end

    def parent_reply
            data = QuestionDBConnection.instance.execute(<<-SQL, @reply_id)
            SELECT
                body
            FROM    
                replies
            WHERE
                id = ?
        SQL
        return nil if data.length < 1
        data.first.values.join("")
    end

    def child_reply
        data = QuestionDBConnection.instance.execute(<<-SQL, @id)
            SELECT
                body
            FROM    
                replies
            WHERE
                reply_id = ?
        SQL
        return nil if data.length < 1
        data.first.values.join("")
    end
    
    
end