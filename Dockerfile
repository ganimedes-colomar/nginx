################################################################################
#	Copyright (C) 2020        Sebastian Francisco Colomar Bauza
#	Copyright (C) 2020        Alejandro Colomar Andres
#	SPDX-License-Identifier:  GPL-2.0-only
################################################################################


################################################################################
FROM	"nginx:1.19.8-alpine"	AS nginx
################################################################################
RUN									\
	apk list							\
	|grep 'nginx'							\
	|cut -f1							\
	|sed 's/-[0-9].*//'						\
	|sort								\
	|uniq								\
	|grep -v '^nginx$'						\
	|while read -r pkg; do						\
		apk del ${pkg};						\
	done;

################################################################################
RUN	rm -frv	/etc/nginx/conf.d/default.conf;
################################################################################
VOLUME									\
	/var/cache/nginx						\
	/var/run

################################################################################
