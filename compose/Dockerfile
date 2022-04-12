###################
### Extensions ####
###################
FROM ghcr.io/keitaroinc/ckan:2.9.5-focal as extbuild

# Locations and tags, please use specific tags or revisions
ENV HARVEST_GIT_URL=https://github.com/ckan/ckanext-harvest
ENV HARVEST_GIT_BRANCH=v1.3.3
ENV PAGES_GIT_URL=https://github.com/ckan/ckanext-pages.git
ENV PAGES_GIT_BRANCH=master
ENV SHOWCASE_GIT_URL=https://github.com/ckan/ckanext-showcase.git
ENV SHOWCASE_GIT_BRANCH=master
ENV OFFICEDOCS_GIT_URL=https://github.com/apteksdi/ckanext-officedocs.git
ENV OFFICEDOCS_GIT_BRANCH=master
ENV SPATIAL_GIT_URL=https://github.com/ckan/ckanext-spatial.git
ENV SPATIAL_GIT_BRANCH=master
ENV GEOVIEW_GIT_URL=https://github.com/ckan/ckanext-geoview.git
ENV GEOVIEW_GIT_BRANCH=master
ENV DATAJSON_GIT_URL=https://github.com/GSA/ckanext-datajson.git
ENV DATAJSON_GIT_BRANCH=main
ENV DCAT_GIT_URL=https://github.com/apteksdi/ckanext-dcat.git
ENV DCAT_GIT_BRANCH=master
ENV HIERARCHY_GIT_URL=https://github.com/ckan/ckanext-hierarchy.git
ENV HIERARCHY_GIT_BRANCH=master
ENV SCHEMING_GIT_URL=https://github.com/apteksdi/ckanext-scheming.git
ENV SCHEMING_GIT_BRANCH=master
ENV TYPEDPACKAGE_GIT_URL=https://github.com/apteksdi/ckanext-create_typed_package.git
ENV TYPEDPACKAGE_GIT_BRANCH=master
ENV SDI_GIT_URL=https://github.com/apteksdi/ckanext-sdi.git
ENV SDI_GIT_BRANCH=master
ENV RESOURCEDICTIONARY_GIT_URL=https://github.com/keitaroinc/ckanext-resourcedictionary.git
ENV RESOURCEDICTIONARY_GIT_BRANCH=main
ENV OAIPMH_GIT_URL=https://github.com/apteksdi/ckanext-oaipmh.git
ENV OAIPMH_GIT_BRANCH=master

# Switch to the root user
USER root

# Set the locale
RUN apt-get update

# Install necessary packages to build extensions
RUN apt-get install --no-install-recommends -y \
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
    xmlsec1 \
    python3-setuptools  

# Fetch and build the custom CKAN extensions
RUN pip wheel --wheel-dir=/wheels git+${HARVEST_GIT_URL}@${HARVEST_GIT_BRANCH}#egg=ckanext-harvest
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/ckan/ckanext-harvest/${HARVEST_GIT_BRANCH}/pip-requirements.txt
RUN curl -o /wheels/harvest.txt https://raw.githubusercontent.com/ckan/ckanext-harvest/${HARVEST_GIT_BRANCH}/pip-requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${PAGES_GIT_URL}@${PAGES_GIT_BRANCH}#egg=ckanext-pages
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/ckan/ckanext-pages/${PAGES_GIT_BRANCH}/requirements.txt
RUN curl -o /wheels/pages.txt https://raw.githubusercontent.com/ckan/ckanext-pages/${PAGES_GIT_BRANCH}/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${SHOWCASE_GIT_URL}@${SHOWCASE_GIT_BRANCH}#egg=ckanext-showcase
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/ckan/ckanext-showcase/${SHOWCASE_GIT_BRANCH}/requirements.txt
RUN curl -o /wheels/showcase.txt https://raw.githubusercontent.com/ckan/ckanext-showcase/${SHOWCASE_GIT_BRANCH}/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${OFFICEDOCS_GIT_URL}@${OFFICEDOCS_GIT_BRANCH}#egg=ckanext-officedocs
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-officedocs/${OFFICEDOCS_GIT_BRANCH}/requirements.txt
RUN curl -o /wheels/officedocs.txt https://raw.githubusercontent.com/apteksdi/ckanext-officedocs/${OFFICEDOCS_GIT_BRANCH}/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${SPATIAL_GIT_URL}@${SPATIAL_GIT_BRANCH}#egg=ckanext-spatial
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/ckan/ckanext-spatial/${SPATIAL_GIT_BRANCH}/requirements.txt
RUN curl -o /wheels/spatial.txt https://raw.githubusercontent.com/ckan/ckanext-spatial/${SPATIAL_GIT_BRANCH}/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${GEOVIEW_GIT_URL}@${GEOVIEW_GIT_BRANCH}#egg=ckanext-geoview
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/ckan/ckanext-geoview/${GEOVIEW_GIT_BRANCH}/pip-requirements.txt
RUN curl -o /wheels/geoview.txt https://raw.githubusercontent.com/ckan/ckanext-geoview/${GEOVIEW_GIT_BRANCH}/pip-requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${DATAJSON_GIT_URL}@${DATAJSON_GIT_BRANCH}#egg=ckanext-datajson
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/GSA/ckanext-datajson/${DATAJSON_GIT_BRANCH}/requirements.txt
RUN curl -o /wheels/datajson.txt https://raw.githubusercontent.com/GSA/ckanext-datajson/${DATAJSON_GIT_BRANCH}/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${DCAT_GIT_URL}@${DCAT_GIT_BRANCH}#egg=ckanext-dcat
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-dcat/${DCAT_GIT_BRANCH}/requirements.txt
RUN curl -o /wheels/dcat.txt https://raw.githubusercontent.com/apteksdi/ckanext-dcat/${DCAT_GIT_BRANCH}/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${HIERARCHY_GIT_URL}@${HIERARCHY_GIT_BRANCH}#egg=ckanext-hierarchy
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/ckan/ckanext-hierarchy/master/requirements.txt
RUN curl -o /wheels/hierarchy.txt https://raw.githubusercontent.com/ckan/ckanext-hierarchy/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${SCHEMING_GIT_URL}@${SCHEMING_GIT_BRANCH}#egg=ckanext-scheming
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-scheming/master/requirements.txt
RUN curl -o /wheels/scheming.txt https://raw.githubusercontent.com/apteksdi/ckanext-scheming/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${TYPEDPACKAGE_GIT_URL}@${TYPEDPACKAGE_GIT_BRANCH}#egg=ckanext-create_typed_package
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-create_typed_package/master/requirements.txt
RUN curl -o /wheels/typedpackage.txt https://raw.githubusercontent.com/apteksdi/ckanext-create_typed_package/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${SDI_GIT_URL}@${SDI_GIT_BRANCH}#egg=ckanext-sdi
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-sdi/master/requirements.txt
RUN curl -o /wheels/sdi.txt https://raw.githubusercontent.com/apteksdi/ckanext-sdi/master/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${RESOURCEDICTIONARY_GIT_URL}@${RESOURCEDICTIONARY_GIT_BRANCH}#egg=ckanext-resourcedictionary
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/keitaroinc/ckanext-resourcedictionary/main/requirements.txt
RUN curl -o /wheels/resourcedictionary.txt https://raw.githubusercontent.com/keitaroinc/ckanext-resourcedictionary/main/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${OAIPMH_GIT_URL}@${OAIPMH_GIT_BRANCH}#egg=ckanext-oaipmh
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-oaipmh/master/requirements.txt
RUN curl -o /wheels/oaipmh.txt https://raw.githubusercontent.com/apteksdi/ckanext-oaipmh/master/requirements.txt

USER ckan

############
### MAIN ###
############
FROM ghcr.io/keitaroinc/ckan:2.9.5-focal

LABEL maintainer="Keitaro Inc <info@keitaro.com>"

#ENV CKAN_ROOT_PATH /data/{{LANG}}/
ENV CKAN__PLUGINS envvars stats image_view text_view recline_view resource_proxy saml2auth sdi geo_view harvest ckan_harvester csw_harvester spatial_metadata spatial_query scheming_datasets create_typed_package pdf_view officedocs_view geojson_view shp_view wmts_view datatables_view resourcedictionary datastore datapusher pages showcase waf_harvester doc_harvester dcat datajson_harvest dcat_rdf_harvester dcat_json_harvester dcat_json_interface structured_data oaipmh_harvester
ENV CKANEXT__PAGES__ALLOW_HTML True
ENV CKANEXT__PAGES__EDITOR ckeditor
ENV CKANEXT__SHOWCASE__EDITOR ckeditor
ENV CKAN__AUTH__CREATE_USER_VIA_API false
ENV CKAN__AUTH__CREATE_USER_VIA_web false
ENV CKAN__AUTH__PUBLIC_USER_DETAILS false
ENV CKAN__AUTH__PUBLIC_ACTIVITY_STREAM_DETAIL false
ENV CKANEXT__SPATIAL__SEARCH_BACKEND solr
ENV CKANEXT__SPATIAL__HARVEST__CONTINUE_ON_VALIDATION_ERRORS true
ENV CKANEXT__SPATIAL__COMMON_MAP__TYPE custom
ENV CKANEXT__SPATIAL__COMMON_MAP__CUSTOM__URL https://geoservices.big.go.id/rbi/rest/services/BASEMAP/Rupabumi_Indonesia/MapServer/WMTS/tile/1.0.0/BASEMAP_Rupabumi_Indonesia/default/default028mm/{z}/{y}/{x}.png
ENV CKANEXT__SPATIAL__COMMON_MAP__ATTRIBUTION Map tiles by <a href="https://www.big.go.id">Badan Informasi Geospasial</a>.
ENV CKANEXT__GEOVIEW__OL_VIEWER__FORMATS wms wfs geojson gml kml arcgis_rest gft

# Switch to the root user
USER root

COPY --from=extbuild /wheels /srv/app/ext_wheels

# Install and enable the custom extensions
RUN pip install auth && \
    pip install iso-639 \
    pip install first \
    pip install pyOpenSSL \
    pip install pylons && \
    pip install actions && \
    pip install constants && \
    pip install helpers && \
    pip install ckanext-pdfview && \
    pip install ckanext-datarequests && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-harvest && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/harvest.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-pages && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/pages.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-showcase && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/showcase.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-officedocs && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/officedocs.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-spatial && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/spatial.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-geoview && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/geoview.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-datajson && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/datajson.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-dcat && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/dcat.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-hierarchy && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/hierarchy.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-scheming && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/scheming.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-create_typed_package && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/typedpackage.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-sdi && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/sdi.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-resourcedictionary && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/resourcedictionary.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-oaipmh && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/oaipmh.txt && \
    # Configure plugins
    ckan config-tool "${APP_DIR}/production.ini" "ckan.plugins = ${CKAN__PLUGINS}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.pages.allow_html = ${CKANEXT__PAGES__ALLOW_HTML}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.pages.editor = ${CKANEXT__PAGES__EDITOR}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.showcase.editor = ${CKANEXT__SHOWCASE__EDITOR}" && \
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
    chown -R ckan:ckan /srv/app

# Remove wheels
RUN rm -rf /srv/app/ext_wheels

# Add harvest afterinit script
COPY ./afterinit.d/00_harvest.sh ${APP_DIR}/docker-afterinit.d/00_harvest.sh

# Switch to the ckan user
USER ckan
