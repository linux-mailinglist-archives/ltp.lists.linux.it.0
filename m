Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EB93BE57C
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 11:22:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A28813C68B9
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 11:22:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3C7043C1821
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 11:22:13 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4D89860146E
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 11:22:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1625649732; i=@fujitsu.com;
 bh=cDZdFvXqe/EnSeufyZFNOWzCHos5AdUebtjuN4jllsY=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=WFXrU4FOJdy2ZJdviYij9lOhRwEW5l/+HZv1Md1XXw+D6Mq7FdOr+f+guMUBu6Hsc
 7F0SvykG2flhPpCzhTWLZ/GyRh/CrgSXWiDO1BTWUkg2s/DQ/RcdPb50VYWJfyoZg6
 dOtZnB2Qb64IVvlIFZkECEYmed41c45UhVkss6YCZbbnsEnRO/pgTDHz2x9CZ9MK8+
 tgT2YG5Z5DWaU7uMFsAW6p5eUauOaLeGlhtuaPz5vLkm1K6QTEh7P6Y4YrCzbhHVL+
 djd2/W+FQTVHI9Qicu+bfk3FsVgtpjEBNWjZ986bTZAYfqbqtfoBGh5kgRe4KLgg5L
 +tKX5j5NXgY1A==
Received: from [100.113.3.92] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 7C/A8-07685-34275E06;
 Wed, 07 Jul 2021 09:22:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MRoutc9DT
 B4ON0MYsV33cwOjB67Pu9jjWAMYo1My8pvyKBNePyGeWCbeIVHXPmsjUwThfpYuTiEBJoZpI4
 8XkSC4Szm1HixsEnrF2MnBxsApoSzzoXMIPYIgISEh0Nb9lBbGYBdYnlk34xdTFycAgL+Egcn
 OQEEmYRUJE49vUbE4jNK+Ap0bB/PZgtIaAgMeXhe2aIuKDEyZlPWCDGSEgcfPGCGaJGUeJSxz
 dGCLtCYsaMbWwTGHlnIWmZhaRlASPTKkbLpKLM9IyS3MTMHF1DAwNdQ0NjXWNdI1NDvcQq3US
 91FLd5NS8kqJEoKxeYnmxXnFlbnJOil5easkmRmB4pRQy/97B+Pj1B71DjJIcTEqivOtSnyYI
 8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuA9UgCUEyxKTU+tSMvMAYY6TFqCg0dJhNc3GyjNW1yQm
 FucmQ6ROsWoy/Hg6r1VzEIsefl5qVLivEtBZgiAFGWU5sGNgMXdJUZZKWFeRgYGBiGegtSi3M
 wSVPlXjOIcjErCvHUgU3gy80rgNr0COoIJ6Iib5x6CHFGSiJCSamBqVIqS3e2/+bCN2+YLC86
 kzUg+yjTN7I/3lKkC3J/Xcf2aqLvF0IjhsvSDk9K7b7hzz9wgnsVrOYlv3ZvULfefO6rN5mKe
 xH60e1dL2fn9nBVOBqVXS9rqS45m6VqYWO4wSExSFRAL+XBfkVshr5dZIDLJ3dD6N3/wi1r5m
 3H+p561PJrHxBZTodLPlRbgxs1+UcVJu9S/8o2VzzZmSclulU/i23SnVAkc3PjHsFJFRtLA4l
 Fg2hxxGYV0KesjK+8+O/+z/LLMTQW/ibFm+lnHV5ZsPjflOWfZv+PTZXjD94XqXyldddPgpfO
 h9Udf6X3es+XI39uarewXZ13x/fFz+wKRGRdWS195LlUXu1OJpTgj0VCLuag4EQBRs8jjNgMA
 AA==
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-5.tower-228.messagelabs.com!1625649730!259915!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2169 invoked from network); 7 Jul 2021 09:22:11 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
 by server-5.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jul 2021 09:22:11 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1679M4Pg007825
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Wed, 7 Jul 2021 10:22:10 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 7 Jul 2021 10:22:02 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 7 Jul 2021 17:22:26 +0800
Message-ID: <1625649746-11987-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] network/tc01.sh: Add a regression test for tc qdisc
 command
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

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 runtest/net.tcp_cmds                   |  1 +
 testcases/network/tcp_cmds/tc/Makefile | 13 +++++++
 testcases/network/tcp_cmds/tc/tc01.sh  | 51 ++++++++++++++++++++++++++
 3 files changed, 65 insertions(+)
 create mode 100644 testcases/network/tcp_cmds/tc/Makefile
 create mode 100755 testcases/network/tcp_cmds/tc/tc01.sh

diff --git a/runtest/net.tcp_cmds b/runtest/net.tcp_cmds
index db47dfd5b..7e142de11 100644
--- a/runtest/net.tcp_cmds
+++ b/runtest/net.tcp_cmds
@@ -12,6 +12,7 @@ netstat netstat01.sh
 ping01 ping01.sh
 ping02 ping02.sh
 sendfile sendfile01.sh
+tc01 tc01.sh
 tcpdump tcpdump01.sh
 telnet telnet01.sh
 iptables iptables01.sh
diff --git a/testcases/network/tcp_cmds/tc/Makefile b/testcases/network/tcp_cmds/tc/Makefile
new file mode 100644
index 000000000..60150a1ce
--- /dev/null
+++ b/testcases/network/tcp_cmds/tc/Makefile
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (C) 2009, Cisco Systems Inc.
+# Ngie Cooper, July 2009
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/env_pre.mk
+
+INSTALL_TARGETS		:= tc01.sh
+
+MAKE_TARGETS		:=
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/tcp_cmds/tc/tc01.sh b/testcases/network/tcp_cmds/tc/tc01.sh
new file mode 100755
index 000000000..0a241843b
--- /dev/null
+++ b/testcases/network/tcp_cmds/tc/tc01.sh
@@ -0,0 +1,51 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
+# Author: Yang Xu<xuyang2018.jy@fujitsu.com>
+#
+# When using "tc qdisc add dev teql0 root teql0 command", qdisc_create()
+# calls teql_qdisc_init() it imediately fails after check "if (m->dev == dev)"
+# because both devices are teql0, and it does not set qdisc_priv(sch)->m
+# leaving it zero on error path, then qdisc_create() imediately calls
+# teql_destroy() which does not expect zero master pointer and we get OOPS
+# on unpatched kernel.
+#
+# If we enable panic_on_oops, this case may crash.
+#
+# This kernel bug was introduced by
+# commit 87b60cfacf9f ("net_sched: fix error recovery at qdisc creation")
+# and has been fixed by
+# commit 1ffbc7ea9160 ("net: sched: sch_teql: fix null-pointer dereference")
+#
+
+TST_TESTFUNC="do_test"
+TST_NEEDS_ROOT=1
+TST_NEEDS_DRIVERS="sch_teql"
+TST_NEEDS_CMDS="tc modprobe"
+sys_file="/proc/sys/kernel/panic_on_oops"
+. tst_test.sh
+
+do_test()
+{
+	[ ! -f "$sys_file" ] && tst_brk TCONF "$sys_file not enabled"
+	orig_value=$(cat "$sys_file")
+	if [ $orig_value = "0" ]; then
+		echo 1 > $sys_file
+	fi
+
+	tst_res TINFO "Use tc qdisc command to trigger a null-pointer dereference"
+	modprobe $TST_NEEDS_DRIVERS
+
+	tc qdisc add dev teql0 root teql0 2>/dev/null
+	if [ $? -eq 0 ]; then
+		tst_res TFAIL "tc qdisc command succeeded unexpectedly"
+	else
+		tst_res TPASS "the bug was not reproduced"
+	fi
+
+	if [ $orig_value = "0" ]; then
+		 echo 0 > $sys_file
+	fi
+}
+
+tst_run
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
