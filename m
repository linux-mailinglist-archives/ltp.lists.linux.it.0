Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3A7247E44
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 08:11:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C72F13C2FDE
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 08:11:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 160013C0639
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 08:11:09 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 0E9F460081E
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 08:11:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597731067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KInuyrn2e5CVZIY+J3MFCUXdUeVj8GApWHudC6CTTwQ=;
 b=KhAoDSyM/llLlOUyGpwFreXlLytsPMbfLeykicJHsqVr8dg7JvI1eZ0AEqT8/n3tkxYb3F
 lYA5GIVtnvr8l5x9lNbDAwFla+HVEajZxKbD1nTVdLzATIGZaCebAcUoECP9s0WZbuxlaQ
 gSuCCfGHM8UdUXNcT0LrWz3SL98qxDw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-MRxAX67uOeaAbzyGZFxJfA-1; Tue, 18 Aug 2020 02:11:04 -0400
X-MC-Unique: MRxAX67uOeaAbzyGZFxJfA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A9441007380;
 Tue, 18 Aug 2020 06:11:03 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1008756B0;
 Tue, 18 Aug 2020 06:11:00 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 18 Aug 2020 14:10:59 +0800
Message-Id: <20200818061059.14680-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] clock_settime03: accept ENOTSUP if
 CLOCK_REALTIME_ALARM unsupported
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CLOCK_REALTIME_ALARM requires an RTC with alarm support, which may not be
present on a system. In that case, the kernel will return EOPNOTSUPP, which
is defined as ENOTSUP in userspace.

As CLOCK_REALTIME_ALARM is already possibly unsupported, accept that as an
error besides the EINVAL code.

For issue #712:
  https://github.com/linux-test-project/ltp/issues/712

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Viresh Kumar<viresh.kumar@linaro.org>
Cc: Cyril Hrubis <chrubis@suse.cz>
---
 .../kernel/syscalls/clock_settime/clock_settime03.c    | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/clock_settime/clock_settime03.c b/testcases/kernel/syscalls/clock_settime/clock_settime03.c
index 5b75afbe7..250d6bcc7 100644
--- a/testcases/kernel/syscalls/clock_settime/clock_settime03.c
+++ b/testcases/kernel/syscalls/clock_settime/clock_settime03.c
@@ -10,6 +10,7 @@
 #include "config.h"
 #include "tst_timer.h"
 #include "tst_safe_clocks.h"
+#include "lapi/common_timers.h"
 
 #define TIMER_DELTA	3
 #define ALLOWED_DELTA	(50 * 1000) /* 50 ms */
@@ -66,8 +67,13 @@ static void run(void)
 	SAFE_SIGPROCMASK(SIG_BLOCK, &set, NULL);
 
 	TEST(tst_syscall(__NR_timer_create, CLOCK_REALTIME_ALARM, &ev, &timer));
-	if (TST_RET != 0)
-		tst_brk(TBROK | TERRNO, "timer_create() failed");
+	if (TST_RET != 0) {
+		if (possibly_unsupported(CLOCK_REALTIME_ALARM) &&
+				(TST_ERR == EINVAL || TST_ERR == ENOTSUP))
+			tst_brk(TCONF | TTERRNO, "CLOCK_REALTIME_ALARM unsupported");
+		else
+			tst_brk(TBROK | TTERRNO, "timer_create() failed");
+	}
 
 	tst_ts_set_sec(&start, time);
 	tst_ts_set_nsec(&start, 0);
-- 
2.21.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
