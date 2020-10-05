Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB233283693
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Oct 2020 15:31:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 98F073C4B4D
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Oct 2020 15:31:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 818E83C2826
 for <ltp@lists.linux.it>; Mon,  5 Oct 2020 15:30:38 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 342B86009E6
 for <ltp@lists.linux.it>; Mon,  5 Oct 2020 15:30:38 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D2C78ACD8;
 Mon,  5 Oct 2020 13:30:37 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  5 Oct 2020 15:30:52 +0200
Message-Id: <20201005133054.23587-10-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201005133054.23587-1-chrubis@suse.cz>
References: <20201005133054.23587-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 09/11] travis: Install docparse dependencies
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

From: Petr Vorel <pvorel@suse.cz>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 travis/alpine.sh         |  3 +++
 travis/debian.minimal.sh |  8 +++++++-
 travis/debian.sh         |  9 ++++++++-
 travis/fedora.sh         | 11 ++++++++---
 travis/tumbleweed.sh     |  8 +++++++-
 5 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/travis/alpine.sh b/travis/alpine.sh
index f8960bed0..b793a9fbe 100755
--- a/travis/alpine.sh
+++ b/travis/alpine.sh
@@ -6,6 +6,8 @@ apk update
 
 apk add \
 	acl-dev \
+	asciidoc \
+	asciidoctor \
 	autoconf \
 	automake \
 	clang \
@@ -23,6 +25,7 @@ apk add \
 	musl-dev \
 	numactl-dev \
 	openssl-dev \
+	perl-json \
 	pkgconfig
 
 cat /etc/os-release
diff --git a/travis/debian.minimal.sh b/travis/debian.minimal.sh
index 3f1941969..5e6ba8662 100755
--- a/travis/debian.minimal.sh
+++ b/travis/debian.minimal.sh
@@ -2,7 +2,11 @@
 # Copyright (c) 2018-2020 Petr Vorel <pvorel@suse.cz>
 set -ex
 
-apt remove -y \
+apt="apt remove -y"
+
+$apt \
+	asciidoc \
+	asciidoctor \
 	libacl1-dev \
 	libaio-dev \
 	libaio1 \
@@ -17,3 +21,5 @@ apt remove -y \
 	libsepol1-dev \
 	libssl-dev \
 	libtirpc-dev
+
+$apt asciidoc-base ruby-asciidoctor || true
diff --git a/travis/debian.sh b/travis/debian.sh
index 28685f4d3..743b79001 100755
--- a/travis/debian.sh
+++ b/travis/debian.sh
@@ -8,8 +8,12 @@ grep -v oldstable-updates /etc/apt/sources.list > /tmp/sources.list && mv /tmp/s
 
 apt update
 
-apt install -y --no-install-recommends \
+apt="apt install -y --no-install-recommends"
+
+$apt \
 	acl-dev \
+	asciidoc \
+	asciidoctor \
 	autoconf \
 	automake \
 	build-essential \
@@ -26,6 +30,7 @@ apt install -y --no-install-recommends \
 	libcap2 \
 	libc6 \
 	libc6-dev \
+	libjson-perl \
 	libkeyutils-dev \
 	libkeyutils1 \
 	libmm-dev \
@@ -40,4 +45,6 @@ apt install -y --no-install-recommends \
 	lsb-release \
 	pkg-config
 
+$apt ruby-asciidoctor-pdf || true
+
 df -hT
diff --git a/travis/fedora.sh b/travis/fedora.sh
index 3c224f71e..6127d367d 100755
--- a/travis/fedora.sh
+++ b/travis/fedora.sh
@@ -2,7 +2,10 @@
 # Copyright (c) 2018-2020 Petr Vorel <pvorel@suse.cz>
 set -ex
 
-yum -y install \
+yum="yum -y install"
+
+$yum \
+	asciidoc \
 	autoconf \
 	automake \
 	make \
@@ -12,8 +15,10 @@ yum -y install \
 	findutils \
 	libtirpc \
 	libtirpc-devel \
+	perl-JSON \
 	pkg-config \
 	redhat-lsb-core
 
-# CentOS 8 doesn't have libmnl-devel
-yum -y install libmnl-devel || yum -y install libmnl
+# CentOS 8 fixes
+$yum libmnl-devel || $yum libmnl
+$yum rubygem-asciidoctor || true
diff --git a/travis/tumbleweed.sh b/travis/tumbleweed.sh
index 6247daa98..43ca3252a 100755
--- a/travis/tumbleweed.sh
+++ b/travis/tumbleweed.sh
@@ -2,7 +2,10 @@
 # Copyright (c) 2018-2020 Petr Vorel <pvorel@suse.cz>
 set -ex
 
-zypper --non-interactive install --force-resolution --no-recommends \
+zyp="zypper --non-interactive install --force-resolution --no-recommends"
+
+$zyp \
+	asciidoc \
 	autoconf \
 	automake \
 	clang \
@@ -23,4 +26,7 @@ zypper --non-interactive install --force-resolution --no-recommends \
 	libtirpc-devel \
 	linux-glibc-devel \
 	lsb-release \
+	perl-JSON \
 	pkg-config
+
+$zyp ruby2.7-rubygem-asciidoctor || $zyp ruby2.5-rubygem-asciidoctor
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
