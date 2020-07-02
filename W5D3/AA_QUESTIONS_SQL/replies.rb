require_relative 'user'
require_relative 'database'
require_relative 'question_follow'
require_relative 'question'
require_relative 'question_like'


class Reply
    attr_accessor :body, :question_id, :user_id
    
    def self.find_by_id(id)
        data = QuestionDataBase.instance.get_first_row(<<-SQL, id: id)
            SELECT replies.*
            FROM replies
            WHERE replies.id = :id
        SQL
        Reply.new(data)
    end

    def self.find_by_user_id(id)
        data = QuestionDataBase.instance.execute(<<-SQL, id: id)
            SELECT replies.*
            FROM replies
            WHERE replies.user_id = :id
        SQL
       data.map {|ele| Reply.new(ele)}
    end

    def self.find_by_question_id(id)
        data = QuestionDataBase.instance.execute(<<-SQL, id: id)
            SELECT replies.*
            FROM replies
            WHERE replies.question_id = :id
        SQL
        data.map {|ele| Reply.new(ele)}
    end
    

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_reply_id = options['parent_reply_id']
        @user_id = options['user_id']
        @body = options['body']
    end
    
    def parent_reply
        data = QuestionDataBase.instance.get_first_row(<<-SQL, id: @id)
            SELECT replies.*
            FROM replies
            WHERE replies.id = (
                SELECT replies.parent_reply_id
                FROM replies
                WHERE replies.id = :id)
        SQL
        Reply.new(data)
    end

    def child_replies
        id = @id
        data = QuestionDataBase.instance.execute(<<-SQL, id: id)
            SELECT replies.*
            FROM replies
            WHERE replies.parent_reply_id = :id
        SQL
        data.map {|ele| Reply.new(ele)}
    end

end

