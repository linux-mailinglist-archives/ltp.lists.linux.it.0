Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4F1330879
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 07:53:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C9413C4CFC
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 07:53:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 91BB53C0E16
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 07:53:38 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 77D7B6005E7
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 07:53:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615186416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AzHTCpbDv4iker58WsKlXoFkTEk3DAABxtkJL4loMoU=;
 b=UZ0QWhxs1LplcY6q6lteLapB8H7WViRH+kv1F08NX2sxxjDgoJM0n+KFcImPH/dlaktSaj
 RGKvspOglfr/bmZ0D/YQnHGsqxvaJOxrJmGokwbMwFQSb3BRbJPOlRhD/sqdtd+c7gDgjo
 ypda0nUlgRlakPGep/1JxGTYmZxz09M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-nXwOdaAJOIGKqPNeA-UfPw-1; Mon, 08 Mar 2021 01:53:34 -0500
X-MC-Unique: nXwOdaAJOIGKqPNeA-UfPw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 823A9801814;
 Mon,  8 Mar 2021 06:53:32 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F73B59452;
 Mon,  8 Mar 2021 06:53:30 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Mon,  8 Mar 2021 06:53:29 +0000
Message-Id: <20210308065329.25824-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] clock_gettime04: print more info to help debugging
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

We get some sporadically failures like below, but we don't know which
loop it comes from. So adding more prints to help locate issue.

  tst_test.c:1286: TINFO: Timeout per run is 0h 05m 00s
  vdso_helpers.c:76: TINFO: Couldn't find vdso_gettime64()
  clock_gettime04.c:157: TPASS: CLOCK_REALTIME: Difference between successive readings is reasonable
  clock_gettime04.c:150: TFAIL: CLOCK_REALTIME_COARSE: Difference between successive readings greater than 5 ms (1): 8
  clock_gettime04.c:157: TPASS: CLOCK_MONOTONIC: Difference between successive readings is reasonable
  clock_gettime04.c:150: TFAIL: CLOCK_MONOTONIC_COARSE: Difference between successive readings greater than 5 ms (0): 5
  clock_gettime04.c:157: TPASS: CLOCK_MONOTONIC_RAW: Difference between successive readings is reasonable
  clock_gettime04.c:157: TPASS: CLOCK_BOOTTIME: Difference between successive readings is reasonable

Btw, it occurs on a x86_64 (not virtualized) with kernel 5.11.0.

Signed-off-by: Li Wang <liwang@redhat.com>
---
 testcases/kernel/syscalls/clock_gettime/clock_gettime04.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
index 5f8264cc6..4dc9093c7 100644
--- a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
@@ -108,6 +108,9 @@ static void run(unsigned int i)
 			if (tv->clock_gettime == my_gettimeofday && clks[i] != CLOCK_REALTIME)
 				continue;
 
+			if (tv->clock_gettime && count == 10000)
+				tst_res(TINFO, "%s", tv->desc);
+
 			ret = tv->clock_gettime(clks[i], tst_ts_get(&ts));
 			if (ret) {
 				/*
-- 
2.21.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
