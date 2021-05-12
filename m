Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A8637BA06
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 12:07:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 593ED3C646C
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 12:07:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0DA453C26FF
 for <ltp@lists.linux.it>; Wed, 12 May 2021 12:07:56 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B715010005BB
 for <ltp@lists.linux.it>; Wed, 12 May 2021 12:07:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1447BAF21
 for <ltp@lists.linux.it>; Wed, 12 May 2021 10:07:55 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 12 May 2021 12:07:46 +0200
Message-Id: <20210512100746.5907-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] netns_netlink: Check ip tuntap support
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

11b1fea9d removed ip version check. Although check shouldn't be needed
because version 100519 (v2.6.34) is old enough, add check.

Instead of parsing ip version just try run 'ip tuntap'.

Fixes: ("netns_netlink: Rewrite into new API")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi Cyril,

feel free to reject this as most of the distros having that old kernel
will also have too old toolchain to compile recent LTP
(tst_netdevice.c:218:44: error: use of undeclared identifier
'IFA_FLAGS').

Kind regards,
Petr

 testcases/kernel/containers/netns/netns_netlink.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/testcases/kernel/containers/netns/netns_netlink.c b/testcases/kernel/containers/netns/netns_netlink.c
index 1e8e78fc5..ab56afb99 100644
--- a/testcases/kernel/containers/netns/netns_netlink.c
+++ b/testcases/kernel/containers/netns/netns_netlink.c
@@ -36,11 +36,19 @@
 #include <sched.h>
 
 #include "tst_test.h"
+#include "tst_cmd.h"
 #include "tst_safe_macros.h"
 #include "lapi/namespaces_constants.h"
 
 #define MAX_TRIES 1000
 
+static void setup(void)
+{
+	if (tst_cmd((const char *const []){"ip", "tuntap", NULL}, "/dev/null",
+		      NULL, TST_CMD_PASS_RETVAL | TST_CMD_TCONF_ON_MISSING))
+		tst_brk(TCONF, "ip missing tuntap support");
+}
+
 static void child_func(void)
 {
 	int fd, len, event_found, tries;
@@ -114,6 +122,7 @@ static void test_netns_netlink(void)
 
 
 static struct tst_test test = {
+	.setup = setup,
 	.test_all = test_netns_netlink,
 	.needs_checkpoints = 1,
 	.needs_tmpdir = 1,
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
