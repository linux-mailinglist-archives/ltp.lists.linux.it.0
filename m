Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5AB1DBDA8
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 21:10:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C1D063C4DEF
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 21:10:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id E7F873C088F
 for <ltp@lists.linux.it>; Wed, 20 May 2020 21:10:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1DEBD200B9C
 for <ltp@lists.linux.it>; Wed, 20 May 2020 21:10:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EFC5EB118
 for <ltp@lists.linux.it>; Wed, 20 May 2020 19:10:38 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 20 May 2020 21:10:24 +0200
Message-Id: <20200520191024.2068474-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [COMMITTED][PATCH 1/1] build.sh: Add -Wformat
 -Werror=format-security into CFLAGS
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

so it's tested in Travis CI
First version, when it was supported was 3.0.4.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

I merged this without review, as it's based on old Cyril's ack [1]
First gcc version, where it's supported is gcc 3.

Kind regards,
Petr

[1] http://lists.linux.it/pipermail/ltp/2019-February/010988.html
[2] https://gcc.gnu.org/onlinedocs/gcc-3.0.4/gcc/Warning-Options.html

 build.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/build.sh b/build.sh
index 50fb527e4..becaf3619 100755
--- a/build.sh
+++ b/build.sh
@@ -1,5 +1,5 @@
 #!/bin/sh
-# Copyright (c) 2017-2018 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) 2017-2020 Petr Vorel <pvorel@suse.cz>
 # Script for travis builds.
 #
 # TODO: Implement comparison of installed files. List of installed files can
@@ -9,7 +9,7 @@
 
 set -e
 
-CFLAGS="${CFLAGS:--Werror=implicit-function-declaration -fno-common}"
+CFLAGS="${CFLAGS:--Wformat -Werror=format-security -Werror=implicit-function-declaration -fno-common}"
 CC="${CC:-gcc}"
 
 DEFAULT_PREFIX="$HOME/ltp-install"
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
