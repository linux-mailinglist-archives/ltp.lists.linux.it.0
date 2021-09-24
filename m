Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5305C416C85
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Sep 2021 09:08:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 052623C8F23
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Sep 2021 09:08:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 45F103C1B72
 for <ltp@lists.linux.it>; Fri, 24 Sep 2021 09:08:09 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 02AC11A017B1
 for <ltp@lists.linux.it>; Fri, 24 Sep 2021 09:08:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632467286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kmPdDyyaHTJBFyXN1DJQPO1BQv5AtBOrwMw+tYRwg1I=;
 b=MHmgcCQPjpjU2Pp1L7btMRwRB4RQR+W6+/ocWc3qAabbNJ7cfk9Rg3ZnGzyKFsMwuEoRGj
 dc4F9JbrkLmXPX/IDzB6FJUGaPfp3LON68E4uiTjPgZ4dJy9GLTWAo8pBuJtEFLiQ6R1xg
 K2C/U5F0wtSEd8U8J2I7IWoYD9vCXcI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-X7Fjy89IM5y1OyPx1QJn6Q-1; Fri, 24 Sep 2021 03:08:03 -0400
X-MC-Unique: X7Fjy89IM5y1OyPx1QJn6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CBB81084684;
 Fri, 24 Sep 2021 07:08:02 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3E0419724;
 Fri, 24 Sep 2021 07:07:57 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Fri, 24 Sep 2021 15:07:54 +0800
Message-Id: <20210924070756.3916953-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Subject: [LTP] [PATCH 1/3] lib: add tst_available_mem function
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

tst_available_mem helps to get the value of MemAvailable
from /proc/meminfo, if no support on older kernels,
return 'MemFree + Cached' for instead.

Signed-off-by: Li Wang <liwang@redhat.com>
---
 include/tst_memutils.h |  6 ++++++
 lib/tst_memutils.c     | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/tst_memutils.h b/include/tst_memutils.h
index 91dad07cd..f605f544e 100644
--- a/include/tst_memutils.h
+++ b/include/tst_memutils.h
@@ -19,4 +19,10 @@
  */
 void tst_pollute_memory(size_t maxsize, int fillchar);
 
+/*
+ * Read the value of MemAvailable from /proc/meminfo, if no support on
+ * older kernels, return 'MemFree + Cached' for instead.
+ */
+long long tst_available_mem(void);
+
 #endif /* TST_MEMUTILS_H__ */
diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
index 70b60091f..69077861f 100644
--- a/lib/tst_memutils.c
+++ b/lib/tst_memutils.c
@@ -62,3 +62,16 @@ void tst_pollute_memory(size_t maxsize, int fillchar)
 
 	free(map_blocks);
 }
+
+long long tst_available_mem(void)
+{
+	long long mem_available;
+
+	if (FILE_LINES_SCANF("/proc/meminfo", "MemAvailable: %ld",
+		&mem_available)) {
+		mem_available = SAFE_READ_MEMINFO("MemFree:")
+			+ SAFE_READ_MEMINFO("Cached:");
+	}
+
+	return mem_available;
+}
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
