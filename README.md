# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Install Homebrew

* Check if it is already installed :
    $ brew

* If not then run the command in terminal :
    $ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## Install GPG

* Run the following commands:  
    $ brew install gpg  
    $ command curl -sSL https://rvm.io/mpapis.asc | gpg --import -

## Install RVM

* Run this command to install Ruby Version Manager :  
    $ \curl -L https://get.rvm.io | bash -s stable

* If u already have RVM installed then update to latest version :  
    $ rvm get stable --autolibs=enable

* Close and re-open the terminal for RVM to get installed completely.

## Install Ruby

* Run the following command to install ruby :  
    $ rvm install ruby-2.3.1

* Verify that the newest version of Ruby is installed :  
    $ ruby -v

## Check the Gem Manager

* Run  
    $ gem -v (Should be 2.5.1 or higher)

* update  
    $ gem update --system

* Display a list of gemsets   
    $ rvm gemset list

* RVM’s Global Gemset  
    $ rvm gemset use global  
    $ gem list

## Install Bundler

* Run  
    $ gem install bundler

* Install dependency for the gem  
    $ gem install nokogiri

## Install Rails

* Run  
    $ gem install rails

* Verify that the correct version of Rails is installed:  
    $ rails -v

## Almost There  :D

## Create a Workspace Folder

* Run  
    $ mkdir Workspace   
    $ cd Workspace

* Clone the project from the repository to this Workspace

## Examine the code or run the application:

* Run  
    $ rails server

* Use your web browser to visit the application at http://localhost:3000
