Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBCD2FE776
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 11:23:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C0413C75FE
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 11:23:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 563013C2863
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 11:23:16 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1B1BC10004AA
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 11:23:07 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 563CCAD19;
 Thu, 21 Jan 2021 10:23:07 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 21 Jan 2021 11:22:39 +0100
Message-Id: <20210121102239.18643-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] configure.ac: More descriptive NUMA error message
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
Cc: Donghai Qiao <dqiao@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Some people were confused and searched for libnuma.so.2,
which does not exist.

Required is libnuma.so.1, but with LIBNUMA_API_VERSION >= 2.
The API version is tighten to libnuma version in git, but that has
nothing to do with library soname version, which is still 1.0.0.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index e44e25cc6..521a2e835 100644
--- a/configure.ac
+++ b/configure.ac
@@ -347,7 +347,7 @@ LTP_CHECK_SYSCALL_FCNTL
 
 if test "x$with_numa" = xyes; then
 	LTP_CHECK_SYSCALL_NUMA
-	numa_error_msg="test requires libnuma >= 2 and it's development packages"
+	numa_error_msg="test requires libnuma1 with LIBNUMA_API_VERSION >= 2 and it's development packages"
 else
 	numa_error_msg="NUMA support was disabled during build"
 fi
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
