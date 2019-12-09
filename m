Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DA5116981
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2019 10:38:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 21EAC3C234C
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2019 10:38:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id AA42F3C22D3
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 10:38:17 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1A58060157C
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 10:38:16 +0100 (CET)
Received: from ubuntu.localdomain (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 0F1CD9F7F0;
 Mon,  9 Dec 2019 09:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1575884296; bh=ST3HkQR6DAN6mZKGq0d38Lx7Li7OiR114S3ZVC92cM8=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=WvT8UI8mZA4cZ3A+CYYUTHkAyzjg9wB0ncttg8A152Ngda9mnTUkdAlMK9GjO9f2K
 v3P3aosYhQq28rKzh93+1o2BpOcazIIJHbZo0Jp0pwNtPltFzZxdSvEsjdP+DdU93Z
 HPmxXWwEHW7Yw5nN/5kBZuVCuHrhV3VU8egFzE5M=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Mon,  9 Dec 2019 10:38:08 +0100
Message-Id: <20191209093808.32320-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] linktest: Convert to new library
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 testcases/kernel/fs/linktest/linktest.sh | 100 +++++++++++------------
 1 file changed, 46 insertions(+), 54 deletions(-)

diff --git a/testcases/kernel/fs/linktest/linktest.sh b/testcases/kernel/fs/linktest/linktest.sh
index bc78f1e4a..6efbe0c94 100755
--- a/testcases/kernel/fs/linktest/linktest.sh
+++ b/testcases/kernel/fs/linktest/linktest.sh
@@ -1,79 +1,71 @@
 #!/bin/sh
-
+# SPDX-License-Identifier: GPL-2.0-or-later
 #   Copyright (c) International Business Machines  Corp., 2000
-#
-#   This program is free software;  you can redistribute it and/or modify
-#   it under the terms of the GNU General Public License as published by
-#   the Free Software Foundation; either version 2 of the License, or
-#   (at your option) any later version.
-#
-#   This program is distributed in the hope that it will be useful,
-#   but WITHOUT ANY WARRANTY;  without even the implied warranty of
-#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
-#   the GNU General Public License for more details.
-#
-#   You should have received a copy of the GNU General Public License
-#   along with this program;  if not, write to the Free Software
-#   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-
-
-#
-#  FILE(s)     : linktest.sh README
-#  DESCRIPTION : Regression test for max links per file
-#  USE         : linktest.sh <number of symlinks> <number of hardlinks>
-#  AUTHOR      : Ngie Cooper (yaneurabeya@gmail.com)
-#  HISTORY     :
-#	A rewrite of testcases/kernel/fs/linktest.pl
-
-export TCID=linker01
-export TST_TOTAL=2
-export TST_COUNT=1
-. test.sh
+# Regression test for max links per file
+# linktest.sh <number of symlinks> <number of hardlinks>
+# AUTHOR: Ngie Cooper (yaneurabeya@gmail.com)
+
+TST_NEEDS_TMPDIR=1
+TST_POS_ARGS=2
+TST_TESTFUNC=do_test
+
+. tst_test.sh
 
 if [ $# -ne 2 ]; then
-	tst_resm TBROK "usage: $0 {softlink count} {hardlink count}"
+	tst_res TBROK "usage: $0 {softlink count} {hardlink count}"
 	exit 1
 fi
 
-tst_tmpdir
+validate_parameter() {
+	if ! tst_is_int "$2"; then
+		tst_brk TBROK "$1 must be integer"
+	fi
 
-mkdir hlink.$$ slink.$$ && touch hlink.$$/hfile slink.$$/sfile
+	if [ "$2" -lt 0 ]; then
+		tst_brk TBROK "$1 must be >= 0"
+	fi
+}
 
-do_link() {
-	pfix=$1
-	ln_opts=$2
-	limit=$3
-	prefix_msg=$4
+validate_parameter "softlink count" $1
+validate_parameter "hardlink count" $2
 
-	lerrors=0
+soft_links=$1
+hard_links=$2
 
-	i=0
+do_link() {
+	local prefix=$1
+	local ln_opts=$2
+	local limit=$3
+	local prefix_msg=$4
+
+	local lerrors=0
+	local i=0
+	local rtype=TFAIL
 
-	cd "${pfix}link.$$"
+	cd "${prefix}link.$$"
 	while [ $i -lt $limit ]; do
-		if ! ln ${ln_opts} "$PWD/${pfix}file" ${pfix}file${i}; then
+		if ! ln ${ln_opts} "$PWD/${prefix}file" ${prefix}file${i}; then
 			: $(( lerrors += 1 ))
 		fi
-		: $(( i+= 1 ))
+		: $(( i += 1 ))
 	done
 	cd ..
 
 	if [ $lerrors -eq 0 ]; then
-		RTYPE=TPASS
-	else
-		RTYPE=TFAIL
+		rtype=TPASS
 	fi
 
-	tst_resm $RTYPE "$prefix_msg Link Errors: $lerrors"
-
-	: $(( TST_COUNT += 1 ))
-
+	tst_res $rtype "$prefix_msg Link Errors: $lerrors"
 }
 
-do_link s "-s" ${1} "Symbolic"
-do_link h   "" ${2} "Hard"
+do_test() {
+	mkdir hlink.$$ slink.$$
+	touch hlink.$$/hfile slink.$$/sfile
+
+	do_link s "-s" $soft_links "Symbolic"
+	do_link h   "" $hard_links "Hard"
 
-rm -Rf hlink.$$ slink.$$
+	rm -Rf hlink.$$ slink.$$
+}
 
-tst_rmdir
-tst_exit
+tst_run
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
