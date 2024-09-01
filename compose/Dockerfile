###################
### Extensions ####
###################
FROM ghcr.io/keitaroinc/ckan:2.9.11-focal as extbuild

# Locations and tags, please use specific tags or revisions
ENV HARVEST_GIT_URL=https://github.com/ckan/ckanext-harvest
ENV HARVEST_GIT_BRANCH=v1.5.6
ENV SPATIAL_GIT_URL=https://github.com/ckan/ckanext-spatial.git
ENV SPATIAL_GIT_BRANCH=v1.1.0
ENV GEOVIEW_GIT_URL=https://github.com/ckan/ckanext-geoview.git
ENV GEOVIEW_GIT_BRANCH=v0.0.18
ENV OFFICEDOCS_GIT_URL=https://github.com/apteksdi/ckanext-officedocs.git
ENV OFFICEDOCS_GIT_BRANCH=master
ENV DCAT_GIT_URL=https://github.com/kangmoesss/ckanext-dcat.git
ENV DCAT_GIT_BRANCH=master
ENV TYPEDPACKAGE_GIT_URL=https://github.com/apteksdi/ckanext-create_typed_package.git
ENV TYPEDPACKAGE_GIT_BRANCH=master
ENV RESOURCEDICTIONARY_GIT_URL=https://github.com/keitaroinc/ckanext-resourcedictionary.git
ENV RESOURCEDICTIONARY_GIT_BRANCH=main
ENV RESOURCEAUTHORIZER_GIT_URL=https://github.com/apteksdi/ckanext-resourceauthorizer-2.git
ENV RESOURCEAUTHORIZER_GIT_BRANCH=master
ENV NOANONACCESS_GIT_URL=https://github.com/saiafarm/ckanext-noanonaccess.git
ENV NOANONACCESS_GIT_BRANCH=master
ENV NORESOURCE_GIT_URL=https://github.com/keitaroinc/ckanext-noresource.git
ENV NORESOURCE_GIT_BRANCH=master
ENV USERTRACKING_GIT_URL=https://github.com/SmdhMdep/ckanext-usertracking.git
ENV USERTRACKING_GIT_BRANCH=main
ENV ORGS_GIT_URL=https://github.com/USEPA/ckanext-collaborator_orgs.git
ENV ORGS_GIT_BRANCH=master
ENV FLUENT_GIT_URL=https://github.com/ckan/ckanext-fluent.git
ENV FLUENT_GIT_BRANCH=master
ENV PDF_GIT_URL=https://github.com/apteksdi/ckanext-pdfview.git
ENV PDF_GIT_BRANCH=master
ENV SECURITY_GIT_URL=https://github.com/apteksdi/ckanext-security.git
ENV SECURITY_GIT_BRANCH=master
ENV DATAPACKAGER_GIT_URL=https://gitlab.data.go.id/root/ckanext-datapackager.git
ENV DATAPACKAGER_GIT_BRANCH=main
ENV DATASETAPPROVAL_GIT_URL=https://gitlab.data.go.id/root/ckanext-datasetapproval.git
ENV DATASETAPPROVAL_GIT_BRANCH=master
ENV DATOPIAN_GIT_URL=https://gitlab.data.go.id/root/ckanext-datopian.git
ENV DATOPIAN_GIT_BRANCH=main

# Switch to the root user
USER root

# Set the locale
RUN apt-get update

# Install necessary packages to build extensions
RUN apt-get install --no-install-recommends -y \
	xmlsec1 \
    gcc \
    g++ \
    libffi-dev \
    openssl \
    python3.8-dev \
    rustc \
    cargo \
    libgeos-dev \
    libc6-dev \
    musl-dev \
    python3-setuptools \
    libgdal-dev \
    libpq-dev \
    libssl-dev

# Fetch and build the custom CKAN extensions
RUN pip wheel --wheel-dir=/wheels git+${HARVEST_GIT_URL}@${HARVEST_GIT_BRANCH}#egg=ckanext-harvest
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-harvest/master/requirements.txt
RUN curl -o /wheels/harvest.txt https://raw.githubusercontent.com/apteksdi/ckanext-harvest/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${SPATIAL_GIT_URL}@${SPATIAL_GIT_BRANCH}#egg=ckanext-spatial
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/ckan/ckanext-spatial/v1.1.0/requirements.txt
RUN curl -o /wheels/spatial.txt https://raw.githubusercontent.com/ckan/ckanext-spatial/v1.1.0/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${GEOVIEW_GIT_URL}@${GEOVIEW_GIT_BRANCH}#egg=ckanext-geoview
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/ckan/ckanext-geoview/${GEOVIEW_GIT_BRANCH}/pip-requirements.txt
RUN curl -o /wheels/geoview.txt https://raw.githubusercontent.com/ckan/ckanext-geoview/${GEOVIEW_GIT_BRANCH}/pip-requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${OFFICEDOCS_GIT_URL}@${OFFICEDOCS_GIT_BRANCH}#egg=ckanext-officedocs
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-officedocs/${OFFICEDOCS_GIT_BRANCH}/requirements.txt
RUN curl -o /wheels/officedocs.txt https://raw.githubusercontent.com/apteksdi/ckanext-officedocs/${OFFICEDOCS_GIT_BRANCH}/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${DCAT_GIT_URL}@${DCAT_GIT_BRANCH}#egg=ckanext-dcat
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/ckan/ckanext-dcat/master/requirements.txt
RUN curl -o /wheels/dcat.txt https://raw.githubusercontent.com/ckan/ckanext-dcat/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${TYPEDPACKAGE_GIT_URL}@${TYPEDPACKAGE_GIT_BRANCH}#egg=ckanext-create_typed_package
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-create_typed_package/master/requirements.txt
RUN curl -o /wheels/typedpackage.txt https://raw.githubusercontent.com/apteksdi/ckanext-create_typed_package/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${RESOURCEDICTIONARY_GIT_URL}@${RESOURCEDICTIONARY_GIT_BRANCH}#egg=ckanext-resourcedictionary
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/keitaroinc/ckanext-resourcedictionary/main/requirements.txt
RUN curl -o /wheels/resourcedictionary.txt https://raw.githubusercontent.com/keitaroinc/ckanext-resourcedictionary/main/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${RESOURCEAUTHORIZER_GIT_URL}@${RESOURCEAUTHORIZER_GIT_BRANCH}#egg=ckanext-resourceauthorizer
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-resourceauthorizer-2/master/requirements.txt
RUN curl -o /wheels/resourceauthorizer.txt https://raw.githubusercontent.com/apteksdi/ckanext-resourceauthorizer-2/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${NOANONACCESS_GIT_URL}@${NOANONACCESS_GIT_BRANCH}#egg=ckanext-noanonaccess
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/saiafarm/ckanext-noanonaccess/master/requirements.txt
RUN curl -o /wheels/noanonaccess.txt https://raw.githubusercontent.com/saiafarm/ckanext-noanonaccess/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${NORESOURCE_GIT_URL}@${NORESOURCE_GIT_BRANCH}#egg=ckanext-noresource
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/keitaroinc/ckanext-noresource/master/requirements.txt
RUN curl -o /wheels/noresource.txt https://raw.githubusercontent.com/keitaroinc/ckanext-noresource/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${USERTRACKING_GIT_URL}@${USERTRACKING_GIT_BRANCH}#egg=ckanext-usertracking
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/SmdhMdep/ckanext-usertracking/main/requirements.txt
RUN curl -o /wheels/usertracking.txt https://raw.githubusercontent.com/SmdhMdep/ckanext-usertracking/main/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${ORGS_GIT_URL}@${ORGS_GIT_BRANCH}#egg=ckanext-collaborator_orgs
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/USEPA/ckanext-collaborator_orgs/master/requirements.txt
RUN curl -o /wheels/orgs.txt https://raw.githubusercontent.com/USEPA/ckanext-collaborator_orgs/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${FLUENT_GIT_URL}@${FLUENT_GIT_BRANCH}#egg=ckanext-fluent
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/ckan/ckanext-fluent/master/requirements.txt
RUN curl -o /wheels/fluent.txt https://raw.githubusercontent.com/ckan/ckanext-fluent/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${PDF_GIT_URL}@${PDF_GIT_BRANCH}#egg=ckanext-pdfview
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-pdfview/master/requirements.txt
RUN curl -o /wheels/pdfview.txt https://raw.githubusercontent.com/apteksdi/ckanext-pdfview/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${SECURITY_GIT_URL}@${SECURITY_GIT_BRANCH}#egg=ckanext-security
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-security/master/requirements.txt
RUN curl -o /wheels/security.txt https://raw.githubusercontent.com/apteksdi/ckanext-security/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${DATAPACKAGER_GIT_URL}@${DATAPACKAGER_GIT_BRANCH}#egg=ckanext-datapackager
RUN pip wheel --wheel-dir=/wheels -r https://gitlab.data.go.id/root/ckanext-datapackager/-/raw/staging/requirements.txt
RUN curl -o /wheels/datapackager.txt https://gitlab.data.go.id/root/ckanext-datapackager/-/raw/staging/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${DATASETAPPROVAL_GIT_URL}@${DATASETAPPROVAL_GIT_BRANCH}#egg=ckanext-datasetapproval
RUN pip wheel --wheel-dir=/wheels -r https://gitlab.data.go.id/root/ckanext-datasetapproval/-/raw/master/requirements.txt
RUN curl -o /wheels/datasetapproval.txt https://gitlab.data.go.id/root/ckanext-datasetapproval/-/raw/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${DATOPIAN_GIT_URL}@${DATOPIAN_GIT_BRANCH}#egg=ckanext-datopian
RUN pip wheel --wheel-dir=/wheels -r https://gitlab.data.go.id/root/ckanext-datopian/-/raw/main/requirements.txt
RUN curl -o /wheels/datopian.txt https://gitlab.data.go.id/root/ckanext-datopian/-/raw/main/requirements.txt

USER ckan

############
### MAIN ###
############
FROM ghcr.io/keitaroinc/ckan:2.9.11

LABEL maintainer="Keitaro Inc <info@keitaro.com>"

#ENV CKAN_ROOT_PATH /katalog/{{LANG}}/
ENV CKAN__PLUGINS envvars stats image_view text_view recline_view resource_proxy geo_view harvest ckan_harvester csw_harvester spatial_metadata spatial_query pdf_view officedocs_view geojson_view shp_view wmts_view datatables_view resourcedictionary datastore datapusher waf_harvester doc_harvester dcat dcat_rdf_harvester dcat_json_harvester dcat_json_interface structured_data
ENV CKAN__AUTH__CREATE_USER_VIA_API false
ENV CKAN__AUTH__CREATE_USER_VIA_web false
ENV CKAN__AUTH__PUBLIC_USER_DETAILS false
ENV CKAN__AUTH__PUBLIC_ACTIVITY_STREAM_DETAIL false
ENV CKANEXT__SPATIAL__SEARCH_BACKEND solr-bbox
ENV CKANEXT__SPATIAL__HARVEST__CONTINUE_ON_VALIDATION_ERRORS true
ENV CKANEXT__SPATIAL__COMMON_MAP__TYPE custom
ENV CKANEXT__SPATIAL__COMMON_MAP__CUSTOM__URL http://a.tile.openstreetmap.org/{z}/{x}/{y}.png
ENV CKANEXT__SPATIAL__COMMON_MAP__ATTRIBUTION Map tiles by <a href="http://openstreetmap.org">OpenStreetMap</a> (<a href="http://creativecommons.org/licenses/by-sa/3.0">CC BY SA</a>).
ENV CKANEXT__GEOVIEW__OL_VIEWER__FORMATS wms wfs geojson gml kml arcgis_rest gft
ENV CKANEXT__GEOVIEW__GEOJSON__MAX_FILE_SIZE 100000000
ENV CKANEXT__GEOVIEW__SHP_VIEWER__SRID 4326
ENV CKANEXT__GEOVIEW__SHP_VIEWER__ENCODING UTF-8
ENV CKANEXT__SECURITY__UPLOAD_BLACKLIST ['.pdf', '.doc', '.docx', '.png', 'image/jpg', '.html', '.js', '.sql', '.php', 'application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'image/png', 'image/jpeg', 'text/html', 'text/javascript', 'application/sql', 'application/x-sql']
ENV SECRET_KEY u6FFxT2zYk1LbLrk3aaCs6x5l3JMgsUUqm2r80W7yuK

# Switch to the root user
USER root

COPY --from=extbuild /wheels /srv/app/ext_wheels

# Install and enable the custom extensions
RUN pip install auth && \
    pip install --force-reinstall typing-extensions==4.3.0 && \
    pip install gspread && \
    pip install pandas && \
    pip install iso-639 && \
    pip install first && \
    pip install "OWSLib==0.23.0" && \
    pip install pylons && \
    pip install actions && \
    pip install constants && \
    pip install helpers && \
    pip install urllib3 && \
    pip install rdflib && \
    pip install geomet && \
    pip install "GeoAlchemy2==0.5.0" && \
    pip install --force-reinstall cryptography==38.0.4 && \
    pip install -U cffi && \
    pip install flask_debugtoolbar && \
    pip install psycopg2-binary && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-dcat && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/dcat.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-harvest && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/harvest.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-spatial && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/spatial.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-geoview && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/geoview.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-officedocs && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/officedocs.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-create_typed_package && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/typedpackage.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-resourcedictionary && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/resourcedictionary.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-resourceauthorizer && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/resourceauthorizer.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-noanonaccess && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/noanonaccess.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-noresource && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/noresource.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-usertracking && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/usertracking.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-collaborator_orgs && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/orgs.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-fluent && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/fluent.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-pdfview && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/pdfview.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-security && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/security.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-datapackager && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/datapackager.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-datasetapproval && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/datasetapproval.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-datopian && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/datopian.txt && \
    # Configure plugins
    ckan config-tool "${APP_DIR}/production.ini" "ckan.root_path = ${CKAN_ROOT_PATH}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckan.plugins = ${CKAN__PLUGINS}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckan.auth.create_user_via_api = ${CKAN__AUTH__CREATE_USER_VIA_API}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckan.auth.create_user_via_web = ${CKAN__AUTH__CREATE_USER_VIA_WEB}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckan.auth.public_user_details = ${CKAN__AUTH__PUBLIC_USER_DETAILS}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckan.auth.public_activity_stream_detail = ${CKAN__AUTH__PUBLIC_ACTIVITY_STREAM_DETAIL}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.spatial.search_backend = ${CKANEXT__SPATIAL__SEARCH_BACKEND}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.spatial.harvest.continue_on_validation_errors = ${CKANEXT__SPATIAL__HARVEST__CONTINUE_ON_VALIDATION_ERRORS}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.spatial.common_map.type = ${CKANEXT__SPATIAL__COMMON_MAP__TYPE}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.spatial.common_map.custom.url = ${CKANEXT__SPATIAL__COMMON_MAP__CUSTOM__URL}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.spatial.common_map.attribution = ${CKANEXT__SPATIAL__COMMON_MAP__ATTRIBUTION}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.geoview.ol_viewer.formats = ${CKANEXT__GEOVIEW__OL_VIEWER__FORMATS}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.geoview.geojson.max_file_size = ${CKANEXT__GEOVIEW__GEOJSON__MAX_FILE_SIZE}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.geoview.shp_viewer.srid = ${CKANEXT__GEOVIEW__SHP_VIEWER__SRID}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.geoview.shp_viewer.encoding = ${CKANEXT__GEOVIEW__SHP_VIEWER__ENCODING}" && \
    ckan config-tool "${APP_DIR}/production.ini" "beaker.session.secret = ${SECRET_KEY}}" && \   
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.security.upload_blacklist = ${CKANEXT__SECURITY__UPLOAD_BLACKLIST}}" && \   
    chown -R ckan:ckan /srv/app

# Remove wheels
RUN rm -rf /srv/app/ext_wheels

# Add harvest afterinit script
COPY ./afterinit.d/00_harvest.sh ${APP_DIR}/docker-afterinit.d/00_harvest.sh

# Switch to the ckan user
USER ckan
