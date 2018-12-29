defmodule HitMe.MilestonesTest do
  use HitMe.DataCase

  alias HitMe.Milestones

  describe "milestones" do
    alias HitMe.Milestones.Milestone

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def milestone_fixture(attrs \\ %{}) do
      {:ok, milestone} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Milestones.create_milestone()

      milestone
    end

    test "list_milestones/0 returns all milestones" do
      milestone = milestone_fixture()
      assert Milestones.list_milestones() == [milestone]
    end

    test "get_milestone!/1 returns the milestone with given id" do
      milestone = milestone_fixture()
      assert Milestones.get_milestone!(milestone.id) == milestone
    end

    test "create_milestone/1 with valid data creates a milestone" do
      assert {:ok, %Milestone{} = milestone} = Milestones.create_milestone(@valid_attrs)
    end

    test "create_milestone/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Milestones.create_milestone(@invalid_attrs)
    end

    test "update_milestone/2 with valid data updates the milestone" do
      milestone = milestone_fixture()
      assert {:ok, %Milestone{} = milestone} = Milestones.update_milestone(milestone, @update_attrs)
    end

    test "update_milestone/2 with invalid data returns error changeset" do
      milestone = milestone_fixture()
      assert {:error, %Ecto.Changeset{}} = Milestones.update_milestone(milestone, @invalid_attrs)
      assert milestone == Milestones.get_milestone!(milestone.id)
    end

    test "delete_milestone/1 deletes the milestone" do
      milestone = milestone_fixture()
      assert {:ok, %Milestone{}} = Milestones.delete_milestone(milestone)
      assert_raise Ecto.NoResultsError, fn -> Milestones.get_milestone!(milestone.id) end
    end

    test "change_milestone/1 returns a milestone changeset" do
      milestone = milestone_fixture()
      assert %Ecto.Changeset{} = Milestones.change_milestone(milestone)
    end
  end
end
