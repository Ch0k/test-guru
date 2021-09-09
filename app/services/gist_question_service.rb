class GistQuestionService

  GITHUB_TOKEN_GIST = ENV['GITHUB_TOKEN']

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(:access_token => GITHUB_TOKEN_GIST )

  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    (200..299).include? @client.last_response.status
  end
  
  private

  def gist_params
    {
      "description": "#{@test.title} from TestGuru", 
      "public": true, 
      "files": { 
        "TestGuruQuestion.txt": {
          "content": gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:answer)
    content.join("\n")
  end

end
