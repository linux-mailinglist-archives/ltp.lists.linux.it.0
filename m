Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 294341B8E1C
	for <lists+linux-ltp@lfdr.de>; Sun, 26 Apr 2020 11:01:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A3B73C2886
	for <lists+linux-ltp@lfdr.de>; Sun, 26 Apr 2020 11:01:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 71A7B3C20DE
 for <ltp@lists.linux.it>; Sun, 26 Apr 2020 11:01:04 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 482E61401A41
 for <ltp@lists.linux.it>; Sun, 26 Apr 2020 11:01:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587891661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r58HE19mlnC9itLcrnslKGHOSpuj0UjjaH7tB4F1wXE=;
 b=O7+mwQhJbwlwxSdzY8L59lUIzD2NymTdF56GCw56lv5RLs0+vO7UdHbhQbZDEv6CSYu3EF
 98AapEl+61zO8+97COa+j9KJfq1KPdhybU1JKWtWw0OikKWhtOCHv9h6JT0+bMY9LuLBf5
 sixTddiqDrJmiKSFhOztxXnMAYyLq+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-yzG1x7AHNrOZz03vVx6OFQ-1; Sun, 26 Apr 2020 05:00:57 -0400
X-MC-Unique: yzG1x7AHNrOZz03vVx6OFQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF1451800D42;
 Sun, 26 Apr 2020 09:00:56 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E1255D9CD;
 Sun, 26 Apr 2020 09:00:54 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Sun, 26 Apr 2020 17:00:53 +0800
Message-Id: <20200426090053.26764-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [COMMITTED] pipe2: add min_kver = "2.6.35" in pipe2_04
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

To change the capacity of a pipe was involved from kernel-2.6.35 version.

  F_SETPIPE_SZ (int; since Linux 2.6.35)
  F_GETPIPE_SZ (void; since Linux 2.6.35)

Signed-off-by: Li Wang <liwang@redhat.com>
---
 testcases/kernel/syscalls/pipe2/pipe2_04.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/syscalls/pipe2/pipe2_04.c b/testcases/kernel/syscalls/pipe2/pipe2_04.c
index 1edb3f151..432007e4d 100644
--- a/testcases/kernel/syscalls/pipe2/pipe2_04.c
+++ b/testcases/kernel/syscalls/pipe2/pipe2_04.c
@@ -98,6 +98,7 @@ static void cleanup(void)
 }
 
 static struct tst_test test = {
+	.min_kver = "2.6.35",
 	.test_all = test_pipe2,
 	.setup = setup,
 	.cleanup = cleanup,
-- 
2.21.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
