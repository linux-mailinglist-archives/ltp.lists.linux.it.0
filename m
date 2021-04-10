Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D1935AB5E
	for <lists+linux-ltp@lfdr.de>; Sat, 10 Apr 2021 08:31:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D5773C1D71
	for <lists+linux-ltp@lfdr.de>; Sat, 10 Apr 2021 08:31:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 223F23C1D47
 for <ltp@lists.linux.it>; Sat, 10 Apr 2021 08:31:16 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 690A8600E59
 for <ltp@lists.linux.it>; Sat, 10 Apr 2021 08:31:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618036274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MaUvLQnvDKmKysL8rYykoL6gzUwoqSD25mNmkxpn8kg=;
 b=U7harIh8QP4SklgRBWQhMwxrzRTIrGS7Y+I5vOH4fW2DjyqcPHxGoUveJm7HTA4z2G/nU+
 A4Kr6Skj77/1PJysevIkZ00i5Cp4UpzuYGwkl//aztNIWAAswCbSj96Cs0OAII1knYuWxE
 /h+g7YNDSlSctffofoFn3JOY/1EcGr0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-zmg6k2MlMVyMEAkHpAYmoQ-1; Sat, 10 Apr 2021 02:31:12 -0400
X-MC-Unique: zmg6k2MlMVyMEAkHpAYmoQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5DBC802B40
 for <ltp@lists.linux.it>; Sat, 10 Apr 2021 06:31:11 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com
 (dhcp-66-81-187.nay.redhat.com [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D999871282
 for <ltp@lists.linux.it>; Sat, 10 Apr 2021 06:31:09 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Sat, 10 Apr 2021 14:31:08 +0800
Message-Id: <20210410063108.196841-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Subject: [LTP] [COMMITTED PATCH] clock_gettime04: add linux-git commmit in
 tst_tag
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

Signed-off-by: Li Wang <liwang@redhat.com>
---
 .../syscalls/clock_gettime/clock_gettime04.c     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
index 4a395f394..a8d2c5b38 100644
--- a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
@@ -2,9 +2,21 @@
 /*
  * Copyright (c) 2020 Linaro Limited. All rights reserved.
  * Author: Viresh Kumar<viresh.kumar@linaro.org>
+ */
+
+/*\
+ * [Description]
  *
  * Check time difference between successive readings and report a bug if
  * difference found to be over 5 ms.
+ *
+ * This test reports a s390x BUG which has been fixed in:
+ *
+ *    commit 5b43bd184530af6b868d8273b0a743a138d37ee8
+ *    Author: Heiko Carstens <hca@linux.ibm.com>
+ *    Date:   Wed Mar 24 20:23:55 2021 +0100
+ *
+ *    s390/vdso: fix initializing and updating of vdso_data
  */
 
 #include "config.h"
@@ -167,4 +179,8 @@ static struct tst_test test = {
 	.test = run,
 	.setup = setup,
 	.tcnt = ARRAY_SIZE(clks),
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "5b43bd184530"},
+		{}
+	}
 };
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
