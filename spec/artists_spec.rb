require 'rspec'
require 'artists'
require('spec_helper')
require'pry'

describe '#Artist' do

  describe('.all') do
    it("returns an empty array when there are no artists") do
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves an artist") do
      artist = Artist.new({:name => "Queen", :id => nil}) # nil added as second argument
      artist.save()
      artist2 = Artist.new({:name => "Deadmou5", :id => nil}) # nil added as second argument
      artist2.save()
      expect(Artist.all).to(eq([artist, artist2]))
    end
  end

  describe('#==') do
    it("is the same artist if it has the same attributes as another artist") do
      artist = Artist.new({:name => "Deadmou5", :id => nil})
      artist2 = Artist.new({:name => "Deadmou5", :id => nil})
      expect(artist).to(eq(artist2))
    end
  end

  describe('.clear') do
    it("clears all artists") do
      artist = Artist.new({:name => "Queen", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Deadmou5", :id => nil})
      artist2.save()
      Artist.clear()
      expect(Artist.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an artist by id") do
      artist = Artist.new({:name => "Queen", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Deadmou5", :id => nil})
      artist2.save()
      expect(Artist.find(artist.id)).to(eq(artist))
    end
  end

  describe('#update') do
    it("updates an artist by id") do
      artist = Artist.new({:name => "Queen", :id => nil})
      artist.save()
      artist.update("Madonna")
      expect(artist.name).to(eq("Madonna"))
    end
  end

  describe('#delete') do
    it("deletes an artist by id") do
      artist = Artist.new({:name => "Queen", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Deadmou5", :id => nil})
      artist2.save()
      artist.delete()
      expect(Artist.all).to(eq([artist2]))
    end
  end
end
