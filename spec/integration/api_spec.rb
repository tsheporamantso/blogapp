require 'swagger_helper'

describe 'Post API' do
  path 'api/users/{id}/posts' do
    get 'Retrieve all posts for a user' do
      tags 'Posts'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'ok' do
        schema type: :object,
               properties: {
                 posts: {
                   type: :array,
                   items: {
                     type: :object,
                     properties: {
                       id: { type: :integer }, author_id: { type: :integer },
                       title: { type: :string }, text: { type: :string },
                       comment_counter: { type: :integer }, likes_counter: { type: :integer },
                       created_at: { type: :string, format: 'date-time' },
                       updated_at: { type: :string, format: 'date-time' }
                     }
                   }
                 }
               }
        let(:id) { 1 }
        run_test!
      end

      response '404', 'User not found' do
        let(:id) { 0 }
        run_test!
      end
    end
  end
  path '/api/posts/{id}/comments' do
    get 'Retrieves all comments for a given post' do
      tags 'Comments'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 comments: {
                   type: :array,
                   items: {
                     type: :object,
                     properties: {
                       id: { type: :integer },
                       author_id: { type: :integer },
                       post_id: { type: :integer },
                       text: { type: :string },
                       created_at: { type: :string, format: 'date-time' },
                       updated_at: { type: :string, format: 'date-time' }
                     }
                   }
                 }
               }

        let(:id) { 1 } # Use a valid post ID here for testing
        run_test!
      end

      response '404', 'Post Not Found' do
        let(:id) { 0 } # Use an invalid post ID here for testing
        run_test!
      end
    end
  end

  path '/api/posts/{id}/add_comment' do
    parameter name: :id, in: :path, type: :integer, description: "post's id"

    post 'Sends a comment ta a given post' do
      tags 'Comments'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :message, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        },
        required: ['text']
      }

      response '201', 'blog created' do
        let(:id) { 1 }
        let(:message) { { text: 'This is the comment.' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:id) { 0 }
        let(:message) { { text: '' } }
        run_test!
      end
    end
  end
end
