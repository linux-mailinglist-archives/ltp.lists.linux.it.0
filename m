Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B55E6305A6F
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 12:56:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 836EB3C79E4
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 12:56:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 9A94D3C79D0
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 12:56:08 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3B41E60085E
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 12:56:07 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 88F1BAD26;
 Wed, 27 Jan 2021 11:56:07 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: liuxp11@chinatelecom.cn,
	ltp@lists.linux.it
Date: Wed, 27 Jan 2021 12:56:06 +0100
Message-Id: <20210127115606.28985-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] Fix tst_pollute_memory() safety margin for huge
 systems
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

tst_pollute_memory() still has OOM issues on system with huge amounts of RAM.
Set safety margin to the largest value of:
- 2 * min_free_kbytes
- 128MB
- 4096 pages
- Free RAM / 128 (to account for memory allocation overhead)

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 lib/tst_memutils.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
index dd09db490..7cdb3dbe0 100644
--- a/lib/tst_memutils.c
+++ b/lib/tst_memutils.c
@@ -20,8 +20,11 @@ void tst_pollute_memory(size_t maxsize, int fillchar)
 	struct sysinfo info;
 
 	SAFE_SYSINFO(&info);
-	safety = MAX(4096 * SAFE_SYSCONF(_SC_PAGESIZE), 128 * 1024 * 1024);
+	SAFE_FILE_SCANF("/proc/sys/vm/min_free_kbytes", "%zd", &safety);
+	safety = MAX(2048 * safety, 128 * 1024 * 1024);
+	safety = MAX(safety, 4096 * SAFE_SYSCONF(_SC_PAGESIZE));
 	safety /= info.mem_unit;
+	safety = MAX(safety, info.freeram / 128);
 
 	if (info.freeswap > safety)
 		safety = 0;
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
