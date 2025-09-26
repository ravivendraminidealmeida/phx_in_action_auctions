defmodule AuctionWeb.PageController do
  use AuctionWeb, :controller

  def index(conn, _params) do
    redirect(conn, to: ~p"/items");
  end
end
