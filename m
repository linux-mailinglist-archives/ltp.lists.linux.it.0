Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F3308329556
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 00:45:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 549AA3C7EF3
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 00:45:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 664CE3C4EEC
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 00:45:33 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 24CCB600A1D
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 00:45:31 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E6C22AF77
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 23:45:30 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  2 Mar 2021 00:45:23 +0100
Message-Id: <20210301234523.20341-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] travis: Reenable openSUSE Tumbleweed
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
Cc: Fabian Vogt <fvogt@suse.de>,
 =?UTF-8?q?Ladislav=20Slez=C3=A1k?= <lslezak@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

openSUSE Tumbleweed was temporarily removed in fbd46736d due
faccessat2() incompatibility in libseccomp/runc used in old docker with
old kernel on Ubuntu Focal on hosts in Travis CI together with guests
with the newest glibc 2.33.

Fixing Tumbleweed required switch to podman and downloading newest runc
release (v1.0.0-rc93) which contains the fix [1], because proposed glibc
fix [2] aren't going to merged to upstream [3] nor to Tumbleweed
downstream glibc [4].

Sooner or later it will be required for more distros (Fedora, Debian
Ubuntu), but don't waste time before required.

[1] https://github.com/opencontainers/runc/pull/2750
[2] https://sourceware.org/pipermail/libc-alpha/2020-November/119955.html
[3] https://sourceware.org/pipermail/libc-alpha/2020-November/119978.html
[4] https://bugzilla.opensuse.org/1182451

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .travis.yml | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 8791e843a..68f919daf 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -55,6 +55,10 @@ matrix:
           env: DISTRO=debian:oldstable
           compiler: clang
 
+        - os: linux
+          env: DISTRO=opensuse/tumbleweed
+          compiler: gcc
+
         - os: linux
           env: DISTRO=opensuse/leap
           compiler: gcc
@@ -80,7 +84,22 @@ matrix:
           compiler: gcc
 
 before_install:
-    - df -hT
+    # Tumbleweed requires podman and newest runc due docker incompatible with glibc 2.33 (faccessat2)
+    - >
+        if [ "${DISTRO//*\/}" = "tumbleweed" ]; then
+            # podman
+            . /etc/os-release
+            sudo sh -c "echo 'deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /' > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list"
+            wget -nv https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/xUbuntu_${VERSION_ID}/Release.key -O- | sudo apt-key add -
+            sudo apt update
+            sudo apt -y install podman
+            alias docker=podman
+
+            # runc
+            sudo curl -L https://github.com/opencontainers/runc/releases/download/v1.0.0-rc93/runc.amd64 -o /usr/bin/runc
+            sudo chmod +x /usr/bin/runc
+        fi
+
     # pull rate limit workaround
     - tmpdaemon=$(mktemp)
     - sudo jq '."registry-mirrors" += ["https://mirror.gcr.io"]' /etc/docker/daemon.json > $tmpdaemon
@@ -88,11 +107,12 @@ before_install:
     - sudo systemctl daemon-reload
     - sudo systemctl restart docker
     - docker system info
+
     # ltp
     - DIR="/usr/src/ltp"
     - printf "FROM $DISTRO\nRUN mkdir -p $DIR\nWORKDIR $DIR\nCOPY . $DIR\n" > Dockerfile
     - cat Dockerfile
-    - docker build -t ltp .
+    - docker --runtime=/usr/bin/runc build -t ltp .
 
 script:
     - INSTALL="${DISTRO%%:*}"
@@ -100,4 +120,4 @@ script:
     - if [ "$MAKE_INSTALL" = 1 ]; then INSTALL_OPT="-i"; fi
     - if [ ! "$TREE" ]; then TREE="in"; fi
     - case $VARIANT in cross-compile*) BUILD="cross";; i386) BUILD="32";; *) BUILD="native";; esac
-    - docker run -t ltp /bin/sh -c "cd travis && ./$INSTALL.sh && if [ \"$VARIANT\" ]; then ARCH=\"$ARCH\" ./$INSTALL.$VARIANT.sh; fi && ../build.sh -o $TREE -t $BUILD -c $CC $INSTALL_OPT"
+    - docker --runtime=/usr/bin/runc run -t ltp /bin/sh -c "cd travis && ./$INSTALL.sh && if [ \"$VARIANT\" ]; then ARCH=\"$ARCH\" ./$INSTALL.$VARIANT.sh; fi && ../build.sh -o $TREE -t $BUILD -c $CC $INSTALL_OPT"
-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
