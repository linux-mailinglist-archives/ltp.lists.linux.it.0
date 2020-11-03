Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CF12A4A57
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 16:50:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 259C73C3025
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 16:50:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id C1A613C2BFD
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 16:50:04 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 6EA006009A3
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 16:50:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1604418603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6d5HUu14f4NMAPXebIIHMxY9I2/lFQY6h3IuweKPI0k=;
 b=A5YmZ0ZE6dTMHVyNLC0iIUq8AtwYLQQkQn2S+PIPPUk3wvpadTvVpdFuxo/jpSCGI4qz5O
 SY5mWzXaqfG5nNY9ak6cXC57EobU2+KczyTYodyLcHHIOPACxesjfjqEc+UqtYWs2eYBn6
 wQbyMTFygovHMaUPM9c8ooCYAWiTf4w=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D76AEACB5;
 Tue,  3 Nov 2020 15:50:03 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Tue,  3 Nov 2020 15:49:50 +0000
Message-Id: <20201103154950.32000-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] madvise06: Add tag for "mm: memcg: link page counters
 to root ..."
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The test may trigger a warning if bf4f059 is present (5.9) and
use_hierarchy=0 which is fixed by 8de15e920dc8. Full details of the
bug are in the kernel commit description and I do not want to repeat
them in the test description as they are likely to be irrelevant to
most readers.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/syscalls/madvise/madvise06.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/kernel/syscalls/madvise/madvise06.c
index 23ebbead6..817faae39 100644
--- a/testcases/kernel/syscalls/madvise/madvise06.c
+++ b/testcases/kernel/syscalls/madvise/madvise06.c
@@ -235,6 +235,7 @@ static struct tst_test test = {
 	.needs_root = 1,
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "55231e5c898c"},
+		{"linux-git", "8de15e920dc8"},
 		{}
 	}
 };
-- 
2.29.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
