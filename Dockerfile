# A basic elasticsearch image
FROM docker.elastic.co/kibana/kibana:5.6.3

MAINTAINER Giorgi Mukhigulashvili

RUN bin/kibana-plugin remove x-pack



USER root
COPY commons.bundle.js /usr/share/kibana/optimize/bundles/commons.bundle.js
RUN chown kibana:kibana /usr/share/kibana/optimize/bundles/commons.bundle.js

COPY hide_empty_tools.js /usr/share/kibana/src/core_plugins/kibana/public/dev_tools/hacks/hide_empty_tools.js
RUN chown kibana:kibana /usr/share/kibana/src/core_plugins/kibana/public/dev_tools/hacks/hide_empty_tools.js

USER kibana

RUN ls -al /usr/share/kibana/optimize/bundles/