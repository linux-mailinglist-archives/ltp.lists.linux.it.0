Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 22528377000
	for <lists+linux-ltp@lfdr.de>; Sat,  8 May 2021 08:13:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD5E23C5535
	for <lists+linux-ltp@lfdr.de>; Sat,  8 May 2021 08:13:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7FB203C54E7
 for <ltp@lists.linux.it>; Sat,  8 May 2021 08:13:00 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B68471A000A7
 for <ltp@lists.linux.it>; Sat,  8 May 2021 08:12:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620454378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+eRUjVD1ZrH7S0CcBS71h3P0nvSsTc0nfy/KQ7wE2UE=;
 b=RUMajcLu5zzcmbgwfl3ikJ89KMiyLjMRswmld6RPBsPyCKBQTKFqFkrRfw4BAcflcgFdn9
 +ABnzKBuqNkWFnxLcRxsQo4DKCgmbtBkBGLXrtF6mHzXs3vzTkCRU1ZikwvPvpXH9Cxex+
 1NTo46Bz8AtQ27Qff2CD/yIg6LaOSZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-1V265Xj2OCm3LuHfYmsaRg-1; Sat, 08 May 2021 02:12:56 -0400
X-MC-Unique: 1V265Xj2OCm3LuHfYmsaRg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C8E4801B12;
 Sat,  8 May 2021 06:12:55 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com
 (dhcp-66-81-187.nay.redhat.com [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 425E45D740;
 Sat,  8 May 2021 06:12:54 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Sat,  8 May 2021 14:12:52 +0800
Message-Id: <20210508061252.18337-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Subject: [LTP] [PATCH] syscall: remove PROT_WRITE|PROT_EXEC from brk02
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
Cc: Liam Howlett <liam.howlett@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

We got permission denied while performing the brk02 on x86_64/s390x
(kernel-4.18). After looking at the manual page of mprotect(), seems
the access issue caused by PROT_EXEC.

 " POSIX says that the behavior of mprotect() is unspecified if it is
 applied to a region of memory that was not obtained via mmap(2). "

 # ./brk02
 tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s
 brk02.c:41: TFAIL: Cannot mprotect new VMA

From Liam Howlett:
 Just removing the PROT_EXEC invalidates the test. However, if both
 PROT_EXEC and PROT_WRITE are removed, then the test still does what
 is intended.

So let's remove 'PROT_WRITE|PROT_EXEC' to make brk02 PASS with
all platforms.

Suggested-by: Liam Howlett <liam.howlett@oracle.com>
Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/brk/brk02.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/brk/brk02.c b/testcases/kernel/syscalls/brk/brk02.c
index 4a272bac3..11e803cb4 100644
--- a/testcases/kernel/syscalls/brk/brk02.c
+++ b/testcases/kernel/syscalls/brk/brk02.c
@@ -36,8 +36,7 @@ void brk_down_vmas(void)
 		return;
 	}
 
-	if (mprotect(addr - page_size, page_size,
-		     PROT_READ|PROT_WRITE|PROT_EXEC)) {
+	if (mprotect(addr - page_size, page_size, PROT_READ)) {
 		tst_res(TFAIL | TERRNO, "Cannot mprotect new VMA");
 		return;
 	}
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
