Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B23AB3DF1EC
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 17:58:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F6F63C8810
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 17:58:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E7B9B3C55BB
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 17:58:24 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D19D520014C
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 17:58:23 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 20CD5200EA
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 15:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628006303; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1rSmvm1AA52AFwe1qxJlhqwhW4endIEUwBixBIjpIdI=;
 b=zAyTU56mMeod699bW8ep43q7XjQO5BvlIAyVgEbAYmC/z57Z/Uln54qMw77FUXJO5BEDpU
 HgCHUW1yMEPdHC834F3mRx3rVGYT6ZzJ9ygIMcS8K89Sqi7Kx/nYhr3TupEZKrRVCJZvYQ
 d7C9XsoZGTf7LXhTH3PnX4UObYSbSbg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628006303;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1rSmvm1AA52AFwe1qxJlhqwhW4endIEUwBixBIjpIdI=;
 b=Jx5KPFO4WloJKmx8yJBDuTbPG1HHfTP2DB0CNygsrpMI2229fPh6pR2iSeGxRdNBvzZBQS
 vzjkvkZuM4AWh2Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 05B9C13B0E
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 15:58:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sAdwAJ9nCWHYHAAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Tue, 03 Aug 2021 15:58:23 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  3 Aug 2021 17:58:22 +0200
Message-Id: <20210803155822.1973-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210803155822.1973-1-mdoucha@suse.cz>
References: <20210803155822.1973-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] perf_event_open02: Use common
 perf_event_open() wrapper
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1: None

 .../perf_event_open/perf_event_open02.c       | 28 +------------------
 1 file changed, 1 insertion(+), 27 deletions(-)

diff --git a/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c b/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
index eead421ac..7200d35e3 100644
--- a/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
+++ b/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
@@ -29,7 +29,6 @@
 
 #define _GNU_SOURCE
 #include <errno.h>
-#include <inttypes.h>
 #include <sched.h>
 #include <signal.h>
 #include <stddef.h>
@@ -47,8 +46,7 @@
 #include "lapi/syscalls.h"
 
 #if HAVE_PERF_EVENT_ATTR
-#include <linux/types.h>
-#include <linux/perf_event.h>
+#include "perf_event_open.h"
 
 #define MAX_CTRS	1000
 
@@ -67,30 +65,6 @@ static int tsk0 = -1, hwfd[MAX_CTRS], tskfd[MAX_CTRS];
 static int volatile work_done;
 static unsigned int est_loops;
 
-static int perf_event_open(struct perf_event_attr *event, pid_t pid,
-	int cpu, int group_fd, unsigned long flags)
-{
-	int ret;
-
-	ret = tst_syscall(__NR_perf_event_open, event, pid, cpu,
-		group_fd, flags);
-
-	if (ret != -1)
-		return ret;
-
-	tst_res(TINFO, "perf_event_open event.type: %"PRIu32
-		", event.config: %"PRIu64, (uint32_t)event->type,
-		(uint64_t)event->config);
-	if (errno == ENOENT || errno == ENODEV) {
-		tst_brk(TCONF | TERRNO,
-			"perf_event_open type/config not supported");
-	}
-	tst_brk(TBROK | TERRNO, "perf_event_open failed");
-
-	/* unreachable */
-	return -1;
-}
-
 static void all_counters_set(int state)
 {
 	if (prctl(state) == -1)
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
