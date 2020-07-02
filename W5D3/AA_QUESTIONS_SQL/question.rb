require_relative 'user'
require_relative 'database'
require_relative 'replies'
require_relative 'question_follow'
require_relative 'question_like'


class Question
    attr_accessor :title, :body, :author_id

    def self.most_like(n)
        QuestionLike.most_liked_questions(n)
    end

    def self.find_by_id(id)
        data = QuestionDataBase.instance.get_first_row(<<-SQL, id: id)
        SELECT questions.*
        FROM questions
        WHERE questions.id = :id
        SQL
        Question.new(data)
    end

    def self.most_followed(n)
        QuestionFollow.most_followed_question(n)
    end
    
    def self.find_by_author_id(id)
        data = QuestionDataBase.instance.get_first_row(<<-SQL, id: id)
        SELECT questions.*
        FROM questions
        WHERE questions.author_id = :id
        SQL
        Question.new(data)
    end

    
    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end


    def author
        data = QuestionDataBase.instance.execute(<<-SQL, author_id)
            SELECT fname, lname
            FROM users
            WHERE id = ?
        SQL
        data.first.values.join(' ')
    end


    def replies
        Reply.find_by_question_id(@id)
    end

    def followers
        QuestionFollow.followers_for_question_id(@id)
    end

    def likers
        QuestionLike.likers_for_question_id(@id)
    end
    
    def num_likes
        QuestionLike.num_likes_for_question_id(@id)
    end

end









