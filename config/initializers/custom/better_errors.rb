if Rails.env.development?

  # preset values are [:mvim, :macvim, :textmate, :txmt, :tm, :sublime, :subl, :st]
  BetterErrors.editor = :vscode

  BetterErrors::Middleware.allow_ip! '127.0.0.1' # localhost
  BetterErrors::Middleware.allow_ip! '0.0.0.0'   # localhost
  BetterErrors::Middleware.allow_ip! '10.0.2.2'  # vagrant
end
