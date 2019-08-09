Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DCF87CC9
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 16:32:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F7823C1D8B
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 16:32:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C03723C1D84
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 16:32:17 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 85001100188C
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 16:31:34 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 28DFC30FB8DC
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 14:31:39 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4F6F10495C6
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 14:31:38 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Fri,  9 Aug 2019 16:31:35 +0200
Message-Id: <ee463189a82212a10c1ac06229dc0a418e18305b.1565361031.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 09 Aug 2019 14:31:39 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] clock_getres01: drop case which is passing
 NULL res parameter
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

Since commit a9446a906f52 ("lib/vdso/32: Remove inconsistent NULL pointer checks")
VDSO treats NULL parameter differently than in syscall.

Drop NULL parameter, subsequent patch will add test variants that test NULL
res parameter using syscall.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/syscalls/clock_getres/clock_getres01.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/testcases/kernel/syscalls/clock_getres/clock_getres01.c b/testcases/kernel/syscalls/clock_getres/clock_getres01.c
index 15f32310839a..df3e84271ad9 100644
--- a/testcases/kernel/syscalls/clock_getres/clock_getres01.c
+++ b/testcases/kernel/syscalls/clock_getres/clock_getres01.c
@@ -28,7 +28,6 @@ static struct test_case {
 	{"MONOTONIC", CLOCK_MONOTONIC, &res, 0, 0},
 	{"PROCESS_CPUTIME_ID", CLOCK_PROCESS_CPUTIME_ID, &res, 0, 0},
 	{"THREAD_CPUTIME_ID", CLOCK_THREAD_CPUTIME_ID, &res, 0, 0},
-	{"REALTIME", CLOCK_REALTIME, NULL, 0, 0},
 	{"CLOCK_MONOTONIC_RAW", CLOCK_MONOTONIC_RAW, &res, 0, 0,},
 	{"CLOCK_REALTIME_COARSE", CLOCK_REALTIME_COARSE, &res, 0, 0,},
 	{"CLOCK_MONOTONIC_COARSE", CLOCK_MONOTONIC_COARSE, &res, 0, 0,},
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
