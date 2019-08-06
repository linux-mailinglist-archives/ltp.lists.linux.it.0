Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F048382E72
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 11:11:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7DFA83C1D3C
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 11:11:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id A1A1A3C1C81
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 11:11:26 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D681E600B30
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 11:11:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9A87FAE1C;
 Tue,  6 Aug 2019 09:11:24 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  6 Aug 2019 11:10:39 +0200
Message-Id: <20190806091040.26448-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls/copy_file_range02: Improve error message
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

Changing error message as 255 exit code occurs on some systems
not only for "command not find" (usual ENOENT from execve())
but also for swapon failure:
swapon: /tmp/5Q4kqc/file_swap: swapon failed: Invalid argument
copy_file_range02.c:89: CONF: swapon binary not installed

+ improve info message for syscall tests

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/syscalls/copy_file_range/copy_file_range.h   | 2 +-
 testcases/kernel/syscalls/copy_file_range/copy_file_range02.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range.h b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
index c7f423e45..24e08e390 100644
--- a/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
@@ -41,7 +41,7 @@ static void syscall_info(void)
 		tst_res(TINFO, "Testing libc copy_file_range()");
 		break;
 	case 1:
-		tst_res(TINFO, "Testing tst copy_file_range()");
+		tst_res(TINFO, "Testing __NR_copy_file_range syscall");
 	}
 }
 
diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
index 26bfa008a..472dffdc6 100644
--- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
@@ -86,7 +86,7 @@ static int run_command(char *command, char *option, char *file)
 	case 0:
 	return 0;
 	case 255:
-		tst_res(TCONF, "%s binary not installed", command);
+		tst_res(TCONF, "%s binary not installed or failed", command);
 	return 1;
 	default:
 		tst_res(TCONF, "%s exited with %i", command, ret);
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
