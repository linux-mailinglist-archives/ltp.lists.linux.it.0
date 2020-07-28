Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E893230F1F
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 18:22:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F2DDF3C4C18
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 18:22:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 2EC3C3C5DAE
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 18:22:47 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 908FB200CE7
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 18:22:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595953365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gh7esSoUwIX0iaQCAfVMV9hyKu+1gSYXukML+VO/0NA=;
 b=ZqxGrdXPe4MFRG/p9TxQMhN2Mn3/L5zgjTTBGYv/BmJCAywpq9t2PkxzKqTKiO5oWK5W4C
 wkugVzYd/7WNgp6nqsnyMKhsAGC7XxX0eHOufxJzS931iqYU17itid3Lex8ZiLxIOt1K/b
 5Wl8soDQHHVFXfy89Xfs7KTf621U5As=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-eHfkS059Opi29WeWMI4K_w-1; Tue, 28 Jul 2020 12:22:43 -0400
X-MC-Unique: eHfkS059Opi29WeWMI4K_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7A591005504
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 16:22:42 +0000 (UTC)
Received: from centennial.enunes.eu.com (unknown [10.40.194.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 062E2712F7;
 Tue, 28 Jul 2020 16:22:41 +0000 (UTC)
From: Erico Nunes <ernunes@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 28 Jul 2020 18:22:06 +0200
Message-Id: <20200728162207.332109-2-ernunes@redhat.com>
In-Reply-To: <20200728162207.332109-1-ernunes@redhat.com>
References: <20200728162207.332109-1-ernunes@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/3] ioperm01: skip test if kernel is locked down
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

ioperm is restricted under kernel lockdown.

Signed-off-by: Erico Nunes <ernunes@redhat.com>
---
v2:
- update to skip the test here rather than relying on the helper
  function to skip.
---
 testcases/kernel/syscalls/ioperm/ioperm01.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/testcases/kernel/syscalls/ioperm/ioperm01.c b/testcases/kernel/syscalls/ioperm/ioperm01.c
index 4c5c0e6ea..c25baa678 100644
--- a/testcases/kernel/syscalls/ioperm/ioperm01.c
+++ b/testcases/kernel/syscalls/ioperm/ioperm01.c
@@ -42,6 +42,10 @@ static void verify_ioperm(void)
 
 static void setup(void)
 {
+	/* ioperm is restricted under kernel lockdown. */
+	if (tst_lockdown_enabled())
+		tst_brk(TCONF, "Kernel is locked down, skip this test");
+
 	/*
 	 * The value of IO_BITMAP_BITS (include/asm-i386/processor.h) changed
 	 * from kernel 2.6.8 to permit 16-bits ioperm
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
