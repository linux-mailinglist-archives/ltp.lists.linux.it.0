Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A39563D3B00
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 15:20:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B1393C6947
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 15:20:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5648A3C5613
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 15:20:20 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6B25E201083
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 15:20:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627046418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zta2ARHEYuVdRM+HMS07bLfEKBP1oqPYuy+8OXVb4ls=;
 b=fi8TrSswoZFGWaZ7VrHZYGKhYf/W4fUQLoUxSdPyaKphX6ojwM2c7bWABNEhWJ0mBPVPKh
 7cP1s61UjzZEitJJwmBVATfkTehFAaJM4nWModkmVY4QLysKqnCOgvaT6vJ3RE9VWrUiA8
 aBTFOFEIZlfQVxHwzfzR+dt70eesWM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-MI5DR80gNiC3gCLXjCpHUg-1; Fri, 23 Jul 2021 09:20:16 -0400
X-MC-Unique: MI5DR80gNiC3gCLXjCpHUg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5C1C184E161
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 13:20:14 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.40.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4374A10023B0
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 13:20:13 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Fri, 23 Jul 2021 15:19:57 +0200
Message-Id: <15dd5ab99369da3cba33a748d1bf05be145ef373.1627046193.git.jstancek@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] clock_gettime01: avoid zero exec runtime due to irq
 and steal time accounting
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

Test is sporadically failing on KVM guests with zero-ed timespec
returned by CLOCK_{PROCESS,THREAD}_CPUTIME_ID. This can be reproduced
on kernels v4.18 and v5.13-rc3 which have IRQ and PARAVIRT TIME
ACCOUNTING enabled.

Task exectime is usually updated on call of clock_gettime().
But update_rq_clock_task() may not update clock_task if there's
more unaccounted irq or steal time than rq->clock delta since
last call. In this instance rq->clock_task does not advance
and it is left for next update to account rest. Because LTP
test is quick and checks only once, it sometimes sees zero
timespec and treats it as failure.

Add a small warm-up to setup() in form of busy loop, to make
sure that clock_task advanced. In case of bug we would either
hit a timeout or still report zeroed timespec.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 .../kernel/syscalls/clock_gettime/clock_gettime01.c      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime01.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime01.c
index be9573afcc8e..11da39cf07cf 100644
--- a/testcases/kernel/syscalls/clock_gettime/clock_gettime01.c
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime01.c
@@ -73,7 +73,15 @@ static struct time64_variants variants[] = {
 
 static void setup(void)
 {
+	long unsigned utime;
+
 	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+
+	do {
+		SAFE_FILE_SCANF("/proc/self/stat",
+			"%*d %*s %*c %*d %*d %*d %*d %*d %*u %*u %*u %*u %*u %lu",
+			&utime);
+	} while (utime == 0);
 }
 
 static void verify_clock_gettime(unsigned int i)
@@ -118,4 +126,5 @@ static struct tst_test test = {
 	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.needs_root = 1,
+	.timeout = 10,
 };
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
