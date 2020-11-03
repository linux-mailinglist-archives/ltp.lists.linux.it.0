Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E862A4FCC
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 20:14:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5088E3C547F
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 20:14:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 5586B3C300B
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 20:13:42 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 8F09B6005DC
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 20:13:41 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5EE4BAEC4;
 Tue,  3 Nov 2020 19:13:41 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  3 Nov 2020 20:13:25 +0100
Message-Id: <20201103191327.11081-10-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201103191327.11081-1-pvorel@suse.cz>
References: <20201103191327.11081-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 09/11] travis: Install docparse dependencies
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
Cc: automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 travis/alpine.sh         |  3 +++
 travis/debian.minimal.sh |  8 +++++++-
 travis/debian.sh         |  9 ++++++++-
 travis/fedora.sh         | 12 +++++++++---
 travis/tumbleweed.sh     |  8 +++++++-
 5 files changed, 34 insertions(+), 6 deletions(-)

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
index 3c224f71e..665915a47 100755
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
@@ -12,8 +15,11 @@ yum -y install \
 	findutils \
 	libtirpc \
 	libtirpc-devel \
+	perl-JSON \
+	perl-libwww-perl \
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
2.29.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
