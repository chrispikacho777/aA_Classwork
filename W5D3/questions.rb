require_relative 'questions_database'
require 'byebug'

class Questions  
    attr_accessor :title, :body, :author_id

    def initialize(options)
        @id = options['id']
        @title = options["title"]
        @body = options["body"]
        @author_id = options["author_id"]
    end

    def self.all
        data = QuestionDBConnection.instance.execute('SELECT * From questions')
        data.map {|datum| Questions.new(datum)}
    end

    def self.find_by_id(id)
        data = QuestionDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM    
                questions
            WHERE
                id = ?
        SQL
        return nil if data.length < 1
        p data
        Questions.new(data.first)
    end

    def self.find_by_author_id(author_id)
        data = QuestionDBConnection.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM    
                questions
            WHERE
                author_id = ?
        SQL
        return nil if data.length < 1
        p data
        Questions.new(data.first)
    end

    def author 
        data = QuestionDBConnection.instance.execute(<<-SQL, @author_id)
            SELECT
                f_name, l_name
            FROM    
                users
            JOIN questions
                ON questions.author_id = users.id
            WHERE
                author_id = ?
        SQL
        return nil if data.length < 1
        data.first.values.join(" ")
    end
end