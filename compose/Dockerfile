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
ENV PAGES_GIT_URL=https://github.com/ckan/ckanext-pages.git
ENV PAGES_GIT_BRANCH=master
ENV SHOWCASE_GIT_URL=https://github.com/ckan/ckanext-showcase.git
ENV SHOWCASE_GIT_BRANCH=master
ENV SCHEMING_GIT_URL=https://github.com/ckan/ckanext-scheming.git
ENV SCHEMING_GIT_BRANCH=master
ENV RESOURCEDICTIONARY_GIT_URL=https://github.com/keitaroinc/ckanext-resourcedictionary.git
ENV RESOURCEDICTIONARY_GIT_BRANCH=main
ENV SDBI_GIT_URL=https://github.com/apteksdi/ckanext-sdbi.git
ENV SDBI_GIT_BRANCH=master
ENV RESOURCEAUTHORIZER_GIT_URL=https://github.com/apteksdi/ckanext-resourceauthorizer-2.git
ENV RESOURCEAUTHORIZER_GIT_BRANCH=master
ENV USERTRACKING_GIT_URL=https://github.com/SmdhMdep/ckanext-usertracking.git
ENV USERTRACKING_GIT_BRANCH=main
ENV ORGS_GIT_URL=https://github.com/USEPA/ckanext-collaborator_orgs.git
ENV ORGS_GIT_BRANCH=master
ENV FLUENT_GIT_URL=https://github.com/ckan/ckanext-fluent.git
ENV FLUENT_GIT_BRANCH=master
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
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/ckan/ckanext-spatial/v1.1.0/requirements.txt
RUN curl -o /wheels/spatial.txt https://raw.githubusercontent.com/ckan/ckanext-spatial/v1.1.0/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${GEOVIEW_GIT_URL}@${GEOVIEW_GIT_BRANCH}#egg=ckanext-geoview
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/ckan/ckanext-geoview/${GEOVIEW_GIT_BRANCH}/pip-requirements.txt
RUN curl -o /wheels/geoview.txt https://raw.githubusercontent.com/ckan/ckanext-geoview/${GEOVIEW_GIT_BRANCH}/pip-requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${PAGES_GIT_URL}@${PAGES_GIT_BRANCH}#egg=ckanext-pages
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/ckan/ckanext-pages/${PAGES_GIT_BRANCH}/requirements.txt
RUN curl -o /wheels/pages.txt https://raw.githubusercontent.com/ckan/ckanext-pages/${PAGES_GIT_BRANCH}/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${SHOWCASE_GIT_URL}@${SHOWCASE_GIT_BRANCH}#egg=ckanext-showcase
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/ckan/ckanext-showcase/${SHOWCASE_GIT_BRANCH}/requirements.txt
RUN curl -o /wheels/showcase.txt https://raw.githubusercontent.com/ckan/ckanext-showcase/${SHOWCASE_GIT_BRANCH}/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${SCHEMING_GIT_URL}@${SCHEMING_GIT_BRANCH}#egg=ckanext-scheming
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-scheming/master/requirements.txt
RUN curl -o /wheels/scheming.txt https://raw.githubusercontent.com/apteksdi/ckanext-scheming/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${RESOURCEDICTIONARY_GIT_URL}@${RESOURCEDICTIONARY_GIT_BRANCH}#egg=ckanext-resourcedictionary
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/keitaroinc/ckanext-resourcedictionary/main/requirements.txt
RUN curl -o /wheels/resourcedictionary.txt https://raw.githubusercontent.com/keitaroinc/ckanext-resourcedictionary/main/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${SDBI_GIT_URL}@${SDBI_GIT_BRANCH}#egg=ckanext-sdbi
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-sdbi/master/requirements.txt
RUN curl -o /wheels/sdbi.txt https://raw.githubusercontent.com/apteksdi/ckanext-sdbi/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${RESOURCEAUTHORIZER_GIT_URL}@${RESOURCEAUTHORIZER_GIT_BRANCH}#egg=ckanext-resourceauthorizer
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-resourceauthorizer-2/master/requirements.txt
RUN curl -o /wheels/resourceauthorizer.txt https://raw.githubusercontent.com/apteksdi/ckanext-resourceauthorizer-2/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${USERTRACKING_GIT_URL}@${USERTRACKING_GIT_BRANCH}#egg=ckanext-usertracking
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/SmdhMdep/ckanext-usertracking/main/requirements.txt
RUN curl -o /wheels/usertracking.txt https://raw.githubusercontent.com/SmdhMdep/ckanext-usertracking/main/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${ORGS_GIT_URL}@${ORGS_GIT_BRANCH}#egg=ckanext-collaborator_orgs
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/USEPA/ckanext-collaborator_orgs/master/requirements.txt
RUN curl -o /wheels/orgs.txt https://raw.githubusercontent.com/USEPA/ckanext-collaborator_orgs/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${SECURITY_GIT_URL}@${SECURITY_GIT_BRANCH}#egg=ckanext-security
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/data-govt-nz/ckanext-security/master/requirements.txt
RUN curl -o /wheels/security.txt https://raw.githubusercontent.com/data-govt-nz/ckanext-security/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${FLUENT_GIT_URL}@${FLUENT_GIT_BRANCH}#egg=ckanext-fluent
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/ckan/ckanext-fluent/master/requirements.txt
RUN curl -o /wheels/fluent.txt https://raw.githubusercontent.com/ckan/ckanext-fluent/master/requirements.txt

USER ckan

############
### MAIN ###
############
FROM ghcr.io/keitaroinc/ckan:2.9.11-focal

LABEL maintainer="Imam Arif Rahman <imam.rahman@support.bappenas.go.id>"

#ENV CKAN_ROOT_PATH /data/{{LANG}}/
ENV CKAN__PLUGINS envvars stats image_view text_view recline_view resource_proxy resourceauthorizer geo_view harvest ckan_harvester csw_harvester spatial_metadata spatial_query geojson_view shp_view wmts_view datatables_view resourcedictionary datastore datapusher pages showcase
ENV CKAN__AUTH__CREATE_USER_VIA_API false
ENV CKAN__AUTH__CREATE_USER_VIA_web false
ENV CKAN__AUTH__PUBLIC_USER_DETAILS false
ENV CKAN__AUTH__PUBLIC_ACTIVITY_STREAM_DETAIL false
ENV SECRET_KEY u6FFxT2zYk1LbLrk3aaCs6x5l3JMgsUUqm2r80W7tzI
ENV CKANEXT__SPATIAL__SEARCH_BACKEND solr-bbox
ENV CKANEXT__SPATIAL__HARVEST__CONTINUE_ON_VALIDATION_ERRORS true
ENV CKAN__DATAREQUESTS__SHOW_DATAREQUESTS__BADGE true
#ENV CKANEXT__SPATIAL__COMMON_MAP__TYPE custom
#ENV CKANEXT__SPATIAL__COMMON_MAP__CUSTOM__URL http://tile.stamen.com/terrain/{Z}/{X}/{Y}.png
#ENV CKANEXT__SPATIAL__COMMON_MAP__ATTRIBUTION Map tiles by <a href="https://www.big.go.id">Badan Informasi Geospasial</a>.
ENV CKANEXT__GEOVIEW__OL_VIEWER__FORMATS wms wfs geojson gml kml arcgis_rest gft
ENV CKANEXT__PAGES__ALLOW_HTML True
ENV CKANEXT__PAGES__EDITOR ckeditor
ENV CKANEXT__SHOWCASE__EDITOR ckeditor

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
    #pip install pyopenssl cryptography --upgrade && \
    pip install -U cffi && \
    pip install ckanext-datarequests && \
    pip install flask_debugtoolbar && \
    pip install psycopg2-binary && \
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
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-sdbi && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/sdbi.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-scheming && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/scheming.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-resourcedictionary && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/resourcedictionary.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-resourceauthorizer && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/resourceauthorizer.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-usertracking && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/usertracking.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-collaborator_orgs && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/orgs.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-fluent && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/fluent.txt && \
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
    ckan config-tool "${APP_DIR}/production.ini" "scheming.dataset_schemas = ${SCHEMING__DATASET_SCHEMAS}" && \
    ckan config-tool "${APP_DIR}/production.ini" "scheming.organizations_schemas = ${SCHEMING__ORGANIZATIONS_SCHEMAS}" && \
    ckan config-tool "${APP_DIR}/production.ini" "scheming.presets = ${SCHEMING__PRESETS}" && \
    ckan config-tool "${APP_DIR}/production.ini" "scheming.facet_list = ${SCHEMING__DCAT_FACET_LIST}" && \
    ckan config-tool "${APP_DIR}/production.ini" "beaker.session.secret = ${SECRET_KEY}}" && \
    chown -R ckan:ckan /srv/app

# Remove wheels
RUN rm -rf /srv/app/ext_wheels

# Add harvest afterinit script
COPY ./00_harvest.sh ${APP_DIR}/docker-afterinit.d/00_harvest.sh

# Switch to the ckan user
USER ckan
