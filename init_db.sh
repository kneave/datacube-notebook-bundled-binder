#!/bin/bash

set -eux

# PostgreSQL Database initialisation

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DATABASE=$( grep db_database $THISDIR/.datacube.conf | awk '{ print $2 }' )
USERNAME=$( grep db_username $THISDIR/.datacube.conf | awk '{ print $2 }' )
PASSWORD=$( grep db_password $THISDIR/.datacube.conf | awk '{ print $2 }' )

psql postgres -c "CREATE USER $USERNAME PASSWORD '$PASSWORD' SUPERUSER LOGIN"
createdb -O $USERNAME $DATABASE

datacube system init

#Further Database preparation, e.g. product addition and dataset indexing
#psql -d $DATABASE -U $USERNAME -f $THISDIR/seed_db.sql
