#!/bin/sh
ckan -c /srv/app/production.ini harvester initdb
ckan -c /srv/app/production.ini resourceauthorizer initdb
ckan -c /srv/app/production.ini collaborator-orgs init-db
ckan -c /srv/app/production.ini activitiestracker initdb
