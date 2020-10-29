Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ED829F1B6
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Oct 2020 17:39:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 267DC3C318B
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Oct 2020 17:39:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 9EC833C20D7
 for <ltp@lists.linux.it>; Thu, 29 Oct 2020 17:39:05 +0100 (CET)
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0C3B4601029
 for <ltp@lists.linux.it>; Thu, 29 Oct 2020 17:38:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=srKUWjqRYll4JG8wdE
 EFUTJJM+kdyfdO3cQNNmtRI/Y=; b=jTm5gTBRmsV5Cf/UaLYoZi5U9TuyE1w08z
 qt/NiMha15Y8e+OVmPnaqJi3ha1SBzOjmerbZl3zJvc6u9ca9F0nYsKR0TbhmmM7
 EnE9dWR/gIAe+nBSVHMBjEuIIh5DvM4pH7Vf21XKFXvIB0sjaslzcRWe6UzW+xY/
 yskwc2Buw=
Received: from localhost.localdomain (unknown [112.22.71.202])
 by smtp7 (Coremail) with SMTP id C8CowABnp4MG8Jpfz5tNGA--.27070S3;
 Fri, 30 Oct 2020 00:38:44 +0800 (CST)
From: Yang Xu <xuyang_jy_0410@163.com>
To: ltp@lists.linux.it
Date: Fri, 30 Oct 2020 00:35:45 +0800
Message-Id: <20201029163545.9829-2-xuyang_jy_0410@163.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20201029163545.9829-1-xuyang_jy_0410@163.com>
References: <20201029163545.9829-1-xuyang_jy_0410@163.com>
X-CM-TRANSID: C8CowABnp4MG8Jpfz5tNGA--.27070S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr43CryUXr13Cr4kCF18uFg_yoW8AFWUpr
 9xCr4DKa18JFW8twnxXa1rua4UAw1fA34rG397Cw4akF4YgFyUArn2va43XrnrZrWrWa43
 Kr1kZrWft3WUXaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_db1nUUUUU=
X-Originating-IP: [112.22.71.202]
X-CM-SenderInfo: p0x1t05jbm5saquriqqrwthudrp/1tbiygfMhFQHJ-ov5QABsA
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/ptrace08: Add exception for RHEL8 4.18
 kernel
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

RHEL 4.18 kernel got this patch
commit bd14406b78e6d("perf/hw_breakpoint: Modify breakpoint even if the new attrhas disabled set") since 4.18.0-49.

Without this fix, this case failed as below on RHEL8:
tst_kernel.c:79: TINFO: uname.machine=x86_64 kernel is 64bit
ptrace08.c:96: TINFO: Trying address 0xffff800000000000
ptrace08.c:122: TFAIL: ptrace() breakpoint with kernel addr succeeded
ptrace08.c:96: TINFO: Trying address 0xffffffffffffffff
ptrace08.c:122: TFAIL: ptrace() breakpoint with kernel addr succeeded
ptrace08.c:96: TINFO: Trying address 0xffffbfffffffffff
ptrace08.c:122: TFAIL: ptrace() breakpoint with kernel addr succeeded

Signed-off-by: Yang Xu <xuyang_jy_0410@163.com>
---
 testcases/kernel/syscalls/ptrace/ptrace08.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/ptrace/ptrace08.c b/testcases/kernel/syscalls/ptrace/ptrace08.c
index 63086f1fd..2796c40e2 100644
--- a/testcases/kernel/syscalls/ptrace/ptrace08.c
+++ b/testcases/kernel/syscalls/ptrace/ptrace08.c
@@ -56,6 +56,11 @@ static pid_t child_pid;
 
 static int deffered_check;
 
+static struct tst_kern_exv kvers[] = {
+	{"RHEL8", "4.18.0-49"},
+	{NULL, NULL},
+};
+
 static void setup(void)
 {
 	/*
@@ -70,9 +75,10 @@ static void setup(void)
 	 * The original fix for the kernel haven't rejected the kernel address
 	 * right away when breakpoint was modified from userspace it was
 	 * disabled instead and the EINVAL was returned when dr7 was written to
-	 * enable it again.
+	 * enable it again. On RHEL8, it has introduced the right fix since
+	 * 4.18.0-49.
 	 */
-	if (tst_kvercmp(4, 19, 0) < 0)
+	if (tst_kvercmp2(4, 19, 0, kvers) < 0)
 		deffered_check = 1;
 }
 
-- 
2.18.1



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
