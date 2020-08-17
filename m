Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01453245B9E
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 06:29:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 97B043C300C
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 06:29:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A3F2A3C2FFD
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 06:29:40 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 1537B1400E78
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 06:29:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597638578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Dy5IZjjwje1UPnnnJlzuURdFgIlgtTn2INH0hjSr2P0=;
 b=IAVbBcSUzwTLTuy4du5oIf+ikY1S2BgmIHqLN4NMAqWsRfl/2y/48aPQaytPBzH3/S1AOr
 MA69xgudB4euorYqOneyOz5b4BxGFxeKsXX7d89bInbs4LLxTVgDQ325aVKDli92/7hGw8
 6XNRBYQ4K74vk8ZUxt51muRcNs3GFrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-2TOzWT96P6aiJVglLsMEJQ-1; Mon, 17 Aug 2020 00:29:35 -0400
X-MC-Unique: 2TOzWT96P6aiJVglLsMEJQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B65A81F007;
 Mon, 17 Aug 2020 04:29:34 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 769075C22D;
 Mon, 17 Aug 2020 04:29:33 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 17 Aug 2020 12:29:31 +0800
Message-Id: <20200817042931.1163-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [COMMITTED] ioctl_sg01: correct code comment
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

Reported-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Signed-off-by: Li Wang <liwang@redhat.com>
---
 testcases/kernel/syscalls/ioctl/ioctl_sg01.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_sg01.c b/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
index 046758e50..daaa96be5 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
@@ -7,7 +7,7 @@
  * CVE-2018-1000204
  *
  * Test ioctl(SG_IO) and check that kernel doesn't leak data. Requires
- * a read-accessible SCSI-compatible device (e.g. SATA disk). Running mem01
+ * a read-accessible SCSI-compatible device (e.g. SATA disk). Running oom*
  * test program before this one may increase the chance of successfully
  * reproducing the bug.
  *
-- 
2.21.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
