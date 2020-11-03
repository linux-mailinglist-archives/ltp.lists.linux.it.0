Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 806CB2A4FC2
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 20:14:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4CA023C5475
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 20:14:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9DDE13C3026
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 20:13:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 4D09F601238
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 20:13:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B123EAF26;
 Tue,  3 Nov 2020 19:13:39 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  3 Nov 2020 20:13:18 +0100
Message-Id: <20201103191327.11081-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201103191327.11081-1-pvorel@suse.cz>
References: <20201103191327.11081-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 02/11] travis: Add git
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

Needed in parse.sh script in next commit.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 travis/alpine.sh     | 1 +
 travis/debian.sh     | 1 +
 travis/fedora.sh     | 1 +
 travis/tumbleweed.sh | 1 +
 4 files changed, 4 insertions(+)

diff --git a/travis/alpine.sh b/travis/alpine.sh
index 61ef144a8..f8960bed0 100755
--- a/travis/alpine.sh
+++ b/travis/alpine.sh
@@ -10,6 +10,7 @@ apk add \
 	automake \
 	clang \
 	gcc \
+	git \
 	keyutils-dev \
 	libaio-dev \
 	libacl \
diff --git a/travis/debian.sh b/travis/debian.sh
index b759a9576..28685f4d3 100755
--- a/travis/debian.sh
+++ b/travis/debian.sh
@@ -17,6 +17,7 @@ apt install -y --no-install-recommends \
 	devscripts \
 	clang \
 	gcc \
+	git \
 	libacl1 \
 	libacl1-dev \
 	libaio-dev \
diff --git a/travis/fedora.sh b/travis/fedora.sh
index 990a84daf..3c224f71e 100755
--- a/travis/fedora.sh
+++ b/travis/fedora.sh
@@ -8,6 +8,7 @@ yum -y install \
 	make \
 	clang \
 	gcc \
+	git \
 	findutils \
 	libtirpc \
 	libtirpc-devel \
diff --git a/travis/tumbleweed.sh b/travis/tumbleweed.sh
index 4d5e9da79..6247daa98 100755
--- a/travis/tumbleweed.sh
+++ b/travis/tumbleweed.sh
@@ -8,6 +8,7 @@ zypper --non-interactive install --force-resolution --no-recommends \
 	clang \
 	findutils \
 	gcc \
+	git \
 	gzip \
 	make \
 	kernel-default-devel \
-- 
2.29.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
