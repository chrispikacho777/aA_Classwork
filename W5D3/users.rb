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
        Users.new(data)
    end

end