#!/bin/bash

set -eux

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#Demo PostgreSQL Database initialisation
psql postgres -c "CREATE USER dc_user PASSWORD 'localuser1234' SUPERUSER LOGIN"
#The -O flag below sets the user: createdb -O DBUSER DBNAME
createdb -O dc_user datacube

#psql -d datacube -U dc_user -f $THISDIR/seed_db.sql
source activate cubeenv
datacube system init
