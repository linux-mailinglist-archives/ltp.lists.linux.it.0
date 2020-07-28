Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF08230F21
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 18:23:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5AC983C26B2
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 18:23:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 979AB3C5DB5
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 18:22:59 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 19F3F1A01CE4
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 18:22:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595953374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O7+Uh0d6cD3Viwn6qaWJS3q+OqUK2nKlSD38iVUwg5s=;
 b=XAZn848nXnO9N9BrdaPzXeLoMiKv1tAJlehzQ7dtoYbYlCUc5EnXINb1831l/T5o5CQs0d
 830eYkA+ye7NQdbft1M/4KnmB0mWFJCqIVzQ7+5YMHZ8yYDjUOEk3o6najm8Zu+wVt5fM/
 6dh+T6bOkYiGHCt4x/dxXiSSuTAcLhY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-NDRUlmmpPPCd-m1Eg-BQGA-1; Tue, 28 Jul 2020 12:22:48 -0400
X-MC-Unique: NDRUlmmpPPCd-m1Eg-BQGA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 340021005504
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 16:22:47 +0000 (UTC)
Received: from centennial.enunes.eu.com (unknown [10.40.194.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B577712F2;
 Tue, 28 Jul 2020 16:22:46 +0000 (UTC)
From: Erico Nunes <ernunes@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 28 Jul 2020 18:22:07 +0200
Message-Id: <20200728162207.332109-3-ernunes@redhat.com>
In-Reply-To: <20200728162207.332109-1-ernunes@redhat.com>
References: <20200728162207.332109-1-ernunes@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/3] iopl01: skip test if kernel is locked down
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

iopl is restricted under kernel lockdown.

Signed-off-by: Erico Nunes <ernunes@redhat.com>
---
v2:
- update to skip the test here rather than relying on the helper
  function to skip.
---
 testcases/kernel/syscalls/iopl/iopl01.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/testcases/kernel/syscalls/iopl/iopl01.c b/testcases/kernel/syscalls/iopl/iopl01.c
index edf586cd1..e5ec1147f 100644
--- a/testcases/kernel/syscalls/iopl/iopl01.c
+++ b/testcases/kernel/syscalls/iopl/iopl01.c
@@ -42,6 +42,14 @@ static void verify_iopl(void)
 	}
 }
 
+static void setup(void)
+{
+	/* iopl is restricted under kernel lockdown. */
+	if (tst_lockdown_enabled())
+		tst_brk(TCONF, "Kernel is locked down, skip this test");
+
+}
+
 static void cleanup(void)
 {
 	/*
@@ -54,6 +62,7 @@ static void cleanup(void)
 static struct tst_test test = {
 	.test_all = verify_iopl,
 	.needs_root = 1,
+	.setup = setup,
 	.cleanup = cleanup,
 };
 
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
