Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DE04768C7
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Dec 2021 04:41:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F0CBE3C8EA3
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Dec 2021 04:41:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 55A033C8FBC
 for <ltp@lists.linux.it>; Thu, 16 Dec 2021 04:41:38 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E1866601072
 for <ltp@lists.linux.it>; Thu, 16 Dec 2021 04:41:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639626095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1a0iMQEcQmX8hr9BseYpfV8nHJj0NFkzFtDE9NYVHs=;
 b=Low9VS2fM93m26Mp+NzNDWo+MnYizwJu0GtVgsFLtt1ch0GG2EEkyiUO9TnrvZWUT7aLkn
 9bR2sV86vNMioRh5n1nxezyQ9exdoEnLMxRQlWaDSlnFbh1JyFLIi4cGn6hRdtXVZUSP1Q
 Odr4kPFTJdVbuf0uwew3n4WsYina5VY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-OVcVnm8bPraHePyoQgabig-1; Wed, 15 Dec 2021 22:41:29 -0500
X-MC-Unique: OVcVnm8bPraHePyoQgabig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FC941006AA1
 for <ltp@lists.linux.it>; Thu, 16 Dec 2021 03:41:28 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40A612A198
 for <ltp@lists.linux.it>; Thu, 16 Dec 2021 03:41:26 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 16 Dec 2021 11:41:23 +0800
Message-Id: <20211216034125.255907-1-liwang@redhat.com>
In-Reply-To: <CAEemH2d+-rqscLPdn8q0AEkKaCSkCZ-pET_E=eWWN7Z=aB1k0w@mail.gmail.com>
References: <CAEemH2d+-rqscLPdn8q0AEkKaCSkCZ-pET_E=eWWN7Z=aB1k0w@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Subject: [LTP] [PATCH 1/3] lib: add functions to adjust oom score
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

This introduces function to LTP for adjusting the oom_score_adj of
target process, which may be helpful in OOM tests to prevent kernel
killing the main or lib process during test running.

The exported global tst_enable_oom_protection function can be used
at anywhere you want to protect, but please remember that if you
do enable protection on a process($PID) that all the children will
inherit its score and be ignored by OOM Killer as well. So that's
why tst_cancel_oom_protection is recommended to combination in use.

Signed-off-by: Li Wang <liwang@redhat.com>
---
 include/tst_memutils.h | 12 ++++++++++++
 lib/tst_memutils.c     | 29 +++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/include/tst_memutils.h b/include/tst_memutils.h
index f605f544e..e569aef8d 100644
--- a/include/tst_memutils.h
+++ b/include/tst_memutils.h
@@ -25,4 +25,16 @@ void tst_pollute_memory(size_t maxsize, int fillchar);
  */
 long long tst_available_mem(void);
 
+/*
+ * Enable OOM protection to prevent process($PID) being killed by OOM Killer.
+ *   echo -1000 >/proc/$PID/oom_score_adj
+ */
+void tst_enable_oom_protection(pid_t pid);
+
+/*
+ * Cancel the OOM protection for the process($PID).
+ *   echo 0 >/proc/$PID/oom_score_adj
+ */
+void tst_cancel_oom_protection(pid_t pid);
+
 #endif /* TST_MEMUTILS_H__ */
diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
index bd09cf6fa..b9b85677b 100644
--- a/lib/tst_memutils.c
+++ b/lib/tst_memutils.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2020 SUSE LLC <mdoucha@suse.cz>
  */
 
+#include <stdio.h>
 #include <unistd.h>
 #include <limits.h>
 #include <sys/sysinfo.h>
@@ -91,3 +92,31 @@ long long tst_available_mem(void)
 
 	return mem_available;
 }
+
+static void set_oom_score_adj(pid_t pid, int value)
+{
+	int val;
+	char score_path[64];
+
+	if (access("/proc/self/oom_score_adj", F_OK) == -1) {
+		tst_res(TINFO, "Warning: oom_score_adj is not exist");
+		return;
+	}
+
+	sprintf(score_path, "/proc/%d/oom_score_adj", pid);
+	SAFE_FILE_PRINTF(score_path, "%d", value);
+
+	SAFE_FILE_SCANF(score_path, "%d", &val);
+	if (val != value)
+		tst_brk(TBROK, "oom_score_adj = %d, but expect %d.", val, value);
+}
+
+void tst_enable_oom_protection(pid_t pid)
+{
+	set_oom_score_adj(pid, -1000);
+}
+
+void tst_cancel_oom_protection(pid_t pid)
+{
+	set_oom_score_adj(pid, 0);
+}
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
