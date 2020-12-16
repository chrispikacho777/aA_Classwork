require_relative 'question_database'
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

end