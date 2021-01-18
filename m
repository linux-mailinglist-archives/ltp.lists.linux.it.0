Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4181C2FA64E
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 17:32:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E194F3C26C0
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 17:32:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 306A23C0BCB
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 17:32:42 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8090C60069A
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 17:32:42 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B8AD5B272;
 Mon, 18 Jan 2021 16:32:41 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
	ltp@lists.linux.it
Date: Mon, 18 Jan 2021 17:32:40 +0100
Message-Id: <20210118163240.29558-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] tst_pollute_memory(): Set minimal safety margin to
 64MB
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

4096 pages amounts to 16MB on x86_64 or 256MB on PPC64. 16MB is not enough
to avoid OOM killer on some systems so set the safety margin to either 64MB
or 4096 pages, whichever is higher.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Here's my proposed fix for the OOM issues with ioctl_sg01. I can't reproduce
the issue on my x86_64 VMs/machines so please confirm that it works.

Don't forget to run `make clean` after applying this patch because ioctl_sg01
will not be rebuilt automatically due to weak dependency on libltp.a.

 lib/tst_memutils.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
index f134d90c9..c20c94a00 100644
--- a/lib/tst_memutils.c
+++ b/lib/tst_memutils.c
@@ -20,7 +20,8 @@ void tst_pollute_memory(size_t maxsize, int fillchar)
 	struct sysinfo info;
 
 	SAFE_SYSINFO(&info);
-	safety = 4096 * SAFE_SYSCONF(_SC_PAGESIZE) / info.mem_unit;
+	safety = MAX(4096 * SAFE_SYSCONF(_SC_PAGESIZE), 64 * 1024 * 1024);
+	safety /= info.mem_unit;
 
 	if (info.freeswap > safety)
 		safety = 0;
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
