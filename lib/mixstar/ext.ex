defmodule MixStar.Ext do
  # use Netrc module
  Code.eval_string(File.read!(Path.join([__DIR__, "../../netrcex/lib/netrc.ex"])), [], __ENV__)
end
