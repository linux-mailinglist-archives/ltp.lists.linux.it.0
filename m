Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE943100311
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 11:57:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B88B3C1841
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 11:57:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id BE9803C13DC
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 11:57:54 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 59F2010019D2
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 11:57:53 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7F81FB01E
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 10:57:52 +0000 (UTC)
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: Petr Vorel <pvorel@suse.cz>,
	ltp@lists.linux.it
Date: Mon, 18 Nov 2019 11:57:35 +0100
Message-Id: <20191118105735.15012-1-cfamullaconrad@suse.de>
X-Mailer: git-send-email 2.16.4
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v1] travis: add ppc64le and s390x builds (issue: #615)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Travis started to support ppc64le and s390x
https://blog.travis-ci.com/2019-11-12-multi-cpu-architecture-ibm-power-ibm-z

This patch enable ppc64le and s390x build on debian:stable.

Remove `-i` switch from docker command as it isn't needed and caused
trouble running docker 'The input device is not a tty'.

Signed-off-by: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
---
 .travis.yml | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index b16a3872a..be1504b92 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -65,6 +65,16 @@ matrix:
           env: DISTRO=centos:latest
           compiler: gcc
 
+        - os: linux
+          arch: ppc64le
+          compiler: gcc
+          env: DISTRO=debian:stable
+
+        - os: linux
+          arch: s390x
+          compiler: gcc
+          env: DISTRO=debian:stable
+
 before_install:
     - DIR="/usr/src/ltp"
     - printf "FROM $DISTRO\nRUN mkdir -p $DIR\nWORKDIR $DIR\nCOPY . $DIR\n" > Dockerfile
@@ -76,4 +86,4 @@ script:
     - INSTALL="${INSTALL%%/*}"
     - if [ ! "$TREE" ]; then TREE="in"; fi
     - case $VARIANT in cross-compile*) BUILD="cross";; i386) BUILD="32";; *) BUILD="native";; esac
-    - docker run -it ltp /bin/sh -c "cd travis && ./$INSTALL.sh && if [ \"$VARIANT\" ]; then ./$INSTALL.$VARIANT.sh; fi && ../build.sh -o $TREE -t $BUILD -c $CC"
+    - docker run -t ltp /bin/sh -c "cd travis && ./$INSTALL.sh && if [ \"$VARIANT\" ]; then ./$INSTALL.$VARIANT.sh; fi && ../build.sh -o $TREE -t $BUILD -c $CC"
-- 
2.16.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
