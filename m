Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2552FA556
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 16:59:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9C8F13C5FA4
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 16:59:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 55BA43C30DA
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 16:58:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6A115200045
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 16:58:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1610985520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xRpur4X4QLIwGgVlq2ehmCMknCfsPV+EU++nQPDZmbk=;
 b=d7owqIhM8IuZ1OcdWcmolGIkSt3EWvWwKPKFEIEm0Dzjv6wPqpB4KCXjGCxfWVEbInhlto
 Pm8zYUGdn/DZWuZB69wacac5TEyy2XPUpr3bnRQblU6GcWax5md0wc1ug6U8wd+QfR0DX2
 86P1j8j3gauPqT00PT+1Zfyt2PT9o4A=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0D970AE61;
 Mon, 18 Jan 2021 15:58:40 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 18 Jan 2021 15:56:28 +0000
Message-Id: <20210118155628.9248-6-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118155628.9248-1-rpalethorpe@suse.com>
References: <20210118155628.9248-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 5/5] can: Remove obsolete test wrapper script
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: socketcan-users@lists.berlios.de,
 Oliver Hartkopp <oliver.hartkopp@volkswagen.de>,
 Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Functionality moved into can_common.h and the test executables.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/network/can/Makefile                |   2 -
 .../can/filter-tests/00_Descriptions.txt      |   1 +
 testcases/network/can/filter-tests/INSTALL    |   3 +-
 testcases/network/can/filter-tests/Makefile   |   2 -
 .../network/can/filter-tests/can_run_tests.sh | 106 ------------------
 5 files changed, 3 insertions(+), 111 deletions(-)
 delete mode 100755 testcases/network/can/filter-tests/can_run_tests.sh

diff --git a/testcases/network/can/Makefile b/testcases/network/can/Makefile
index 31744534a..a69f6be87 100644
--- a/testcases/network/can/Makefile
+++ b/testcases/network/can/Makefile
@@ -22,6 +22,4 @@ top_srcdir		?= ../../..
 
 include $(top_srcdir)/include/mk/env_pre.mk
 
-INSTALL_TARGETS		:= *.sh
-
 include $(top_srcdir)/include/mk/generic_trunk_target.mk
diff --git a/testcases/network/can/filter-tests/00_Descriptions.txt b/testcases/network/can/filter-tests/00_Descriptions.txt
index 89610982c..55d213456 100644
--- a/testcases/network/can/filter-tests/00_Descriptions.txt
+++ b/testcases/network/can/filter-tests/00_Descriptions.txt
@@ -5,5 +5,6 @@ information on the CAN network protocol family PF_CAN is contained in
 <Kernel/Documentation/networking/can.txt>.
 
 For any issue(s) with CAN tests please write to:
+<ltp@lists.linux.it>
 <socketcan-users@lists.berlios.de>,
 Oliver Hartkopp <oliver.hartkopp@volkswagen.de>,
diff --git a/testcases/network/can/filter-tests/INSTALL b/testcases/network/can/filter-tests/INSTALL
index e549aed0f..7d62d65fe 100644
--- a/testcases/network/can/filter-tests/INSTALL
+++ b/testcases/network/can/filter-tests/INSTALL
@@ -12,7 +12,8 @@ enable CAN protocol, please see ltp/README file.
 $ make
 
 2) To Run the tests from this directory, do:
-$ ./run_ltp-can_tests.sh
+$ ./can_filter
+$ ./can_rcv_own_msgs
 
 3) To let LTP run the tests from $LTPROOT, execute:
 $ ./runltp -f can
diff --git a/testcases/network/can/filter-tests/Makefile b/testcases/network/can/filter-tests/Makefile
index 6a9474164..29aaa3240 100644
--- a/testcases/network/can/filter-tests/Makefile
+++ b/testcases/network/can/filter-tests/Makefile
@@ -23,6 +23,4 @@ include $(top_srcdir)/include/mk/testcases.mk
 
 CPPFLAGS		+= -DETH_P_CAN=0x000C -DPF_CAN=29 -DAF_CAN=PF_CAN
 
-INSTALL_TARGETS		:= *.sh
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/can/filter-tests/can_run_tests.sh b/testcases/network/can/filter-tests/can_run_tests.sh
deleted file mode 100755
index 762d90eca..000000000
--- a/testcases/network/can/filter-tests/can_run_tests.sh
+++ /dev/null
@@ -1,106 +0,0 @@
-#!/bin/sh
-################################################################################
-## Copyright (c) Oliver Hartkopp <oliver.hartkopp@volkswagen.de>, 2011        ##
-## Copyright (c) International Business Machines  Corp., 2009                 ##
-##                                                                            ##
-## This program is free software;  you can redistribute it and#or modify      ##
-## it under the terms of the GNU General Public License as published by       ##
-## the Free Software Foundation; either version 2 of the License, or          ##
-## (at your option) any later version.                                        ##
-##                                                                            ##
-## This program is distributed in the hope that it will be useful, but        ##
-## WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY ##
-## or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License   ##
-## for more details.                                                          ##
-##                                                                            ##
-## You should have received a copy of the GNU General Public License          ##
-## along with this program;  if not, write to the Free Software Foundation,   ##
-## Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA           ##
-##                                                                            ##
-################################################################################
-
-TCID="$1"
-TST_TOTAL=1
-export TST_COUNT
-
-. test.sh
-
-setup()
-{
-	tst_require_root
-
-	# load needed CAN networklayer modules
-	modprobe can
-	ret=$?
-	if [ $ret -ne 0 ]; then
-		tst_brkm TCONF "modprobe can failed: ret - $ret"
-	fi
-
-	modprobe can_raw
-	ret=$?
-	if [ $ret -ne 0 ]; then
-		tst_brkm TCONF "modprobe can_raw failed: ret - $ret"
-	fi
-
-	# ensure the vcan driver to perform the ECHO on driver level
-	modprobe -r vcan
-	ret=$?
-	if [ $ret -ne 0 ]; then
-		tst_brkm TCONF "modprobe -r vcan failed: ret - $ret"
-	fi
-
-	modprobe vcan echo=1
-	ret=$?
-	if [ $ret -ne 0 ]; then
-		tst_brkm TCONF "modprobe vcan echo=1 failed: ret - $ret"
-	fi
-
-	VCAN=vcan0
-
-	# create virtual CAN device
-	ip link add dev $VCAN type vcan
-	ret=$?
-	if [ $ret -ne 0 ]; then
-		tst_brkm TBROK \
-			 "ip link add dev $VCAN type vcan failed: ret - $ret"
-	fi
-
-	ip link set dev $VCAN up
-	ret=$?
-	if [ $ret -ne 0 ]; then
-		tst_brkm TBROK "ip link set dev $VCAN up failed: ret - $ret"
-	fi
-
-	# check precondition for CAN frame flow test
-	HAS_ECHO=`ip link show $VCAN | grep -c ECHO`
-	if [ $HAS_ECHO -ne 1 ]; then
-		tst_brkm TBROK "ECHO is not 1"
-	fi
-}
-
-cleanup()
-{
-	ip link set dev $VCAN down
-	ip link del dev $VCAN
-	modprobe -r vcan
-	modprobe -r can_raw
-	modprobe -r can
-}
-
-if [ $# -ne 1 ]; then
-	tst_brkm TBROK "Usage: $0 [can_filter | can_rcv_own_msgs]"
-fi
-
-setup
-TST_CLEANUP=cleanup
-
-"$1" "$VCAN"
-ret=$?
-case "$ret" in
-0)	tst_resm TPASS "Test $1 PASS";;
-1)	tst_resm TFAIL "Test $1 FAIL";;
-32)	tst_resm TCONF "$1 is not appropriate for configuration flag";;
-*)	tst_resm TBROK "Invalid resm type $ret";;
-esac
-
-tst_exit
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
