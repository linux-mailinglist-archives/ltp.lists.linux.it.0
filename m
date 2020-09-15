Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A06C269C5B
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 05:14:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA2FC3C4F26
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 05:14:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C9EEB3C2551
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 05:14:15 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 43583600951
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 05:14:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600139653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GQ5ekS82m9UdkP/Tqogxen220mo8LiydlyDbFnyXfVA=;
 b=bVqTbNN4u/aUOgmpWR20sdpmPIKA0h3t1fIACpp/BayQD01MekqTCA5GefuT6+TiMKBTKI
 JQWvStq1B+Zfc1/ZbYlWy3UlhcHtqD1QCnJHBBy6pH/IAYOsLgkRQQQ5DOLNfQ2Y37oeSA
 cx5I9uN9e2657c1eHhmNs2fwcvUws58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-X9RjodDeOFKKQRMucGi0hQ-1; Mon, 14 Sep 2020 23:14:11 -0400
X-MC-Unique: X9RjodDeOFKKQRMucGi0hQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6D8481C478;
 Tue, 15 Sep 2020 03:14:10 +0000 (UTC)
Received: from liwang-laptop.redhat.com (ovpn-12-95.pek2.redhat.com
 [10.72.12.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8105475137;
 Tue, 15 Sep 2020 03:14:09 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 15 Sep 2020 11:14:02 +0800
Message-Id: <20200915031402.26519-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] clock_gettime04: relax the time diff in VM
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

To balance that the test inside a VM can NOT get enough CPU time, which
result in sporadically fails with the time comparing.

clock_gettime04.c:155: PASS: CLOCK_REALTIME: Difference between successive readings is reasonable
clock_gettime04.c:155: PASS: CLOCK_REALTIME_COARSE: Difference between successive readings is reasonable
clock_gettime04.c:148: FAIL: CLOCK_MONOTONIC: Difference between successive readings greater than 5 ms (2): 22
clock_gettime04.c:155: PASS: CLOCK_MONOTONIC_COARSE: Difference between successive readings is reasonable
clock_gettime04.c:148: FAIL: CLOCK_MONOTONIC_RAW: Difference between successive readings greater than 5 ms (1): 22
clock_gettime04.c:148: FAIL: CLOCK_BOOTTIME: Difference between successive readings greater than 5 ms (1): 29

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../kernel/syscalls/clock_gettime/clock_gettime04.c      | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
index 2f484c43f..5c4a5d751 100644
--- a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
@@ -92,6 +92,7 @@ static void run(unsigned int i)
 	struct test_variants *tv;
 	int count = 10000, ret;
 	unsigned int j;
+	int virt_env = tst_is_virt(VIRT_ANY);
 
 	do {
 		for (j = 0; j < ARRAY_SIZE(variants); j++) {
@@ -143,11 +144,17 @@ static void run(unsigned int i)
 
 			diff /= 1000000;
 
-			if (diff >= 5) {
+			if (!virt_env && diff >= 5) {
 				tst_res(TFAIL, "%s: Difference between successive readings greater than 5 ms (%d): %lld",
 					tst_clock_name(clks[i]), j, diff);
 				return;
 			}
+
+			if (virt_env && diff >= 50) {
+				tst_res(TFAIL, "%s: Difference between successive readings(in VM) greater than 50 ms (%d): %lld",
+					tst_clock_name(clks[i]), j, diff);
+				return;
+			}
 		}
 	} while (--count);
 
-- 
2.21.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
