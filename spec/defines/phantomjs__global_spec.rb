require "spec_helper"

describe "phantomjs::global" do
  let(:facts) { default_test_facts }
  let(:title) { "1.2.3" }
  let(:params) do
    {
      :version => "1.9.0"
    }
  end

  it do
    should include_class("phantomjs::1_9_0")

    should contain_file("/test/boxen/phantomenv/version").with({
      :content => "1.9.0\n",
    })
  end
end
