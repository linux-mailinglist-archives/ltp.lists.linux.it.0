Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFC2155A1E
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 15:54:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4826F3C23C8
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 15:54:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id F11C83C2384
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 15:54:04 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4AEF9142BC0A
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 15:54:04 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8075DAC8C;
 Fri,  7 Feb 2020 14:54:03 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: Jan Stancek <jstancek@redhat.com>,
	ltp@lists.linux.it
Date: Fri,  7 Feb 2020 15:54:03 +0100
Message-Id: <20200207145403.23193-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <1041474174.5093428.1580463462902.JavaMail.zimbra@redhat.com>
References: <1041474174.5093428.1580463462902.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2] Taunt OOM killer in fork12 setup()
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

Set high oom_score_adj on the children of the main fork12 process so that
the OOM killer focuses on them.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1: Set oom_score_adj after fork() so that OOM killer will
ignore the main fork12 process.

 testcases/kernel/syscalls/fork/fork12.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/testcases/kernel/syscalls/fork/fork12.c b/testcases/kernel/syscalls/fork/fork12.c
index 75278b012..1c55c0c30 100644
--- a/testcases/kernel/syscalls/fork/fork12.c
+++ b/testcases/kernel/syscalls/fork/fork12.c
@@ -70,6 +70,12 @@ int main(int ac, char **av)
 		forks = 0;
 		while ((pid1 = fork()) != -1) {
 			if (pid1 == 0) {	/* child */
+				/*
+				 * Taunt the OOM killer so that it doesn't
+				 * kill system processes
+				 */
+				SAFE_FILE_PRINTF(NULL,
+					"/proc/self/oom_score_adj", "500");
 				pause();
 				exit(0);
 			}
-- 
2.25.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
