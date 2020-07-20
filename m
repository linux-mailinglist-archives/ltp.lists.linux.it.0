Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C1693226F44
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 21:50:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 83F453C4E1E
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 21:50:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 5CD063C4E25
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 21:49:58 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id A840D600484
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 21:48:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595274595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bBSAw9dAcQt5+BTgXGU6x/rZUmiV3cEVfmSu1H22Aq8=;
 b=gVzbOtZSD06UaoUZateaD6vDwhDx697HwCZpteX+j+1cX8e6bPjrhzP4kF3puRlFRgrH+6
 a27EF3TPApLJE716iFfN7VKXwzeKfOlEolHKB6cyxIWMT2YFKH4kzghywGU4QNP4tGYH+P
 i8KAHmEZ6O0VKDxrxdQI//izbqBDItU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-utRZWuELNoqK2OGQFW3gmw-1; Mon, 20 Jul 2020 15:49:53 -0400
X-MC-Unique: utRZWuELNoqK2OGQFW3gmw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CCBF100AA23
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 19:49:51 +0000 (UTC)
Received: from centennial.enunes.eu.com (unknown [10.40.192.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACDF210027AC;
 Mon, 20 Jul 2020 19:49:50 +0000 (UTC)
From: Erico Nunes <ernunes@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 20 Jul 2020 21:49:19 +0200
Message-Id: <20200720194920.22784-2-ernunes@redhat.com>
In-Reply-To: <20200720194920.22784-1-ernunes@redhat.com>
References: <20200720194920.22784-1-ernunes@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] ioperm01: skip test if kernel is locked down
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
 testcases/kernel/syscalls/ioperm/ioperm01.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/testcases/kernel/syscalls/ioperm/ioperm01.c b/testcases/kernel/syscalls/ioperm/ioperm01.c
index 4c5c0e6ea..d1d633b20 100644
--- a/testcases/kernel/syscalls/ioperm/ioperm01.c
+++ b/testcases/kernel/syscalls/ioperm/ioperm01.c
@@ -42,6 +42,9 @@ static void verify_ioperm(void)
 
 static void setup(void)
 {
+	/* ioperm is restricted under kernel lockdown. */
+	tst_lockdown_skip();
+
 	/*
 	 * The value of IO_BITMAP_BITS (include/asm-i386/processor.h) changed
 	 * from kernel 2.6.8 to permit 16-bits ioperm
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
