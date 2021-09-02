Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB9C3FEC5A
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 12:46:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F6123C9953
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 12:46:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3BBEE3C2BD6
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 12:46:02 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7BD4310009A3
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 12:46:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630579559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=l2KcxtsMnz07vPaJT3gNgbTvgvbGF/2Fx1sepMeU3RQ=;
 b=TTiAp81jD0G6VJB+7ksYNQ9VQAq2/ysM531gWoZmeDkJFfCRv2HfihRFCLnHak2k6Nbnsi
 id0OV+gkrHzAsNLRJF80CV4yfP94w0dF278n7O++Icz/uWmpycaxsqEHRVMsbPEe0mbGGI
 PiYsisqFxRjpXaSDYP0msUM3okBPBRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-M7dWhMyjP2O7Evlr278nRw-1; Thu, 02 Sep 2021 06:45:56 -0400
X-MC-Unique: M7dWhMyjP2O7Evlr278nRw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C79F835DE0
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 10:45:55 +0000 (UTC)
Received: from liwang-laptop.redhat.com (ovpn-13-57.pek2.redhat.com
 [10.72.13.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 365F35D6B1
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 10:45:53 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Thu,  2 Sep 2021 18:45:51 +0800
Message-Id: <20210902104551.58293-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [RFC PATCH] copy_file_range03: comparing timestamp with
 tst_timespec_diff
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

The st_mtime field is defined as st_mtim.tv_sec for backward
compatibility in struct stat, which might not precise enough
for timestamp comparing.

Similar issue as:
  https://lists.linux.it/pipermail/ltp/2020-November/019982.html

Here switch to timespec diff (with compare nanosecond as well) to
get rid of this kind of rare faliure:

   7	tst_test.c:1345: TINFO: Timeout per run is 0h 05m 00s
   8	copy_file_range.h:36: TINFO: Testing libc copy_file_range()
   9	copy_file_range03.c:48: TPASS: copy_file_range sucessfully updated the timestamp
   10	tst_test.c:1345: TINFO: Timeout per run is 0h 05m 00s
   11	copy_file_range.h:39: TINFO: Testing __NR_copy_file_range syscall
   12	copy_file_range03.c:46: TFAIL: copy_file_range did not update timestamp.

Signed-off-by: Li Wang <liwang@redhat.com>
---
 .../syscalls/copy_file_range/copy_file_range03.c  | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c
index 253eb57ad..5d055e6ba 100644
--- a/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c
@@ -12,25 +12,26 @@
 #define _GNU_SOURCE
 
 #include "tst_test.h"
+#include "tst_timer.h"
 #include "copy_file_range.h"
 
 static int fd_src;
 static int fd_dest;
 
-unsigned long get_timestamp(int fd)
+struct timespec get_timestamp(int fd)
 {
 	struct stat filestat;
 
 	fstat(fd, &filestat);
-	return filestat.st_mtime;
+	return filestat.st_mtim;
 }
 
 static void verify_copy_file_range_timestamp(void)
 {
 	loff_t offset;
-	unsigned long timestamp, updated_timestamp;
+	struct timespec timestamp1, timestamp2, diff;
 
-	timestamp = get_timestamp(fd_dest);
+	timestamp1 = get_timestamp(fd_dest);
 	usleep(1000000);
 
 	offset = 0;
@@ -40,9 +41,11 @@ static void verify_copy_file_range_timestamp(void)
 		tst_brk(TBROK | TTERRNO,
 				"copy_file_range unexpectedly failed");
 
-	updated_timestamp = get_timestamp(fd_dest);
+	timestamp2 = get_timestamp(fd_dest);
 
-	if (timestamp == updated_timestamp)
+	diff = tst_timespec_diff(timestamp1, timestamp2);
+
+	if (!diff.tv_sec && !diff.tv_nsec)
 		tst_brk(TFAIL, "copy_file_range did not update timestamp.");
 
 	tst_res(TPASS, "copy_file_range sucessfully updated the timestamp");
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
