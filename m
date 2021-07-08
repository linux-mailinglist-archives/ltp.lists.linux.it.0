Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5FC3C13D7
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 15:07:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C207E3C792F
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 15:07:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 954A83C4DB0
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 15:07:02 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6113C1A01535
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 15:06:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625749612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5zfM+pn5pFc1QMqBfiaOZHDi/3dMPhXuAAqx/rwwXb4=;
 b=iE7CBFv9ZtYYng4dVoe9xUQzwtqOZr5CUb+CvTo8cMGZKJc/ukkTKn+6KmmlgD2Qd+AZ56
 JhbF3KqX4oohzhTQEA2e5aPUHwVUwKV4nH8wwyL+apT9rvvUwOYYf+2RwbU7jkWZly3+wm
 SOzFaM/SoqkUFFgEzU6MHtoupqBhhoM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-bBeClLpBOUu1yToLJH_17g-1; Thu, 08 Jul 2021 09:06:47 -0400
X-MC-Unique: bBeClLpBOUu1yToLJH_17g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA286804315;
 Thu,  8 Jul 2021 13:06:05 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com
 (dhcp-66-81-187.nay.redhat.com [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EC0B5D9FC;
 Thu,  8 Jul 2021 13:06:03 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Thu,  8 Jul 2021 21:06:02 +0800
Message-Id: <20210708130602.970689-1-liwang@redhat.com>
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
Subject: [LTP] [PATCH] gethostid: skip test if sethostid undefined
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

This is to avoid compiling error if the sethostid() is not
implemented, e.g. build with Alpine's musl-libc.

CI: https://github.com/wangli5665/ltp/runs/3019192920

Signed-off-by: Li Wang <liwang@redhat.com>
---
 configure.ac                                      | 1 +
 testcases/kernel/syscalls/gethostid/gethostid01.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/configure.ac b/configure.ac
index 1a43ebea8..25c421de0 100644
--- a/configure.ac
+++ b/configure.ac
@@ -128,6 +128,7 @@ AC_CHECK_FUNCS_ONCE([ \
     renameat2 \
     sched_getcpu \
     sendmmsg \
+    sethostid \
     setns \
     sigpending \
     splice \
diff --git a/testcases/kernel/syscalls/gethostid/gethostid01.c b/testcases/kernel/syscalls/gethostid/gethostid01.c
index 802604777..20e4cd307 100644
--- a/testcases/kernel/syscalls/gethostid/gethostid01.c
+++ b/testcases/kernel/syscalls/gethostid/gethostid01.c
@@ -26,6 +26,8 @@
 
 #include "tst_test.h"
 
+#ifdef HAVE_SETHOSTID
+
 static long origin;
 static long tc[] = {0x00000000, 0x0000ffff};
 
@@ -64,3 +66,7 @@ static struct tst_test test = {
 	.needs_root = 1,
 	.tcnt = ARRAY_SIZE(tc),
 };
+
+#else
+TST_TEST_TCONF("sethostid is undefined.");
+#endif
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
