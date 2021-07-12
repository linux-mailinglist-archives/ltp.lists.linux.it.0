Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A063C4131
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 04:18:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 07AC73C78DD
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 04:18:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6A7F43C4D7E
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 04:18:05 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8D02C60004A
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 04:18:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1626056280; i=@fujitsu.com;
 bh=e6bEOH6j0iK3BzuwWgqBuUm8ni4DEPdQWd7lATlre2s=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=Mx9kwIzPf+L67T4VLIQ+7j7wP7qEbBtukpZuta1hIRW0pddswa8b23Lfyl5wVV9q5
 VeIBJqeKRPnQ5utDSQ8IKlO+W+11wWduSgIwaCTElsv8/S2yaLT0XtVGWY+0/RW3d+
 9wlBpqfn50uNYoBWZ6dAaEKe5YQXH+zhdkTeFYAsul0/m7IwCbyzEocaYWzF587M6X
 foEqg8NLGnXfD0H9hYeItFjzNHx3F3z5EzK1qCfEQA4LR6KcFO02F9TW3ul7P7WhSp
 V+Wmj00wdvs8eHEWua5b3yHDjWkbRL5di50Wq3zcwOCx6Iu3ynvCaM3AxJ34GqQp8v
 /BI8sw5Se/log==
Received: from [100.113.7.10] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 50/36-07695-756ABE06;
 Mon, 12 Jul 2021 02:17:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxRTds2es
 Eg4ufrSz27Z/PaLHi+w5GByaPIy9Ws3vs+72ONYApijUzLym/IoE1Y8ba9cwFr0Qrjs1fzt7A
 +FWoi5GLQ0igjUmi4d5bVghnL6PEp6MfWboYOTnYBDQlnnUuYAaxRQQUJbpm3GAHsZkFbCWeP
 7zEBmILC/hLNC54zQpiswioSnz5cBishlfAQ+L2tGdMILaEgILElIfvweZwCthL9DXeBOsVEr
 CTaFpziA2iXlDi5MwnLBDzJSQOvnjBDNGrKHGp4xsjhF0psWdWP9MERv5ZSFpmIWlZwMi0itE
 iqSgzPaMkNzEzR9fQwEDX0NBY10zXwlwvsUo3SS+1VDc5Na+kKBEoqZdYXqxXXJmbnJOil5da
 sokRGKQphWzhOxjPvP6gd4hRkoNJSZS3l+VlghBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3mtLX
 icICRalpqdWpGXmACMGJi3BwaMkwluzGCjNW1yQmFucmQ6ROsWoy/Hg6r1VzEIsefl5qVLivA
 wgMwRAijJK8+BGwKL3EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3gkgU3gy80rgNr0COoI
 J6IjCHS9BjihJREhJNTCt2T3/xEEmt2nuocqhhjHnH7JduHSqPeb27hievW4MP2useGTjjgWU
 lVQoS94/rXFxXylP4vqvTWH7d3vy7V7w2fjk4z3v5EwYq1pj9Zje5rk33Q932zLjRN3Jc/Mez
 dlh8uJNqO3lm+3LXLOZON7cOe7JnGqwn2NWlr4Zf3/BdsX52/rO8E7O66/cvtrqpGF2aJB8+v
 xZ2xeFbUqeM/ucx5zJvi9WisTu1HA2mRchf5LJSfDBw+VsPnYOdxjmO2oF/z7PtEJopfbSu3P
 r/yr675aQvf/xlM6EeWftP9RW/7686rmI7uPbUmteLNy25cx39Wajcs1ttvbzpxy7NnEhp2v1
 vsLnIY+PJx24tOVvvxJLcUaioRZzUXEiAL2qualZAwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-15.tower-245.messagelabs.com!1626056278!204958!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20018 invoked from network); 12 Jul 2021 02:17:58 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
 by server-15.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Jul 2021 02:17:58 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com
 [10.182.185.121])
 by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16C2Hpai015529
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Mon, 12 Jul 2021 03:17:58 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 12 Jul 2021 03:17:48 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <aleksei.kodanev@bell-sw.com>
Date: Mon, 12 Jul 2021 10:18:17 +0800
Message-ID: <1626056297-5744-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <7d822a0c-451c-4653-23f1-9bbc81bd0842@bell-sw.com>
References: <7d822a0c-451c-4653-23f1-9bbc81bd0842@bell-sw.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3] network/tc01.sh: Add a regression test for tc
 qdisc command
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 runtest/net.tcp_cmds                   |  1 +
 testcases/network/tcp_cmds/tc/Makefile | 13 +++++++
 testcases/network/tcp_cmds/tc/tc01.sh  | 47 ++++++++++++++++++++++++++
 3 files changed, 61 insertions(+)
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
index 000000000..a9da45b41
--- /dev/null
+++ b/testcases/network/tcp_cmds/tc/tc01.sh
@@ -0,0 +1,47 @@
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
+TST_SETUP="setup"
+TST_TESTFUNC="do_test"
+TST_NEEDS_ROOT=1
+TST_NEEDS_DRIVERS="sch_teql"
+TST_NEEDS_CMDS="tc modprobe dmesg grep"
+
+. tst_test.sh
+
+setup()
+{
+	ROD modprobe $TST_NEEDS_DRIVERS
+}
+
+do_test()
+{
+	tst_res TINFO "Use tc qdisc command to trigger a null-pointer dereference"
+
+	EXPECT_FAIL tc qdisc add dev teql0 root teql0
+
+	if dmesg | grep -q 'RIP:.*sch_teql'; then
+		tst_res TFAIL "This bug is reproduced."
+	else
+		tst_res TPASS "This bug is not reproduced."
+	fi
+}
+
+tst_run
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
