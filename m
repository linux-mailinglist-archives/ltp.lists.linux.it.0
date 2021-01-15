Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9E62F7F54
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 16:19:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E942B3C6A1E
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 16:19:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 3997C3C3119
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 16:19:12 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9C9321A0049E
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 16:19:11 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DE791AB7F;
 Fri, 15 Jan 2021 15:19:10 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 15 Jan 2021 16:19:10 +0100
Message-Id: <20210115151910.3592-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] semctl09: Fix heap smash
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

semctl() expects pointer to a buffer as its fourth argument, not pointer
to a pointer. Passing &un.buf results in heap smash that corrupts internal
LTP data structures on some archs.

CC: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/syscalls/ipc/semctl/semctl09.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl09.c b/testcases/kernel/syscalls/ipc/semctl/semctl09.c
index 131bfbc07..d36ba62e5 100644
--- a/testcases/kernel/syscalls/ipc/semctl/semctl09.c
+++ b/testcases/kernel/syscalls/ipc/semctl/semctl09.c
@@ -51,11 +51,15 @@ static union semun un;
  */
 static inline int do_semctl(int semid, int semnum, int cmd)
 {
+	struct semid_ds info;
+
+	un.buf = &info;
+
 	switch (tst_variant) {
 	case 0:
-		return tst_syscall(__NR_semctl, semid, semnum, cmd, &un.buf);
+		return tst_syscall(__NR_semctl, semid, semnum, cmd, un);
 	case 1:
-		return semctl(semid, semnum, cmd, &un.buf);
+		return semctl(semid, semnum, cmd, un);
 	}
 	return -1;
 }
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
