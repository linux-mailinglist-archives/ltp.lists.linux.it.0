Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 550E326A133
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 10:44:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 14EBA3C2B47
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 10:44:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id E8DCC3C1C7A
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 10:44:15 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 4A3C1200BD7
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 10:44:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600159453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+ig9CSIGhxGHxN4FwFxZU7xNnQoErluUKfOYMDFuE/M=;
 b=LziMhlXFTlJaypuMAHqcl7Pk7XpKWJJasyEHBvpXlKSo/zfm/oiRQmlyrL01HnaZ3ligJA
 oViJYCTp0Ta1WnqPl0rJ3Fh8MXoWKEv0xC6QqCmkUv4EAN9D2lGaNZhDmau5PmC0bYclKi
 EjHAiQy24KjdeTvhjyHwMBLai5cLzM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-jnp4gdKFPHGdGu5yz9somA-1; Tue, 15 Sep 2020 04:44:11 -0400
X-MC-Unique: jnp4gdKFPHGdGu5yz9somA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C783B64089;
 Tue, 15 Sep 2020 08:44:10 +0000 (UTC)
Received: from liwang-laptop.redhat.com (ovpn-12-247.pek2.redhat.com
 [10.72.12.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C43497B7D5;
 Tue, 15 Sep 2020 08:44:08 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 15 Sep 2020 16:44:06 +0800
Message-Id: <20200915084406.8633-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] clock_gettime04: multiply the timediff if test in
 VM
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
Cc: Cyril Hrubis <chrubis@suse.cz>
---
 .../kernel/syscalls/clock_gettime/clock_gettime04.c  | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
index 2f484c43f..be872d9aa 100644
--- a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
@@ -22,6 +22,7 @@ clockid_t clks[] = {
 };
 
 static gettime_t ptr_vdso_gettime, ptr_vdso_gettime64;
+static long long DELTA = 5;
 
 static inline int do_vdso_gettime(gettime_t vdso, clockid_t clk_id, void *ts)
 {
@@ -82,6 +83,11 @@ static struct test_variants {
 
 static void setup(void)
 {
+	if (tst_is_virt(VIRT_ANY)) {
+		tst_res(TINFO, "Running in a virtual machine, multiply the DELTA by 10.");
+		DELTA *= 10;
+	}
+
 	find_clock_gettime_vdso(&ptr_vdso_gettime, &ptr_vdso_gettime64);
 }
 
@@ -143,9 +149,9 @@ static void run(unsigned int i)
 
 			diff /= 1000000;
 
-			if (diff >= 5) {
-				tst_res(TFAIL, "%s: Difference between successive readings greater than 5 ms (%d): %lld",
-					tst_clock_name(clks[i]), j, diff);
+			if (diff >= DELTA) {
+				tst_res(TFAIL, "%s: Difference between successive readings greater than %lld ms (%d): %lld",
+					tst_clock_name(clks[i]), DELTA, j, diff);
 				return;
 			}
 		}
-- 
2.21.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
