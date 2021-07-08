Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A10A3BF6F6
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 10:42:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 138913C89A6
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 10:42:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E12B53C1D05
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 10:42:24 +0200 (CEST)
Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com
 [195.245.230.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3F7F510011D5
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 10:42:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1625733742; i=@fujitsu.com;
 bh=0utyQXlFNCmIQqksiNZGwHu9Fy/vdABbT1PjrUQlZ5o=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=IEYbJEWDovTCqxdE5LK2UOZ3gX5JBu1F5YX6//sQBItx+cnEh2VFe2WjRa45wRYyE
 3u/WSD7/NUyM7hoUILqyXYVvi4qJUDXc/xqH18Ksh0PK8O2RsOPGCBNqD1hBPcdAbH
 bmhajJVx91oBnOwpnfQtd5O0e3Uv5XFRUaWhon2xsT1rwh0LeL6xZFunOjxnRQX5fH
 W7Z2hxun5G8XKsq+SyzGu5Ymaf1Wq/+6RjyTHQG4z2+/O5qfi2lAj4IFJrdABKfxUu
 4SQdbtVmiEPwUhRsrC6KIDJswmkANDKlM+7OIoUUwZZIPQQz7ZeSmLiAyMa4DnENkn
 OsSRe+1gDDhcQ==
Received: from [100.112.199.57] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 1F/A8-07336-E6AB6E06;
 Thu, 08 Jul 2021 08:42:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8MRqpu761m
 CwY8vRhb79s9ntFjxfQejA5PHkRer2T32/V7HGsAUxZqZl5RfkcCasfZAVcFMsYo32/0bGKcL
 dzFycQgJvGKUWP7rLRuEs5tRYubr5UxdjJwcbAKaEs86FzCD2CICihJdM26wg9jMArYSzx9eY
 gOxhQX8JTb1rASLswioSJyd+BWsl1fAU+Lm9glgcQkBBYkpD9+DzeEUsJc4N3EnWI2QgJ3EhD
 uLWCHqBSVOznzCAjFfQuLgixfMEL2KEpc6vjFC2BUSM2ZsY5vAyD8LScssJC0LGJlWMVokFWW
 mZ5TkJmbm6BoaGOgaGhrpGlqa6RoZmuglVukm6aWW6panFpfoGuollhfrFVfmJuek6OWllmxi
 BAZoSsGRazsYD7z+oHeIUZKDSUmUV6/+WYIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6g9UA5w
 aLU9NSKtMwcYLTApCU4eJREeC22AKV5iwsSc4sz0yFSpxh1OR5cvbeKWYglLz8vVUqc9/0OoC
 IBkKKM0jy4EbDIvcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmJdzJ9AUnsy8ErhNwHgFul+
 El+HwU5AjShIRUlINTBMyDhSLWf/6qerWHLpncqWo6uGju+Q2f9nk5tHgwvS21bTdeolfebrf
 dmnOBxz8i4ReWW+24z3YxfswNjrQZ4VLSIJDYU5q3w/Tn/sWBk/1mnee6/crjrsn5Hw59//4U
 tT7S2nixR2cn527GHZfixf6fmLrK0GmTwvFTy4V/+i/xvTkufKY8yf26ahIfeOL0m+ecmd+Om
 f0GskNM3ImfY8RkU9V7Tb6ybWYN9L+ipxA2AmldK7DO/Z3hh36LRQgwnGI0/BSp8ctxy73/MV
 LLt87fZprj8LPR0eM/6i6zfGcKPwq+PvMnPbISI0Nh6ZU3vWevcjl1fNr8y/fmiIzaa2jlpNR
 uuaC8GVrBd/U9yuxFGckGmoxFxUnAgCqJMVTVwMAAA==
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-9.tower-285.messagelabs.com!1625733741!123288!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2452 invoked from network); 8 Jul 2021 08:42:21 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
 by server-9.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Jul 2021 08:42:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1688gFno001217
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 8 Jul 2021 09:42:21 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 8 Jul 2021 09:42:13 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <aleksei.kodanev@bell-sw.com>
Date: Thu, 8 Jul 2021 16:42:39 +0800
Message-ID: <1625733759-30715-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <50bca7a2-41f5-3eba-d1da-e8e12c883d22@bell-sw.com>
References: <50bca7a2-41f5-3eba-d1da-e8e12c883d22@bell-sw.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2] network/tc01.sh: Add a regression test for tc
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
 testcases/network/tcp_cmds/tc/tc01.sh  | 48 ++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)
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
index 000000000..d4f0792bc
--- /dev/null
+++ b/testcases/network/tcp_cmds/tc/tc01.sh
@@ -0,0 +1,48 @@
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
+	dmesg | grep RIP | grep teql_destroy | grep sch_teql > /dev/null
+	if [ $? -eq 0 ]; then
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
