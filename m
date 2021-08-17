Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9313EEB2F
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Aug 2021 12:46:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7C3A93C57D4
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Aug 2021 12:46:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6414B3C56D3
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 12:46:35 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 67EB76008C6
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 12:46:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629197193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Uh47/8tEt1Ua2OvUs/oGV8+rBpqsRoW0nlqAA2cnXTQ=;
 b=fjAUWRnqqUFm78NoOd4GdIjwh/BMn75r/Vcn0kWcBR2OVPMhF6oEmdEYIC4XqmNHV6d5qN
 FCNxWrc2R0aOom6ezmIpRPIxH0o0bpJ0JALUadP+p3Q2qpJSrTDuIYpa1TIOxR4K+g9z0l
 3s/sWj+NaHjzzPqk6V/JH7gyE0GoMmA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-rmslz1J-OeuVdaFIQ4nbjQ-1; Tue, 17 Aug 2021 06:46:31 -0400
X-MC-Unique: rmslz1J-OeuVdaFIQ4nbjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 178E31008064;
 Tue, 17 Aug 2021 10:46:30 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D167260C81;
 Tue, 17 Aug 2021 10:46:27 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 17 Aug 2021 18:46:25 +0800
Message-Id: <20210817104625.2559362-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Subject: [LTP] [RFC PATCH] fallocate05: increase the fallocate and
 defallocate size
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

The last write(fd, buf, 10) in the test is used to detect whether
'FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE' deallocating file space
success or not.

But it is not to be a reliable way on returning ENOSPEC if the defallocated
space is too small(only 4 blocks, x86_64). That's because filesystem metadata
might be extending to occupy that space during punch a hole.

Better to increase the size of fallocate/defallocate to reduce interference
from metadata changing.

    33	tst_test.c:1410: TINFO: Testing on ext4
    34	tst_test.c:914: TINFO: Formatting /dev/loop0 with ext4 opts='' extra opts=''
    35	mke2fs 1.45.6 (20-Mar-2020)
    36	tst_test.c:1342: TINFO: Timeout per run is 0h 05m 00s
    37	tst_fill_fs.c:32: TINFO: Creating file mntpoint/file0 size 21710183
        ...
    46	tst_fill_fs.c:32: TINFO: Creating file mntpoint/file9 size 36207821
    47	tst_fill_fs.c:32: TINFO: Creating file mntpoint/file10 size 81483962
    48	tst_fill_fs.c:59: TINFO: write(): ENOSPC (28)
    49	fallocate05.c:81: TPASS: write() wrote 65536 bytes
    50	fallocate05.c:102: TINFO: fallocate()d 0 extra blocks on full FS
    51	fallocate05.c:114: TPASS: fallocate() on full FS
    52	fallocate05.c:130: TPASS: fallocate(FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE)
    53	fallocate05.c:134: TFAIL: write(): ENOSPC (28)

Signed-off-by: Li Wang <liwang@redhat.com>
---
 testcases/kernel/syscalls/fallocate/fallocate05.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/fallocate/fallocate05.c b/testcases/kernel/syscalls/fallocate/fallocate05.c
index 55ec1aee4..74bfa4861 100644
--- a/testcases/kernel/syscalls/fallocate/fallocate05.c
+++ b/testcases/kernel/syscalls/fallocate/fallocate05.c
@@ -26,8 +26,8 @@
 #include "lapi/fallocate.h"
 
 #define MNTPOINT "mntpoint"
-#define FALLOCATE_BLOCKS 16
-#define DEALLOCATE_BLOCKS 4
+#define FALLOCATE_BLOCKS 256
+#define DEALLOCATE_BLOCKS 64
 #define TESTED_FLAGS "fallocate(FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE)"
 
 static char *buf;
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
