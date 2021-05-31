Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D1C3965F1
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 18:51:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 926EB3C90B8
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 18:51:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5A5D33C2A0E
 for <ltp@lists.linux.it>; Mon, 31 May 2021 18:51:02 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 29AF96005C6
 for <ltp@lists.linux.it>; Mon, 31 May 2021 18:51:01 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CAFED1FD39;
 Mon, 31 May 2021 16:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622479860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4eaJdHPncf1LqZWBuCtj0sCx5/2cB6fJfpWK3j4icV8=;
 b=rhfOxvKhxB82UvXiMq1mGRUOsiCIwf2PNl/P5K2Z+4gDiBVFuqak3zULh28sl3pee2gbt+
 RGehCxoDI4CrrnZos7SrXwpqZzpI5DVtG1DOAtNoOyV+6xktsOSiugsOdztcA3F4rTBlvf
 aSJBG4UvNDt1lT8e+fqyLhHUtU1AXx4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622479860;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4eaJdHPncf1LqZWBuCtj0sCx5/2cB6fJfpWK3j4icV8=;
 b=jom8oMYns8GwEoxr8hPV2Nih4gLiQqHt8073DGdzANfj807Bjdd7XLrXYyMoXndHgiKpcR
 zZGT+eYa7W9lvRBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 194B7118DD;
 Mon, 31 May 2021 16:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622479860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4eaJdHPncf1LqZWBuCtj0sCx5/2cB6fJfpWK3j4icV8=;
 b=rhfOxvKhxB82UvXiMq1mGRUOsiCIwf2PNl/P5K2Z+4gDiBVFuqak3zULh28sl3pee2gbt+
 RGehCxoDI4CrrnZos7SrXwpqZzpI5DVtG1DOAtNoOyV+6xktsOSiugsOdztcA3F4rTBlvf
 aSJBG4UvNDt1lT8e+fqyLhHUtU1AXx4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622479860;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4eaJdHPncf1LqZWBuCtj0sCx5/2cB6fJfpWK3j4icV8=;
 b=jom8oMYns8GwEoxr8hPV2Nih4gLiQqHt8073DGdzANfj807Bjdd7XLrXYyMoXndHgiKpcR
 zZGT+eYa7W9lvRBA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 8MMjBfQTtWBISQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 31 May 2021 16:51:00 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 31 May 2021 18:50:52 +0200
Message-Id: <20210531165052.8731-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210531165052.8731-1-pvorel@suse.cz>
References: <20210531165052.8731-1-pvorel@suse.cz>
MIME-Version: 1.0
Authentication-Results: imap.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.00
X-Spamd-Result: default: False [0.00 / 100.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 REPLY(-4.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCPT_COUNT_SEVEN(0.00)[7];
 MID_CONTAINS_FROM(1.00)[]; RCVD_NO_TLS_LAST(0.10)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_TWO(0.00)[2]
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] CI: Move from Travis to GitHub Actions
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Travis is unreliable due "pull rate limit" issue.

Also using GitHub native CI allows more advanced features
(e.g. update wiki with doc/*.txt, nightly build docparser doc).

Nice bonus is that manual podman activation for distros using glibc >=
2.33 (e.g. openSUSE Tumbleweed, Fedora) it's not needed in GitHub.

Fixes: https://github.com/linux-test-project/ltp/issues/761

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Tested:

https://github.com/pevik/ltp/actions/runs/893331703

 .github/workflows/ci.yml | 154 +++++++++++++++++++++++++++++++++++++++
 .travis.yml              | 131 ---------------------------------
 build.sh                 |   7 --
 3 files changed, 154 insertions(+), 138 deletions(-)
 create mode 100644 .github/workflows/ci.yml
 delete mode 100644 .travis.yml

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
new file mode 100644
index 000000000..c74b4349a
--- /dev/null
+++ b/.github/workflows/ci.yml
@@ -0,0 +1,154 @@
+name: "CI: docker based builds"
+on: [push, pull_request]
+
+jobs:
+  job:
+    runs-on: ubuntu-latest
+
+    strategy:
+      fail-fast: false
+      matrix:
+        include:
+          # 32bit build
+          - container: "debian:stable"
+            env:
+              CC: gcc
+              VARIANT: i386
+
+          # cross compilation builds
+          - container: "debian:stable"
+            env:
+              ARCH: ppc64el
+              CC: powerpc64le-linux-gnu-gcc
+              MAKE_INSTALL: 1
+              TREE: out
+              VARIANT: cross-compile
+
+          - container: "debian:stable"
+            env:
+              ARCH: arm64
+              CC: aarch64-linux-gnu-gcc
+              MAKE_INSTALL: 1
+              TREE: out
+              VARIANT: cross-compile
+
+          - container: "debian:stable"
+            env:
+              ARCH: s390x
+              CC: s390x-linux-gnu-gcc
+              MAKE_INSTALL: 1
+              TREE: out
+              VARIANT: cross-compile
+
+          # musl (native)
+          - container: "alpine:latest"
+            env:
+              CC: gcc
+              METADATA: asciidoctor
+
+          # build with minimal dependencies
+          - container: "debian:stable"
+            env:
+              CC: clang
+              TREE: out
+              VARIANT: minimal
+
+          # other builds
+          - container: "fedora:latest"
+            env:
+              CC: clang
+              MAKE_INSTALL: 1
+              METADATA: asciidoctor-pdf
+
+          - container: "centos:7"
+            env:
+              CC: gcc
+              METADATA: asciidoc-pdf
+              TREE: out
+
+          - container: "debian:testing"
+            env:
+              CC: gcc
+              METADATA: asciidoctor-pdf
+
+          - container: "debian:oldstable"
+            env:
+              CC: clang
+              METADATA: asciidoc-pdf
+
+          - container: "opensuse/tumbleweed"
+            env:
+              CC: gcc
+              METADATA: asciidoctor
+
+          - container: "opensuse/leap"
+            env:
+              CC: gcc
+              METADATA: asciidoc-pdf
+
+          - container: "debian:oldstable"
+            env:
+              CC: gcc
+              METADATA: asciidoctor
+
+          - container: "debian:testing"
+            env:
+              CC: clang
+              METADATA: asciidoc-pdf
+
+          - container: "ubuntu:groovy"
+            env:
+              CC: gcc
+              METADATA: asciidoctor
+              TREE: out
+
+          - container: "ubuntu:xenial"
+            env:
+              CC: gcc
+              METADATA: asciidoc-pdf
+
+          - container: "centos:latest"
+            env:
+              CC: gcc
+              METADATA: asciidoctor
+
+    container:
+      image: ${{ matrix.container }}
+      env: ${{ matrix.env }}
+
+    steps:
+    - name: Show OS
+      run: cat /etc/os-release
+
+    - name: Git checkout
+      uses: actions/checkout@v1
+
+    - name: Install additional packages
+      run: |
+        INSTALL=${{ matrix.container }}
+        INSTALL="${INSTALL%%:*}"
+        INSTALL="${INSTALL%%/*}"
+        ./ci/$INSTALL.sh
+        if [ "$VARIANT" ]; then ./ci/$INSTALL.$VARIANT.sh; fi
+
+    - name: ver_linux
+      run: ./ver_linux
+
+    - name: Autotools
+      run: ./build.sh -r autotools
+
+    - name: Configure
+      run: |
+        if [ "$METADATA" = "asciidoc-pdf" ]; then CONFIGURE_OPT_EXTRA="--with-metadata-generator=asciidoc --enable-metadata-pdf"; fi
+        if [ "$METADATA" = "asciidoctor" ]; then CONFIGURE_OPT_EXTRA="--with-metadata-generator=asciidoctor"; fi
+        if [ "$METADATA" = "asciidoctor-pdf" ]; then CONFIGURE_OPT_EXTRA="--with-metadata-generator=asciidoctor --enable-metadata-pdf"; fi
+        case "$VARIANT" in cross-compile*) BUILD="cross";; i386) BUILD="32";; *) BUILD="native";; esac
+        CONFIGURE_OPT_EXTRA="$CONFIGURE_OPT_EXTRA" ./build.sh -r configure -o ${TREE:-in} -t $BUILD -c $CC
+
+    - name: Compile
+      run: ./build.sh -r build -o ${TREE:-in}
+
+    - name: Install
+      run: |
+        if [ "$MAKE_INSTALL" = 1 ]; then INSTALL_OPT="-i"; fi
+        ./build.sh -r install -o ${TREE:-in} $INSTALL_OPT
diff --git a/.travis.yml b/.travis.yml
deleted file mode 100644
index d0c88da45..000000000
--- a/.travis.yml
+++ /dev/null
@@ -1,131 +0,0 @@
-# Copyright (c) 2017-2021 Petr Vorel <pvorel@suse.cz>
-
-dist: bionic
-sudo: required
-language: c
-services:
-    - docker
-
-matrix:
-    include:
-        # 32 bit build
-        - os: linux
-          env: DISTRO=debian:stable VARIANT=i386
-          compiler: gcc
-
-        # cross compilation builds
-        - os: linux
-          env: DISTRO=debian:stable VARIANT=cross-compile ARCH=ppc64el TREE=out MAKE_INSTALL=1
-          compiler: powerpc64le-linux-gnu-gcc
-
-        - os: linux
-          env: DISTRO=debian:stable VARIANT=cross-compile ARCH=arm64 TREE=out
-          compiler: aarch64-linux-gnu-gcc
-
-        - os: linux
-          env: DISTRO=debian:stable VARIANT=cross-compile ARCH=s390x TREE=out
-          compiler: s390x-linux-gnu-gcc
-
-        # musl (native)
-        - os: linux
-          # Message: WARNING: xsltproc: cannot process http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl
-          # doc/meson.build:70:1: ERROR: Problem encountered: Docs cannot be built: xsltproc does not work correctly
-          env: DISTRO=alpine:latest METADATA=asciidoctor
-          compiler: gcc
-
-        # build with minimal dependencies
-        - os: linux
-          env: DISTRO=debian:stable VARIANT=minimal TREE=out
-          compiler: clang
-
-        # other builds
-        - os: linux
-          env: DISTRO=fedora:latest MAKE_INSTALL=1 CONTAINER=podman METADATA=asciidoctor-pdf
-          compiler: clang
-
-        - os: linux
-          env: DISTRO=centos:7 TREE=out METADATA=asciidoc-pdf
-          compiler: gcc
-
-        - os: linux
-          env: DISTRO=debian:testing METADATA=asciidoctor-pdf
-          compiler: gcc
-
-        - os: linux
-          env: DISTRO=debian:oldstable METADATA=asciidoc-pdf
-          compiler: clang
-
-        - os: linux
-          env: DISTRO=opensuse/tumbleweed CONTAINER=podman METADATA=asciidoctor
-          compiler: gcc
-
-        - os: linux
-          env: DISTRO=opensuse/leap METADATA=asciidoc-pdf
-          compiler: gcc
-
-        - os: linux
-          env: DISTRO=debian:oldstable METADATA=asciidoctor
-          compiler: gcc
-
-        - os: linux
-          env: DISTRO=debian:testing METADATA=asciidoc-pdf
-          compiler: clang
-
-        - os: linux
-          env: DISTRO=ubuntu:groovy TREE=out METADATA=asciidoctor
-          compiler: gcc
-
-        - os: linux
-          env: DISTRO=ubuntu:xenial METADATA=asciidoc-pdf
-          compiler: gcc
-
-        - os: linux
-          env: DISTRO=centos:latest METADATA=asciidoctor
-          compiler: gcc
-
-before_install:
-    - CONTAINER="${CONTAINER:-docker}"
-    # distros with glibc >=2.33 require podman and newest runc due docker faccessat2 incompatibility
-    - >
-        if [ "$CONTAINER" = "podman" ]; then
-            # podman
-            CONTAINER_ARGS="--runtime=/usr/bin/runc"
-            . /etc/os-release
-            sudo sh -c "echo 'deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /' > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list"
-            wget -nv https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/xUbuntu_${VERSION_ID}/Release.key -O- | sudo apt-key add -
-            sudo apt update
-            sudo apt -y install podman slirp4netns
-
-            # runc
-            sudo curl -L https://github.com/opencontainers/runc/releases/download/v1.0.0-rc93/runc.amd64 -o /usr/bin/runc
-            sudo chmod +x /usr/bin/runc
-        fi
-
-    # Docker Hub pull rate limit workaround for docker
-    - >
-        if [ "$CONTAINER" = "docker" ]; then
-            conf="/etc/docker/daemon.json"
-            tmp=$(mktemp)
-            sudo jq '."registry-mirrors" += ["https://mirror.gcr.io"]' $conf > $tmp
-            sudo mv $tmp $conf
-            sudo systemctl daemon-reload
-            sudo systemctl restart docker
-        fi
-    - $CONTAINER info
-
-    # ltp
-    - DIR="/usr/src/ltp"
-    - printf "FROM $DISTRO\nRUN mkdir -p $DIR\nWORKDIR $DIR\nCOPY . $DIR\n" > Dockerfile
-    - cat Dockerfile
-    - $CONTAINER build $CONTAINER_ARGS -t ltp .
-
-script:
-    - INSTALL="${DISTRO%%:*}"
-    - INSTALL="${INSTALL%%/*}"
-    - if [ "$MAKE_INSTALL" = 1 ]; then INSTALL_OPT="-i"; fi
-    - if [ "$METADATA" = "asciidoc-pdf" ]; then CONFIGURE_OPT_EXTRA="--with-metadata-generator=asciidoc --enable-metadata-pdf"; fi
-    - if [ "$METADATA" = "asciidoctor" ]; then CONFIGURE_OPT_EXTRA="--with-metadata-generator=asciidoctor"; fi
-    - if [ "$METADATA" = "asciidoctor-pdf" ]; then CONFIGURE_OPT_EXTRA="--with-metadata-generator=asciidoctor --enable-metadata-pdf"; fi
-    - if [ ! "$TREE" ]; then TREE="in"; fi
-    - case $VARIANT in cross-compile*) BUILD="cross";; i386) BUILD="32";; *) BUILD="native";; esac
-    - $CONTAINER run $CONTAINER_ARGS -t ltp /bin/sh -c "cd ci && ./$INSTALL.sh && if [ \"$VARIANT\" ]; then ARCH=\"$ARCH\" ./$INSTALL.$VARIANT.sh; fi && CONFIGURE_OPT_EXTRA=\"$CONFIGURE_OPT_EXTRA\" ../build.sh -o $TREE -t $BUILD -c $CC $INSTALL_OPT"
diff --git a/build.sh b/build.sh
index b3b1eb962..f58a6dae8 100755
--- a/build.sh
+++ b/build.sh
@@ -210,13 +210,6 @@ done
 
 cd $SRC_DIR
 
-echo "=== ver_linux ==="
-./ver_linux
-echo
-
-echo "=== compiler version ==="
-$CC --version
-
 if [ -z "$run" -o "$run" = "autotools" ]; then
 	make autotools
 fi
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
