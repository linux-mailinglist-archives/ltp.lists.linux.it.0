Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E71332021
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 09:00:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B34C3C5546
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 09:00:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 0FEBB3C3236
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 09:00:36 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 352621A00E03
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 09:00:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615276834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QX7+Ug33TW2avvSh9SMw7M4DpuUhhJPLtOvyWS+0No0=;
 b=KxsmoCtHG3aV97fBzjnmLmgpHk4NJndId/Sbiko+mKd45PKZaHMp7bPoj1NiTgSD9mMg6G
 aA0nXkK/Q1H3Q0QSMgY5Y2Uj60ePySEaDNbESVLWqrE9p0bLYiSgOhPwXTfW8jyS81+icr
 qOIHHY6Cy7IG6tePpLjpvdP+vGRHa24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-b1qiVX7INUKz2odQEotcgg-1; Tue, 09 Mar 2021 03:00:32 -0500
X-MC-Unique: b1qiVX7INUKz2odQEotcgg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 561E21084CAA;
 Tue,  9 Mar 2021 08:00:31 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42E565D9DB;
 Tue,  9 Mar 2021 08:00:29 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Tue,  9 Mar 2021 08:00:28 +0000
Message-Id: <20210309080028.16284-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCh v2] clock_gettime04: print more info to help debugging
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
Cc: viresh.kumar@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

We catch some sporadically failures[1] like below, but we don't know which
test loop it comes from. So adding more prints to help locate issue.

  tst_test.c:1286: TINFO: Timeout per run is 0h 05m 00s
  vdso_helpers.c:76: TINFO: Couldn't find vdso_gettime64()
  clock_gettime04.c:157: TPASS: CLOCK_REALTIME: Difference between successive readings is reasonable
  clock_gettime04.c:150: TFAIL: CLOCK_REALTIME_COARSE: Difference between successive readings greater than 5 ms (1): 8
  clock_gettime04.c:157: TPASS: CLOCK_MONOTONIC: Difference between successive readings is reasonable
  clock_gettime04.c:150: TFAIL: CLOCK_MONOTONIC_COARSE: Difference between successive readings greater than 5 ms (0): 5
  clock_gettime04.c:157: TPASS: CLOCK_MONOTONIC_RAW: Difference between successive readings is reasonable
  clock_gettime04.c:157: TPASS: CLOCK_BOOTTIME: Difference between successive readings is reasonable

After patching, it will show more details about the iteration:

  tst_test.c:1288: TINFO: Timeout per run is 0h 05m 00s
  vdso_helpers.c:76: TINFO: Couldn't find vdso_gettime64()
  clock_gettime04.c:158: TPASS: CLOCK_REALTIME: Difference between successive readings is reasonable for following variants:
  clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
  clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
  clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec
  clock_gettime04.c:162: TINFO:   - gettimeofday
  clock_gettime04.c:158: TPASS: CLOCK_REALTIME_COARSE: Difference between successive readings is reasonable for following variants:
  clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
  clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
  clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec
  clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC: Difference between successive readings is reasonable for following variants:
  clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
  clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
  clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec
  clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC_COARSE: Difference between successive readings is reasonable for following variants:
  clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
  clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
  clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec
  clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC_RAW: Difference between successive readings is reasonable for following variants:
  clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
  clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
  clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec
  clock_gettime04.c:158: TPASS: CLOCK_BOOTTIME: Difference between successive readings is reasonable for following variants:
  clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
  clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
  clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec

[1] it occurs on a x86_64 (not virtualized) with kernel 5.11.0.

Signed-off-by: Li Wang <liwang@redhat.com>
---
 .../kernel/syscalls/clock_gettime/clock_gettime04.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
index 5f8264cc6..4a395f394 100644
--- a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
@@ -147,15 +147,20 @@ static void run(unsigned int i)
 			diff /= 1000000;
 
 			if (diff >= delta) {
-				tst_res(TFAIL, "%s: Difference between successive readings greater than %lld ms (%d): %lld",
-					tst_clock_name(clks[i]), delta, j, diff);
+				tst_res(TFAIL, "%s(%s): Difference between successive readings greater than %lld ms (%d): %lld",
+					tst_clock_name(clks[i]), tv->desc, delta, j, diff);
 				return;
 			}
 		}
 	} while (--count);
 
-	tst_res(TPASS, "%s: Difference between successive readings is reasonable",
-		tst_clock_name(clks[i]));
+	tst_res(TPASS, "%s: Difference between successive readings is reasonable for following variants:",
+			tst_clock_name(clks[i]));
+	for (j = 0; j < ARRAY_SIZE(variants); j++) {
+		if (variants[j].clock_gettime == my_gettimeofday && clks[i] != CLOCK_REALTIME)
+			continue;
+		tst_res(TINFO, "\t- %s", variants[j].desc);
+	}
 }
 
 static struct tst_test test = {
-- 
2.21.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
