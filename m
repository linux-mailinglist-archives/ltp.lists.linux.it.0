Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9756C14DEA6
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jan 2020 17:13:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A1F2B3C24C9
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jan 2020 17:13:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id D24B43C2399
 for <ltp@lists.linux.it>; Thu, 30 Jan 2020 17:13:39 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 409261000946
 for <ltp@lists.linux.it>; Thu, 30 Jan 2020 17:13:38 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 878E5AC2C
 for <ltp@lists.linux.it>; Thu, 30 Jan 2020 16:13:38 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 30 Jan 2020 17:13:37 +0100
Message-Id: <20200130161337.31614-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] Taunt OOM killer in fork12 setup()
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

On a system with low memory, fork12 can trigger OOM killer before it hits
any fork() limits. The OOM killer might accidentally kill e.g. the parent
shell and external testing tools will assume the test failed.

Set high oom_score_adj on the fork12 process so that the OOM killer focuses
on it and its children.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/syscalls/fork/fork12.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/syscalls/fork/fork12.c b/testcases/kernel/syscalls/fork/fork12.c
index 75278b012..99b6900f4 100644
--- a/testcases/kernel/syscalls/fork/fork12.c
+++ b/testcases/kernel/syscalls/fork/fork12.c
@@ -108,6 +108,8 @@ int main(int ac, char **av)
 static void setup(void)
 {
 	tst_sig(FORK, fork12_sigs, cleanup);
+	/* Taunt the OOM killer so that it doesn't kill system processes */
+	SAFE_FILE_PRINTF(cleanup, "/proc/self/oom_score_adj", "500");
 	TEST_PAUSE;
 }
 
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
