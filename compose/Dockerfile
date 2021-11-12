###################
### Extensions ####
###################
FROM ghcr.io/apteksdi/ckan:2.9.4-focal as extbuild

# Locations and tags, please use specific tags or revisions

ENV PAGES_GIT_URL=https://github.com/ckan/ckanext-pages.git
ENV PAGES_GIT_BRANCH=master
ENV OFFICEDOCS_GIT_URL=https://github.com/apteksdi/ckanext-officedocs.git
ENV OFFICEDOCS_GIT_BRANCH=master
ENV RESOURCEDICTIONARY_GIT_URL=https://github.com/keitaroinc/ckanext-resourcedictionary.git
ENV RESOURCEDICTIONARY_GIT_BRANCH=main

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
        python3-setuptools

# Fetch and build the custom CKAN extensions
RUN pip wheel --wheel-dir=/wheels git+${PAGES_GIT_URL}@${PAGES_GIT_BRANCH}#egg=ckanext-pages
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/ckan/ckanext-pages/${PAGES_GIT_BRANCH}/requirements.txt
RUN curl -o /wheels/pages.txt https://raw.githubusercontent.com/ckan/ckanext-pages/${PAGES_GIT_BRANCH}/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${OFFICEDOCS_GIT_URL}@${OFFICEDOCS_GIT_BRANCH}#egg=ckanext-officedocs
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/apteksdi/ckanext-officedocs/${OFFICEDOCS_GIT_BRANCH}/requirements.txt
RUN curl -o /wheels/officedocs.txt https://raw.githubusercontent.com/apteksdi/ckanext-officedocs/${OFFICEDOCS_GIT_BRANCH}/requirements.txt

RUN pip wheel --wheel-dir=/wheels git+${RESOURCEDICTIONARY_GIT_URL}@${RESOURCEDICTIONARY_GIT_BRANCH}#egg=ckanext-resourcedictionary
RUN pip wheel --wheel-dir=/wheels -r https://raw.githubusercontent.com/keitaroinc/ckanext-resourcedictionary/main/requirements.txt
RUN curl -o /wheels/resourcedictionary.txt https://raw.githubusercontent.com/keitaroinc/ckanext-resourcedictionary/main/requirements.txt

USER ckan

############
### MAIN ###
############
FROM ghcr.io/apteksdi/ckan:2.9.4-focal

LABEL maintainer="Imam Arif Rahman <imam.rahman@support.bappenas.go.id>"

ENV CKAN__PLUGINS envvars stats image_view text_view recline_view resource_proxy pdf_view resourcedictionary datastore datapusher pages officedocs_view datatables_view 

ENV CKANEXT__PAGES__ALLOW_HTML True
ENV CKANEXT__PAGES__EDITOR ckeditor

# Switch to the root user
USER root

COPY --from=extbuild /wheels /srv/app/ext_wheels

# Install and enable the custom extensions
RUN pip install auth && \
    pip install pylons && \
    pip install actions && \
    pip install constants && \
    pip install helpers && \
    pip install ckanext-pdfview && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-pages && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/pages.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-officedocs && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/officedocs.txt && \
    pip install --no-index --find-links=/srv/app/ext_wheels ckanext-resourcedictionary && \
    pip install --no-index --find-links=/srv/app/ext_wheels -r /srv/app/ext_wheels/resourcedictionary.txt && \
    # Configure plugins
    ckan config-tool "${APP_DIR}/production.ini" "ckan.plugins = ${CKAN__PLUGINS}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.pages.allow_html = ${CKANEXT__PAGES__ALLOW_HTML}" && \
    ckan config-tool "${APP_DIR}/production.ini" "ckanext.pages.editor = ${CKANEXT__PAGES__EDITOR}" && \
    chown -R ckan:ckan /srv/app

# Remove wheels
RUN rm -rf /srv/app/ext_wheels

# Switch to the ckan user
USER ckan