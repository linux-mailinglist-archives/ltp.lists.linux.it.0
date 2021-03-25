Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B5B348D43
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 10:43:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B2A143C0BAF
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 10:43:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id F160F3C0BAF
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 10:43:50 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 6153D200DCD
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 10:43:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616665428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lVpivXtw7hglUxNwAmZA8hKYEdg+OdbB6WBspLm5mv8=;
 b=RoWxrFQU9irkrxJ+trCGV3OR6FTKgqi1ocEX2qvIh7dBYdtyW3o03sgFUK7LYLjACKIcf0
 w08WUxZSLKuXu291ul3zefGh7jtgWQOT765ZSixjXSjgZ0xl4cckd+RgZ+OGxlUW1XOPwG
 KwyiakGgt47bSMA78G1vXCUTqhUauxY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-z-5q6tMIPcC3KhnCznRicQ-1; Thu, 25 Mar 2021 05:43:45 -0400
X-MC-Unique: z-5q6tMIPcC3KhnCznRicQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BE0E100A248
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 09:43:31 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com
 (dhcp-66-81-187.nay.redhat.com [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3594B5D9DE
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 09:43:28 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 25 Mar 2021 17:43:27 +0800
Message-Id: <20210325094327.332904-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [COMMITTED PATCH] brk02: to print errno if test fail
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
 testcases/kernel/syscalls/brk/brk02.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/testcases/kernel/syscalls/brk/brk02.c b/testcases/kernel/syscalls/brk/brk02.c
index cd4cfd1be..4a272bac3 100644
--- a/testcases/kernel/syscalls/brk/brk02.c
+++ b/testcases/kernel/syscalls/brk/brk02.c
@@ -26,30 +26,30 @@ void brk_down_vmas(void)
 	void *addr = brk_addr + page_size;
 
 	if (brk(addr)) {
-		tst_res(TFAIL, "Cannot expand brk() by page size");
+		tst_res(TFAIL | TERRNO, "Cannot expand brk() by page size");
 		return;
 	}
 
 	addr += page_size;
 	if (brk(addr)) {
-		tst_res(TFAIL, "Cannot expand brk() by 2x page size");
+		tst_res(TFAIL | TERRNO, "Cannot expand brk() by 2x page size");
 		return;
 	}
 
 	if (mprotect(addr - page_size, page_size,
 		     PROT_READ|PROT_WRITE|PROT_EXEC)) {
-		tst_res(TFAIL, "Cannot mprotect new VMA");
+		tst_res(TFAIL | TERRNO, "Cannot mprotect new VMA");
 		return;
 	}
 
 	addr += page_size;
 	if (brk(addr)) {
-		tst_res(TFAIL, "Cannot expand brk() after mprotect");
+		tst_res(TFAIL | TERRNO, "Cannot expand brk() after mprotect");
 		return;
 	}
 
 	if (brk(brk_addr)) {
-		tst_res(TFAIL, "Cannot restore brk() to start address");
+		tst_res(TFAIL | TERRNO, "Cannot restore brk() to start address");
 		return;
 	}
 
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
