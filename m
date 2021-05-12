Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEECE37CB5C
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 18:57:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A0F33C8AE6
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 18:57:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2F0C23C7349
 for <ltp@lists.linux.it>; Wed, 12 May 2021 18:57:19 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9EC15200C23
 for <ltp@lists.linux.it>; Wed, 12 May 2021 18:57:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BE68DB148
 for <ltp@lists.linux.it>; Wed, 12 May 2021 16:57:17 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 12 May 2021 18:57:02 +0200
Message-Id: <20210512165702.22883-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210512165702.22883-1-pvorel@suse.cz>
References: <20210512165702.22883-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] travis: Enhance docparse testing
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Specify various asciidoc and asciidoctor configure setup,
including PDF. Used in native builds only.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Tested:
https://travis-ci.org/github/pevik/ltp/builds/770919150

A proof it finds a bug introduced in 04a7608fe and reverted in c0b511d93:
https://travis-ci.org/github/pevik/ltp/jobs/770919265

Kind regards,
Petr

 .travis.yml | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index ef996889a..5d759dab4 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -1,4 +1,4 @@
-# Copyright (c) 2017-2020 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) 2017-2021 Petr Vorel <pvorel@suse.cz>
 
 dist: bionic
 sudo: required
@@ -30,7 +30,7 @@ matrix:
         - os: linux
           # Message: WARNING: xsltproc: cannot process http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl
           # doc/meson.build:70:1: ERROR: Problem encountered: Docs cannot be built: xsltproc does not work correctly
-          env: DISTRO=alpine:latest
+          env: DISTRO=alpine:latest METADATA=asciidoctor
           compiler: gcc
 
         # build with minimal dependencies
@@ -40,47 +40,47 @@ matrix:
 
         # other builds
         - os: linux
-          env: DISTRO=fedora:latest MAKE_INSTALL=1 CONTAINER=podman
+          env: DISTRO=fedora:latest MAKE_INSTALL=1 CONTAINER=podman METADATA=asciidoctor-pdf
           compiler: clang
 
         - os: linux
-          env: DISTRO=centos:7 TREE=out
+          env: DISTRO=centos:7 TREE=out METADATA=asciidoc-pdf
           compiler: gcc
 
         - os: linux
-          env: DISTRO=debian:testing
+          env: DISTRO=debian:testing METADATA=asciidoctor-pdf
           compiler: gcc
 
         - os: linux
-          env: DISTRO=debian:oldstable
+          env: DISTRO=debian:oldstable METADATA=asciidoc-pdf
           compiler: clang
 
         - os: linux
-          env: DISTRO=opensuse/tumbleweed CONTAINER=podman
+          env: DISTRO=opensuse/tumbleweed CONTAINER=podman METADATA=asciidoctor
           compiler: gcc
 
         - os: linux
-          env: DISTRO=opensuse/leap
+          env: DISTRO=opensuse/leap METADATA=asciidoc-pdf
           compiler: gcc
 
         - os: linux
-          env: DISTRO=debian:oldstable
+          env: DISTRO=debian:oldstable METADATA=asciidoctor
           compiler: gcc
 
         - os: linux
-          env: DISTRO=debian:testing
+          env: DISTRO=debian:testing METADATA=asciidoc-pdf
           compiler: clang
 
         - os: linux
-          env: DISTRO=ubuntu:groovy TREE=out
+          env: DISTRO=ubuntu:groovy TREE=out METADATA=asciidoctor
           compiler: gcc
 
         - os: linux
-          env: DISTRO=ubuntu:xenial
+          env: DISTRO=ubuntu:xenial METADATA=asciidoc-pdf
           compiler: gcc
 
         - os: linux
-          env: DISTRO=centos:latest
+          env: DISTRO=centos:latest METADATA=asciidoctor
           compiler: gcc
 
 before_install:
@@ -123,6 +123,9 @@ script:
     - INSTALL="${DISTRO%%:*}"
     - INSTALL="${INSTALL%%/*}"
     - if [ "$MAKE_INSTALL" = 1 ]; then INSTALL_OPT="-i"; fi
+    - if [ "$METADATA" = "asciidoc-pdf" ]; then CONFIGURE_OPT_EXTRA="--with-metadata-generator=asciidoc --enable-metadata-pdf"; fi
+    - if [ "$METADATA" = "asciidoctor" ]; then CONFIGURE_OPT_EXTRA="--with-metadata-generator=asciidoctor"; fi
+    - if [ "$METADATA" = "asciidoctor-pdf" ]; then CONFIGURE_OPT_EXTRA="--with-metadata-generator=asciidoctor --enable-metadata-pdf"; fi
     - if [ ! "$TREE" ]; then TREE="in"; fi
     - case $VARIANT in cross-compile*) BUILD="cross";; i386) BUILD="32";; *) BUILD="native";; esac
-    - $CONTAINER run $CONTAINER_ARGS -t ltp /bin/sh -c "cd travis && ./$INSTALL.sh && if [ \"$VARIANT\" ]; then ARCH=\"$ARCH\" ./$INSTALL.$VARIANT.sh; fi && ../build.sh -o $TREE -t $BUILD -c $CC $INSTALL_OPT"
+    - $CONTAINER run $CONTAINER_ARGS -t ltp /bin/sh -c "cd travis && ./$INSTALL.sh && if [ \"$VARIANT\" ]; then ARCH=\"$ARCH\" ./$INSTALL.$VARIANT.sh; fi && CONFIGURE_OPT_EXTRA=\"$CONFIGURE_OPT_EXTRA\" ../build.sh -o $TREE -t $BUILD -c $CC $INSTALL_OPT"
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
