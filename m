Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E743C4630
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 11:10:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A4C3C3C6741
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 11:10:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8B4C83C18F7
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 11:10:12 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7D83B1400DC0
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 11:10:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1626081009; i=@fujitsu.com;
 bh=MMep4hP2NgHll76mAnwnoj2jHO/3Fl+SwekogTbZ/MM=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=D8UigNJVsKE/aJxXIIrLE4r9lOCum/UhkpKdnb8S2XSWGOJSvyXTT1p8MrMRW8UDk
 IPxeNRhryc3UBu50jKhCWurqvSAPT8Mih96S5kPAMadKTF7q8jk4w3JZ4rNzKYYK0/
 Qh79Dkets1O42tONwgB0wUMhR8yIJrnxZh17bBjKowo/uyIH2qW8PJwqqHrshoMUr5
 u2p05VVu5bPYHyggrmjhVX6ty052f+OFu/7KfFr3sG3/Vo8Nm+9fVywFxnjH4Ftai3
 TLyo1TbBuNUyaX20nCb/yIiZOIgihElfL+Bq8uIME1ri7IAJK9fBVB/e5PvV8hfqeE
 rMtuMIcEXEazg==
Received: from [100.113.2.110] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-a.eu-central-1.aws.symcld.net id DD/7C-07223-1F60CE06;
 Mon, 12 Jul 2021 09:10:09 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxRfcD25s
 Eg9fPDSz27Z/PaLHi+w5GByaPIy9Ws3vs+72ONYApijUzLym/IoE14/izTSwF7WIVr1ezNzBO
 Fe5i5OIQEmhjkrj56jsThLOXUeLu++1ADicHm4CmxLPOBcwgtoiAokTXjBvsIDazgK3E84eX2
 LoYOTiEBYIlzu3NBQmzCKhKLP3aAVbOK+ApseTJWlYQW0JAQWLKw/dgcU4Be4k7B7vAxggJ2E
 ksWb2BEaJeUOLkzCcsEOMlJA6+eMEM0asocanjGyOEXSmxZ1Y/0wRG/llIWmYhaVnAyLSK0TK
 pKDM9oyQ3MTNH19DAQNfQ0FjXSNfI0EwvsUo3US+1VDc5Na+kKBEoq5dYXqxXXJmbnJOil5da
 sokRGKIphUw3djB+e/1B7xCjJAeTkiivzuXXCUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeC1Y3
 yQICRalpqdWpGXmAOMFJi3BwaMkwsvAAJTmLS5IzC3OTIdInWLU5Xhw9d4qZiGWvPy8VClx3r
 ksQEUCIEUZpXlwI2Cxe4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO8OkCk8mXklcJteAR3
 BBHRE4Y6XIEeUJCKkpBqYjNp/5HTlSpxd68GSXfu4yyqWw/71XCXTj3HzP2V2R4TvnaC1o2C5
 DsuTqutuqRICqztfqZ+5eMn6366sa+GfjohYiX7kN50Wt7kojz1iyjsJ/gbN/0E/Ihufmd2s9
 zG/tubdtf+314TMeDOxr0vrlvjfyxsf+2779erSRKuJpUYrVk29Od9Iea3WwX1JeaUxN+v/fj
 oaIbHwWvv8gPpvc9nl5l29u89dufKjvbX8W79/Pv37BHznySX8nVZy/tTD3LUL7OOaPBRumDz
 u/XCm/nmhSuXlqa4C5cnT1fT778dz3X6kFqgtZOo6N7O0lPGCv/0MpwWSpyRl+ecY8BQ95/N4
 tjJo02wdjYorUaUlSizFGYmGWsxFxYkAfw8egVgDAAA=
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-4.tower-226.messagelabs.com!1626081008!9563!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6866 invoked from network); 12 Jul 2021 09:10:08 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
 by server-4.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Jul 2021 09:10:08 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com
 [10.182.185.121])
 by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16C9A2CB008260
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Mon, 12 Jul 2021 10:10:08 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 12 Jul 2021 10:10:00 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <aleksei.kodanev@bell-sw.com>
Date: Mon, 12 Jul 2021 17:10:28 +0800
Message-ID: <1626081029-11258-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <ae2bc43c-1745-a0f1-67a7-b9d5a6691404@bell-sw.com>
References: <ae2bc43c-1745-a0f1-67a7-b9d5a6691404@bell-sw.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v4 1/2] network/tc01.sh: Add a regression test for tc
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

Reviewed-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 runtest/net.tcp_cmds                   |  1 +
 testcases/network/tcp_cmds/tc/Makefile | 10 ++++++
 testcases/network/tcp_cmds/tc/tc01.sh  | 47 ++++++++++++++++++++++++++
 3 files changed, 58 insertions(+)
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
index 000000000..b4d8b86ee
--- /dev/null
+++ b/testcases/network/tcp_cmds/tc/Makefile
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/env_pre.mk
+
+INSTALL_TARGETS		:= tc01.sh
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
