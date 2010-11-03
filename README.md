Cucumber-In-The-YARD (CITY): A Requirements Documentation Tool
====================================

Synopsis
--------

Cucumber-In-The-Yard is a YARD extension that processes Cucumber Features, Scenarios, Steps,
Step Definitions, Transforms, and Tags and provides a documentation interface that allows you
easily view and investigate the test suite.  This tools hopes to bridge the gap of being able
to provide your feature descriptions to your Product Owners and Stakeholders.

Example
-------

An example, particularly the example features included with the project, of CITY can be viewed at

   [http://recursivegames.com/cukes/](http://recursivegames.com/cukes/)    

**1. Users are able to search by Feature, Tags, and Scenario.**

Appended to the traditional search areas is the ability to now search by Feature, Tag, and Scenario.
The user is able to search by steps, though I have not placed those links on the page, in step_list.html
found in the root of the output directory.

**2. Feature pages are displayed in a decently formatted HTML representation**

As opposed to pointing team members, stakeholders, and product owners to feature files which require 
an editor with syntax highlighting.  As well as providing the ability to quickly follow tags and steps 
for more information.

**3. Tag pages display all the Features and scenarios that currently employ the tag.**

Providing quick access to the important tag divisions that have been created in a project.  
On the top of the page there are some quick calculations of the number of features and scenarios that
share the specified tag. 

**4. Steps link to Step definitions.  Step definitions show all uses.**

Step definitions are displayed in their own index page and for each step definition a list of implemented
steps for this step definition.  This is useful for providing example documentation and quickly understanding
which scenarios are affected by a change to a step definition.

**5. Step Transforms are displayed as links in the step definitions**

After finding the Step to Step Definition link it looks at the match groups within the step and find which
ones match the step transforms.  Step transform links can be found after following a link from the step to 
the step definition.

**6. Highlight the sections of steps that match in the step definition**

Steps highlight the match groups in a different color to show which parts of the step are matched in the step
definition.

**7. Represent instances of scenarios for scenario outlines.**

Display all the values that would normally be substituted into a scenario for the scenario outline. To 
make it easier to represent them to product owners.  As well as link the instance of the step definitions
for developers.


Installation
------------

Cucumber-In-The-Yard (CITY) requires the following gems installed:

    Gherkin - http://cukes.info
    Cucumber - http://cukes.info
    YARD - http://yardoc.org

To install CITY use the following command:

    $ gem install cucumber-in-the-yard
    
(Add `sudo` if you're installing under a POSIX system as root)

Alternatively, if you've checked the source out directly, you can call 
`rake install` from the root project directory.


Usage
-----

**1. Rake Task**

You can do this by adding the following to your `Rakefile`:
    
    require "yard"
    require "city"

    YARD::Rake::CitydocTask.new do |t|
      t.files   = ['features/**/*.feature', 'features/**/*.rb', OTHER_PATHS]   # optional
      t.options = ['--any', '--extra', '--opts'] # optional
    end

both the `files` and `options` settings are optional. `files` will default to
`lib/**/*.rb` and `options` will represents any options you might want
to add. Again, a full list of options is available by typing `yardoc --help`
in a shell. You can also override the options at the Rake command-line with the
OPTS environment variable:


Details
--------

There are two things that I enjoy: a test framework written in my own Domain Specific Language (DSL)
that is easily understood by all those on a project and the ability for all participants to easily read, 
search, and view the tests.

Cucumber is an amazing tool that allowed me to define exercisable requirements.  My biggest obstacle was
bringing these requirements to my team, the product owner, and other stakeholders.

Initially I tried to expose more of the functionality by providing freshly authored requirements through 
email, attachments to JIRA tickets, or linked in wiki documents.  None of these methods were very sustainable 
or successful.  First, I was continually pushing out the documents to those interested.  Second, the documents were displayed to the user in text without the syntax highlighting that was exceedingly helpful for quickly understanding the requirements.

I also found it hard to share the test framework that I had put together with another developer that joined 
the team.  It was difficult to direct them around the features, tags, step definitions, and transforms.  
It was when I started to convey to them the conventions that I had established that I wished I had a tool 
that would allow me to provide documentation like one would find generated by a great tool like YARD.

So I set out to integrate Cucumber objects like features, backgrounds, scenarios, tags, steps, step 
definitions, and transforms into a YARD template.  From my quick survey of the landscape I can see that the 
my needs are different than a lot of others that use Cucumber.  The entire project that spawned this effort 
was solely to exercise the functionality of a different, large project and so there is a huge dependence on
having the requirements documented.  This is in contrast to other projects that are using this on a small 
scale to test the functionality of small software component.  Though, ultimately, I realized that the 
functionality may provide a valuable tool for many as I feel it helps more solidly bridge the reporting of 
the documentation by putting a coat of paint on it.

Roadmap
-------

**Future Feature Ideas**

**1. Feature/Scenario Tag unions and intersections**

Create an AJAX interface that would allow the user to specify tags to union, intersect, or exclude to 
produce a list of features and scenarios that would execute.  The output could also provide an example
command line parameter list to produce the feature/scenario execution results.

Visualization of this execution with some graphing library for some extra points.

**2. Performance enhancements**

The current rate of documentation is not dreadfully slow anymore but more performance enhancements could
always be performed to produce the documentation faster.

**3. Requirements Only Docuementation**

'fulldoc' is the default documentation generated but I have this thought that a requirements-only document
may be useful.  Essentially the first draft would be the current documentation minus the class and method
links/searches and replacing the index.html.

**4. Before, After, and Around Hooks**

Document the additional before, after, and around hooks that Cucumber uses.  Specifically display the before, after, and around
hooks that are tied to tags (unions and intersections) on the tag pages.

**5. Layout refinements of the step definition / step tranform page**

More work could be done to make this page more searchable, sortable, and usable.


**6. Table Step Transforms**

The table step transform matching would be nice to show which tables are affected by table transforms



LICENSE
-------

(The MIT License)

Copyright (c) 2010 FIX

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.