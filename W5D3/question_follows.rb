require_relative 'questions_database'
require_relative 'users'
require_relative 'questions'
class QuestionFollows  
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
                question_follows
            WHERE
                id = ?;
        SQL
        return nil if data.length < 1
        QuestionFollows.new(data.first)
    end

    def self.followers_for_question_id(question_id)
        data = QuestionDBConnection.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                users
            JOIN question_follows
                ON users.id = question_follows.users_id
            WHERE
                question_follows.questions_id = ?;
        SQL
        return nil if data.length < 1
        Users.new(data.first)      
    end

    def self.followers_for_user_id(users_id)
        data = QuestionDBConnection.instance.execute(<<-SQL, users_id)
            SELECT
                *
            FROM
                questions
            JOIN question_follows
                ON questions.id = question_follows.questions_id
            WHERE
                question_follows.users_id = ?;
        SQL
        return nil if data.length < 1
        Questions.new(data.first)      
    end
end