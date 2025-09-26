defmodule AuctionWeb.ItemController do
  use AuctionWeb, :controller

  def index(conn, _params) do
    items = Auction.list_items
    render(conn, :index, items: items)
  end

  def show(conn, %{"id" => id}) do
    item = Auction.get_item(id)
    render(conn, :show, item: item)
  end

  def new(conn, _params) do
    item = Auction.new_item()
    render(conn, :new, item: item)
  end

  def create(conn, _params) do
    :pass
  end


end
