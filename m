Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D171F1B3C
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 16:45:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BF9313C2EA2
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 16:45:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 1E2E13C094D
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 16:45:13 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 33D931A00E17
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 16:45:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591627511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type;
 bh=029Ag3Y/bWYthFTI5tYgYerRiBBM96ynt7uqxnkfJVM=;
 b=EaAiU67qN9giZp0PMB6jkOIXP2xKH/WtOtvGgelthaFhm0lV0EVqluCVdJPAvS5bXfd/L1
 z0OQ5exkW4Q1Wr3mt55Hi6QOa5WKoeXVrjDha2cgAQwPLuggc5OFmyyErWV1T/e9NJJHsi
 p3lKHPhh7wTfewos2ppKQEUqHbIehT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-oJG6_aIhNPGR8gLK3ERv8w-1; Mon, 08 Jun 2020 10:45:07 -0400
X-MC-Unique: oJG6_aIhNPGR8gLK3ERv8w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC2498014D4
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 14:45:06 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.43.17.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30FF210013D4
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 14:45:06 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Mon,  8 Jun 2020 16:45:00 +0200
Message-Id: <94e6163082055700db700c33ed0eab537420fdaf.1591627489.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH COMMITTED] syscalls/sched_rr_get_interval: add missing
 TERRNO
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 .../syscalls/sched_rr_get_interval/sched_rr_get_interval01.c    | 2 +-
 .../syscalls/sched_rr_get_interval/sched_rr_get_interval02.c    | 2 +-
 .../syscalls/sched_rr_get_interval/sched_rr_get_interval03.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
index b6084f673ca7..6ebf873de798 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
@@ -128,7 +128,7 @@ void setup(void)
 
 	/* Change scheduling policy to SCHED_RR */
 	if ((sched_setscheduler(0, SCHED_RR, &p)) == -1) {
-		tst_brkm(TBROK, cleanup, "sched_setscheduler() failed");
+		tst_brkm(TBROK|TERRNO, cleanup, "sched_setscheduler() failed");
 	}
 }
 
diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c
index 6bf743f78c5e..367d9e3ff486 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c
@@ -132,7 +132,7 @@ void setup(void)
 
 	/* Change scheduling policy to SCHED_FIFO */
 	if ((sched_setscheduler(0, SCHED_FIFO, &p)) == -1) {
-		tst_brkm(TBROK, cleanup, "sched_setscheduler() failed");
+		tst_brkm(TBROK|TERRNO, cleanup, "sched_setscheduler() failed");
 	}
 }
 
diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
index 56f2fcf28269..40b636b4dc65 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
@@ -155,7 +155,7 @@ void setup(void)
 
 	/* Change scheduling policy to SCHED_RR */
 	if ((sched_setscheduler(0, SCHED_RR, &p)) == -1) {
-		tst_brkm(TBROK, cleanup, "sched_setscheduler() failed");
+		tst_brkm(TBROK|TERRNO, cleanup, "sched_setscheduler() failed");
 	}
 
 	unused_pid = tst_get_unused_pid(cleanup);
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
