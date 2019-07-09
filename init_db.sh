#!/bin/bash

set -eux

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DATABASE=$( grep db_database $THISDIR/.datacube.conf | awk '{ print $2 }' )
USERNAME=$( grep db_username $THISDIR/.datacube.conf | awk '{ print $2 }' )
PASSWORD=$( grep db_password $THISDIR/.datacube.conf | awk '{ print $2 }' )

# PostgreSQL Database initialisation
psql postgres -c "CREATE USER $USERNAME PASSWORD '$PASSWORD' SUPERUSER LOGIN"
createdb -O $USERNAME $DATABASE

datacube system init

#psql -d datacube -U dc_user -f $THISDIR/seed_db.sql
