# ABSTRACT: A condensed summary of Pinto

package Pinto::Manual::QuickStart;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

=pod

=head1 CREATING THE REPOSITORY

  pinto -r /repos/dir init

=head1 BROWSING THE REPOSITORY

  # See all packages in the default stack
  pinto -r /repos/dir list

  # See all packages in the default stack matching "Foo"
  pinto -r /repos/dir list -P Foo

  # See all packages in the default stack by author "JOE"
  pinto -r /repos/dir list -A JOE

  # See all packages in the stack called "dev"
  pinto -r /repos/dir list --stack dev
  pinto -r /repos/dir list dev

  # See all packages across all stacks
  pinto -r /repos/dir list --stack @
  pinto -r /repos/dir list @

=head1 PULLING DEPENDENCIES

  # Pull latest version of Foo
  pinto -r /repos/dir pull Foo

  # Pull version 2.4 or newer of Foo
  pinto -r /repos/dir pull Foo~2.4

  # Pull a precise distribution
  pinto -r /repos/dir pull AUTHOR/Foo-1.9.tar.gz

  # Pull many packages or distributions
  pinto -r /repos/dir pull Foo Bar Baz Nuts ...
  pinto -r /repos/dir pull < LIST_OF_PACKAGES

  # Pull everything for a Dist::Zilla project
  dzil listdeps | pinto -r /repos/dir pull

  # Pull onto a stack called "dev"
  pinto -r /repos/dir pull --stack dev Foo

=head1 ADDING LOCAL DISTRIBUTIONS

  # Add local dist
  pinto -r /repos/dir add My-Dist-1.0.tar.gaz

  # Assign to a different author
  pinto -r /repos/dir add --author SHAKESPEARE My-Dist-1.0.tar.gz

  # Add to a stack called "dev"
  pinto -r /repos/dir add --stack dev My-Dist-1.0.tar.gz

=head1 INSTALLING THINGS

  # Install from the default stack
  pinto -r /repos/dir install My::App

  # Install into a local::lib directory
  pinto -r /repos/dir install -l sandbox My::App

  # Install from a stack called "dev"
  pinto -r /repos/dir install --stack dev My::App

  # Install and populate the repository with missing prereqs
  pinto -r /repos/dir install --pull My::App

=head1 MANAGING STACKS

  # Create an empty stack called "qa"
  pinto -r /repos/dir new qa

  # Create a stack by copying qa -> dev
  pinto -r /repos/dir copy qa dev

  # Merge the dev stack into qa
  pinto -r /repos/dir merge dev qa

  # Delete the dev stack
  pinto -r /repos/dir remove dev

  # Show the names of existing stacks
  pinto -r /repos/dir stacks

  # Mark the "qa" stack as the default
  pinto -r /repos/dir edit qa --default

=head1 USING PINS

  # Pin a package on the default stack
  pinto -r /repos/dir pin Some::Package

  # Pin a package on a stack called "dev"
  pinto -r /repos/dir pin --stack dev Some::Package

  # Pin a distribution
  pinto -r /repos/dir pin AUTHOR/Some-Dist-1.0.tar.gz

  # Unpin a package from the default stack
  pinto -r /repos/dir unpin Some::Package

  # Unpin a package from stack called "dev"
  pinto -r /repos/dir unpin --stack dev Some::Package

  # Unpin a distribution
  pinto -r /repos/dir unpin AUTHOR/Some-Dist-1.0.tar.gz

=head1 MISCELLANY

  # Report missing distribution archives
  pinto -r /repos/dir verify

  # Report repos statistics
  pinto -r /repos/dir stats

  # Show the index file for a called "dev"
  pinto -r /repos/dir index --stack dev

=head1 GETTING MORE HELP

  # Show a list of pinto commands
  pinto commands

  # Show a breif summary of a COMMAND
  pinto help COMMAND

  # Show the manual for a COMMAND
  pinto manual COMMAND

=head1 SEE ALSO

L<Pinto::Manual::Tutorial>

L<Pinto>

L<pinto>

=cut
