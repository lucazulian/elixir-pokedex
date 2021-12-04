defmodule ElixirPokedex.Funtranslations.ClientTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  import ExUnit.CaptureLog

  alias ElixirPokedex.Funtranslations.Client

  setup do
    ExVCR.Config.cassette_library_dir("fixture/vcr_cassettes")
    :ok
  end

  test "on 200 response code client shoud return success response" do
    use_cassette "funtranslations/success" do
      response = Client.translate("hello world!", :yoda)

      assert match?(
               {:ok,
                %Tesla.Env{
                  body: %{
                    "contents" => %{
                      "text" => "hello world!",
                      "translated" => "Force be with you world!",
                      "translation" => "yoda"
                    },
                    "success" => %{"total" => 1}
                  },
                  headers: _headers,
                  method: :get,
                  opts: [],
                  query: [],
                  status: 200,
                  url: "http://api.funtranslations.com/translate/yoda?text=hello+world%21"
                }},
               response
             )
    end
  end

  test "on 429 response code client shoud return error response with error" do
    use_cassette "funtranslations/too_many_requests", match_requests_on: [:query] do
      logs =
        capture_log(fn ->
          response = Client.translate("hello world!", :yoda)

          assert match?(
                   {:ok,
                    %Tesla.Env{
                      body: %{
                        "error" => %{
                          "code" => 429,
                          "message" =>
                            "Too Many Requests: Rate limit of 5 requests per hour exceeded. Please wait for 53 minutes and 38 seconds."
                        }
                      },
                      headers: _headers,
                      method: :get,
                      opts: [],
                      query: [],
                      status: 429,
                      url: "http://api.funtranslations.com/translate/yoda?text=hello+world%21"
                    }},
                   response
                 )
        end)

      assert logs =~
               "[error] GET http://api.funtranslations.com/translate/yoda?text=hello+world%21 -> 429"
    end
  end
end
