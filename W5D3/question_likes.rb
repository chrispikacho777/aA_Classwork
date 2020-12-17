require_relative 'questions_database'
class QuestionLikes 
    attr_accessor :users_id, :questions_id

    def initialize(options)
        @id = options["id"]
        @users_id = options["users_id"]
        @questions_id = options["questions_id"]
    end

    def self.find_by_id(id)
        data = QuestionDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM    
                question_likes
            WHERE
                id = ?;
        SQL
        return nil if data.length < 1
        QuestionLikes.new(data.first)
    end

end