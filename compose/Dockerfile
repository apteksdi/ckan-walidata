###################
### Extensions ####
###################
FROM ghcr.io/keitaroinc/ckan:2.9.11-focal as extbuild

# Locations and tags, please use specific tags or revisions
ENV HARVEST_GIT_URL=https://github.com/ckan/ckanext-harvest
ENV HARVEST_GIT_BRANCH=v1.3.4
ENV SPATIAL_GIT_URL=https://github.com/ckan/ckanext-spatial.git
ENV SPATIAL_GIT_BRANCH=master
ENV GEOVIEW_GIT_URL=https://github.com/ckan/ckanext-geoview.git
ENV GEOVIEW_GIT_BRANCH=v0.0.18
ENV PAGES_GIT_URL=https://github.com/ckan/ckanext-pages.git
ENV PAGES_GIT_BRANCH=master
ENV SHOWCASE_GIT_URL=https://github.com/ckan/ckanext-showcase.git
ENV SHOWCASE_GIT_BRANCH=master
ENV OFFICEDOCS_GIT_URL=https://github.com/apteksdi/ckanext-officedocs.git
ENV OFFICEDOCS_GIT_BRANCH=master
ENV DCAT_GIT_URL=https://github.com/apteksdi/ckanext-dcat.git
ENV DCAT_GIT_BRANCH=master
ENV SCHEMING_GIT_URL=https://github.com/apteksdi/ckanext-scheming.git
ENV SCHEMING_GIT_BRANCH=master
ENV TYPEDPACKAGE_GIT_URL=https://github.com/apteksdi/ckanext-create_typed_package.git
ENV TYPEDPACKAGE_GIT_BRANCH=master
ENV RESOURCEDICTIONARY_GIT_URL=https://github.com/keitaroinc/ckanext-resourcedictionary.git
ENV RESOURCEDICTIONARY_GIT_BRANCH=main
ENV SDBI_GIT_URL=https://github.com/apteksdi/ckanext-sdbi.git
ENV SDBI_GIT_BRANCH=master
ENV OAIPMH_GIT_URL=https://github.com/apteksdi/ckanext-oaipmh.git
ENV OAIPMH_GIT_BRANCH=master
ENV RESOURCEAUTHORIZER_GIT_URL=https://github.com/apteksdi/ckanext-resourceauthorizer-2.git
ENV RESOURCEAUTHORIZER_GIT_BRANCH=master
ENV NOANONACCESS_GIT_URL=https://github.com/saiafarm/ckanext-noanonaccess.git
ENV NOANONACCESS_GIT_BRANCH=master
ENV ISSUES_GIT_URL=https://github.com/apteksdi/ckanext-issues.git
ENV ISSUES_GIT_BRANCH=master
ENV SYNDICATE_GIT_URL=https://github.com/DataShades/ckanext-syndicate.git
ENV SYNDICATE_GIT_BRANCH=master
ENV PDF_GIT_URL=https://github.com/apteksdi/ckanext-pdfview.git
ENV PDF_GIT_BRANCH=master
ENV SECURITY_GIT_URL=https://github.com/apteksdi/ckanext-security.git
ENV SECURITY_GIT_BRANCH=master

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
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/ckan/ckanext-spatial/${SPATIAL_GIT_BRANCH}/requirements.txt
RUN curl -o /wheels/spatial.txt https://raw.githubusercontent.com/ckan/ckanext-spatial/${SPATIAL_GIT_BRANCH}/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${GEOVIEW_GIT_URL}@${GEOVIEW_GIT_BRANCH}#egg=ckanext-geoview
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/ckan/ckanext-geoview/${GEOVIEW_GIT_BRANCH}/pip-requirements.txt
RUN curl -o /wheels/geoview.txt https://raw.githubusercontent.com/ckan/ckanext-geoview/${GEOVIEW_GIT_BRANCH}/pip-requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${PAGES_GIT_URL}@${PAGES_GIT_BRANCH}#egg=ckanext-pages
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/ckan/ckanext-pages/${PAGES_GIT_BRANCH}/requirements.txt
RUN curl -o /wheels/pages.txt https://raw.githubusercontent.com/ckan/ckanext-pages/${PAGES_GIT_BRANCH}/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${SHOWCASE_GIT_URL}@${SHOWCASE_GIT_BRANCH}#egg=ckanext-showcase
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/ckan/ckanext-showcase/${SHOWCASE_GIT_BRANCH}/requirements.txt
RUN curl -o /wheels/showcase.txt https://raw.githubusercontent.com/ckan/ckanext-showcase/${SHOWCASE_GIT_BRANCH}/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${OFFICEDOCS_GIT_URL}@${OFFICEDOCS_GIT_BRANCH}#egg=ckanext-officedocs
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-officedocs/${OFFICEDOCS_GIT_BRANCH}/requirements.txt
RUN curl -o /wheels/officedocs.txt https://raw.githubusercontent.com/apteksdi/ckanext-officedocs/${OFFICEDOCS_GIT_BRANCH}/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${DCAT_GIT_URL}@${DCAT_GIT_BRANCH}#egg=ckanext-dcat
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-dcat/${DCAT_GIT_BRANCH}/requirements.txt
RUN curl -o /wheels/dcat.txt https://raw.githubusercontent.com/apteksdi/ckanext-dcat/${DCAT_GIT_BRANCH}/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${SCHEMING_GIT_URL}@${SCHEMING_GIT_BRANCH}#egg=ckanext-scheming
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-scheming/master/requirements.txt
RUN curl -o /wheels/scheming.txt https://raw.githubusercontent.com/apteksdi/ckanext-scheming/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${TYPEDPACKAGE_GIT_URL}@${TYPEDPACKAGE_GIT_BRANCH}#egg=ckanext-create_typed_package
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-create_typed_package/master/requirements.txt
RUN curl -o /wheels/typedpackage.txt https://raw.githubusercontent.com/apteksdi/ckanext-create_typed_package/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${RESOURCEDICTIONARY_GIT_URL}@${RESOURCEDICTIONARY_GIT_BRANCH}#egg=ckanext-resourcedictionary
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/keitaroinc/ckanext-resourcedictionary/main/requirements.txt
RUN curl -o /wheels/resourcedictionary.txt https://raw.githubusercontent.com/keitaroinc/ckanext-resourcedictionary/main/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${SDBI_GIT_URL}@${SDBI_GIT_BRANCH}#egg=ckanext-sdbi
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-sdbi/master/requirements.txt
RUN curl -o /wheels/sdbi.txt https://raw.githubusercontent.com/apteksdi/ckanext-sdbi/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${OAIPMH_GIT_URL}@${OAIPMH_GIT_BRANCH}#egg=ckanext-oaipmh
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-oaipmh/master/requirements.txt
RUN curl -o /wheels/oaipmh.txt https://raw.githubusercontent.com/apteksdi/ckanext-oaipmh/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${RESOURCEAUTHORIZER_GIT_URL}@${RESOURCEAUTHORIZER_GIT_BRANCH}#egg=ckanext-resourceauthorizer
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-resourceauthorizer-2/master/requirements.txt
RUN curl -o /wheels/resourceauthorizer.txt https://raw.githubusercontent.com/apteksdi/ckanext-resourceauthorizer-2/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${NOANONACCESS_GIT_URL}@${NOANONACCESS_GIT_BRANCH}#egg=ckanext-noanonaccess
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/saiafarm/ckanext-noanonaccess/master/requirements.txt
RUN curl -o /wheels/noanonaccess.txt https://raw.githubusercontent.com/saiafarm/ckanext-noanonaccess/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${ISSUES_GIT_URL}@${ISSUES_GIT_BRANCH}#egg=ckanext-issues
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-issues/master/requirements.txt
RUN curl -o /wheels/issues.txt https://raw.githubusercontent.com/apteksdi/ckanext-issues/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${SYNDICATE_GIT_URL}@${SYNDICATE_GIT_BRANCH}#egg=ckanext-syndicate
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/DataShades/ckanext-syndicate/master/requirements.txt
RUN curl -o /wheels/syndicate.txt https://raw.githubusercontent.com/DataShades/ckanext-syndicate/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${PDF_GIT_URL}@${PDF_GIT_BRANCH}#egg=ckanext-pdfview
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-pdfview/master/requirements.txt
RUN curl -o /wheels/pdfview.txt https://raw.githubusercontent.com/apteksdi/ckanext-pdfview/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${SECURITY_GIT_URL}@${SECURITY_GIT_BRANCH}#egg=ckanext-security
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/data-govt-nz/ckanext-security/master/requirements.txt
RUN curl -o /wheels/security.txt https://raw.githubusercontent.com/data-govt-nz/ckanext-security/master/requirements.txt

USER ckan

############
### MAIN ###
############
FROM ghcr.io/keitaroinc/ckan:2.9.11-focal

LABEL maintainer="Imam Arif Rahman <imam.rahman@support.bappenas.go.id>"

#ENV CKAN_ROOT_PATH /data/{{LANG}}/
ENV CKAN__PLUGINS envvars stats image_view text_view recline_view scheming_datasets resourceauthorizer resource_proxy geo_view harvest ckan_harvester csw_harvester spatial_metadata spatial_query resourcedictionary datastore datapusher pages showcase pdf_view officedocs_view geojson_view shp_view wmts_view datatables_view dcat dcat_rdf_harvester dcat_json_harvester dcat_json_interface structured_data oaipmh_harvester
ENV CKAN__AUTH__CREATE_USER_VIA_API false
ENV CKAN__AUTH__CREATE_USER_VIA_web false
ENV CKAN__AUTH__PUBLIC_USER_DETAILS false
ENV CKAN__AUTH__PUBLIC_ACTIVITY_STREAM_DETAIL false
ENV CKANEXT__SPATIAL__SEARCH_BACKEND solr
ENV CKANEXT__SPATIAL__HARVEST__CONTINUE_ON_VALIDATION_ERRORS true
ENV SECRET_KEY u6FFxT2zYk1LbLrk3aaCs6x5l3JMgsUUqm2r80W7tzI
#ENV CKANEXT__SPATIAL__COMMON_MAP__TYPE custom
#ENV CKANEXT__SPATIAL__COMMON_MAP__CUSTOM__URL http://tile.stamen.com/terrain/{Z}/{X}/{Y}.png
#ENV CKANEXT__SPATIAL__COMMON_MAP__ATTRIBUTION Map tiles by <a href="https://www.big.go.id">Badan Informasi Geospasial</a>.
ENV CKANEXT__GEOVIEW__OL_VIEWER__FORMATS wms wfs geojson gml kml arcgis_rest gft
ENV CKANEXT__PAGES__ALLOW_HTML True
ENV CKANEXT__PAGES__EDITOR ckeditor
ENV CKANEXT__SHOWCASE__EDITOR ckeditor
ENV SCHEMING__DATASET_SCHEMAS ckanext.scheming:camel_photos.yaml
ENV SCHEMING__PRESETS ckanext.scheming:presets.json

# Switch to the root user
USER root

COPY --from=extbuild /wheels /srv/app/ext_wheels

# Install and enable the custom extensions
RUN pip install auth && \
    pip install iso-639 \
    pip install first \
    pip install pylons && \
    pip install actions && \
    pip install constants && \
    pip install helpers && \
    pip install urllib3 && \
    pip install --force-reinstall cryptography==38.0.4 \
    pip install -U cffi && \
    pip install ckanext-datarequests && \
    pip install flask_debugtoolbar && \
    pip install psycopg2-binary && \
    pip install -e git+https://github.com/datagovau/ckanext-agls#egg=ckanext-agls && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-harvest && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/harvest.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-spatial && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/spatial.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-geoview && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/geoview.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-pages && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/pages.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-showcase && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/showcase.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-officedocs && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/officedocs.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-sdbi && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/sdbi.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-scheming && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/scheming.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-create_typed_package && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/typedpackage.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-resourcedictionary && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/resourcedictionary.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-dcat && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/dcat.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-oaipmh && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/oaipmh.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-resourceauthorizer && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/resourceauthorizer.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-noanonaccess && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/noanonaccess.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-issues && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/issues.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-syndicate && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/syndicate.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-pdfview && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/pdfview.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-security && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/security.txt && \
    # Configure plugins
    #ckan config-tool "${APP_DIR}/production.ini" "ckan.root_path = ${CKAN_ROOT_PATH}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckan.plugins = ${CKAN__PLUGINS}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.spatial.search_backend = ${CKANEXT__SPATIAL__SEARCH_BACKEND}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.spatial.harvest.continue_on_validation_errors = ${CKANEXT__SPATIAL__HARVEST__CONTINUE_ON_VALIDATION_ERRORS}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.spatial.common_map.type = ${CKANEXT__SPATIAL__COMMON_MAP__TYPE}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.spatial.common_map.custom.url = ${CKANEXT__SPATIAL__COMMON_MAP__CUSTOM__URL}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.spatial.common_map.attribution = ${CKANEXT__SPATIAL__COMMON_MAP__ATTRIBUTION}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.geoview.ol_viewer.formats = ${CKANEXT__GEOVIEW__OL_VIEWER__FORMATS}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.pages.allow_html = ${CKANEXT__PAGES__ALLOW_HTML}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.pages.editor = ${CKANEXT__PAGES__EDITOR}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.showcase.editor = ${CKANEXT__SHOWCASE__EDITOR}" && \
    ckan config-tool "${APP_DIR}/production.ini" "beaker.session.secret = ${SECRET_KEY}}" && \
    ckan config-tool "${APP_DIR}/production.ini" "scheming.dataset_schemas = ${SCHEMING__DATASET_SCHEMAS}" && \
    ckan config-tool "${APP_DIR}/production.ini" "scheming.presets = ${SCHEMING__PRESETS}" && \
    chown -R ckan:ckan /srv/app

# Remove wheels
RUN rm -rf /srv/app/ext_wheels

# Add harvest afterinit script
COPY ./00_harvest.sh ${APP_DIR}/docker-afterinit.d/00_harvest.sh

# Switch to the ckan user
USER ckan
