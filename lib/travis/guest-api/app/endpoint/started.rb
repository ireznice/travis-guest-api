require 'travis/guest-api/app/endpoint'

class Travis::GuestApi::App::Endpoint
  class Started < Travis::GuestApi::App::Endpoint

    before do
      @msg_handler = env['msg_handler']
      @reporter = env['reporter']
    end

    post '/started' do
      @msg_handler.call(job_id: @job_id, event: 'started', reporter: @reporter)
      { success: true }.to_json
    end

  end
end
