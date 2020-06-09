Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBD41F34B2
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 09:16:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 93DF43C61BC
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 09:16:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 73B703C094D
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 09:16:32 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id AB5606017CB
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 09:16:31 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E06CA31B;
 Tue,  9 Jun 2020 00:16:29 -0700 (PDT)
Received: from a077208.arm.com (unknown [10.163.78.226])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF3F53F6CF;
 Tue,  9 Jun 2020 00:16:27 -0700 (PDT)
From: Vikas Kumar <vikas.kumar2@arm.com>
To: ltp@lists.linux.it
Date: Tue,  9 Jun 2020 12:46:11 +0530
Message-Id: <20200609071611.9467-1-vikas.kumar2@arm.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/fork14: Fix Buffer overflow
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
Cc: amit.kachhap@arm.com, vikas.kumar2@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This change basically avoids the buffer overflow by keeping the check count
to allocation limit
The problem occurs when there is no failure and i == EXTENT, so
pointer_vec[EXTENT] goes beyond the allocated buffer.

Signed-off-by: Vikas Kumar <vikas.kumar2@arm.com>
Reported-by: Amit Kachhap <amit.kachhap@arm.com>
---
 testcases/kernel/syscalls/fork/fork14.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/testcases/kernel/syscalls/fork/fork14.c b/testcases/kernel/syscalls/fork/fork14.c
index a92aa46ad..2a20d9df8 100644
--- a/testcases/kernel/syscalls/fork/fork14.c
+++ b/testcases/kernel/syscalls/fork/fork14.c
@@ -132,6 +132,9 @@ static int fork_test(void)
 		}
 	}
 
+	if (i == EXTENT)
+		i--;
+
 clear_memory_map:
 	for (j = 0; j <= i; j++) {
 		if (pointer_vec[j])
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
