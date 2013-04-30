#!/bin/sh
set -e -x

#######################################################################
# cpanm
# version 1.6908

# DEPENDENCIES
yum install -y make gcc tar curl perl perl-Module-Build

# go to bin
cd /usr/bin
# download script, make it exec
curl -LO https://raw.github.com/miyagawa/cpanminus/1.6908/cpanm
chmod +x cpanm

#######################################################################
# prinseq
# version 20.3

# create your base folder
mkdir -p /opt/prinseq
cd /opt/prinseq
BASE_FOLDER=/opt/prinseq

# prinseq native deps: cairo libs
yum install -y cairo cairo-devel

# random prereqs
cpanm Test::Simple@0.98
cpanm Pod::Parser@1.60

# for some reason, this is PathTools@3.40
cpanm Cwd@3.40

cpanm common::sense@3.6
cpanm JSON::XS@2.33
cpanm JSON@2.57
cpanm Getopt::Long@2.39
cpanm Pod::Usage@1.61
cpanm Digest::MD5@2.52
cpanm version@0.9902
cpanm MIME::Base64@3.13

# update module::build
cpanm Module::Metadata@1.000011
cpanm JSON::PP@2.27202
cpanm CPAN::Meta::YAML@0.008
cpanm Parse::CPAN::Meta@1.4404
cpanm CPAN::Meta::Requirements@2.122
cpanm CPAN::Meta@2.130880
cpanm Perl::OSType@1.003
cpanm Module::Build@0.4005

# cairo bindings
cpanm ExtUtils::Depends@0.304
cpanm ExtUtils::PkgConfig@1.14
cpanm Cairo@1.103

# stats related
cpanm Math::MatrixReal@2.08
cpanm Math::Cephes::Matrix@0.51
cpanm Text::SimpleTable@2.03
cpanm Want@0.21
# need old version of contextual::return
cpanm http://search.cpan.org/CPAN/authors/id/D/DC/DCONWAY/Contextual-Return-v0.2.1.tar.gz
cpanm Statistics::PCA@0.0.1

# download prinseq, install
wget http://resources.ohnosequences.com/prinseq/prinseq-lite-0.20.3.tar.gz
tar -xzf prinseq-lite-0.20.3.tar.gz
rm prinseq-lite-0.20.3.tar.gz
chmod +x prinseq-lite-0.20.3/*.pl
# links
ln -sf $BASE_FOLDER/prinseq-lite-0.20.3/*.pl /usr/bin/