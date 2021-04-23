Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CC761368FF5
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Apr 2021 12:00:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 751D23C6A2F
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Apr 2021 12:00:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2A3913C6A11
 for <ltp@lists.linux.it>; Fri, 23 Apr 2021 12:00:06 +0200 (CEST)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4F25310009F4
 for <ltp@lists.linux.it>; Fri, 23 Apr 2021 12:00:03 +0200 (CEST)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FRV8J6gZDzvSRK
 for <ltp@lists.linux.it>; Fri, 23 Apr 2021 17:57:36 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Fri, 23 Apr 2021 17:59:54 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 23 Apr 2021 17:59:29 +0800
Message-ID: <20210423095929.5280-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/getdents01: Add close() and open() at the
 end of run()
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

When the test run with the option of '-i', we need call close
and open at the end of run(), otherwist the test will fail,as follows:

$ getdents01 -i 2

tst_buffers.c:55: TINFO: Test is using guarded buffers
tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s
getdents.h:148: TINFO: Testing the SYS_getdents syscall
getdents01.c:109: TINFO: Found '.'
getdents01.c:109: TINFO: Found '..'
getdents01.c:109: TINFO: Found 'symlink'
getdents01.c:109: TINFO: Found 'file'
getdents01.c:109: TINFO: Found 'dir'
getdents01.c:149: TPASS: All entries found
getdents01.c:97: TFAIL: getdents failed - returned end of directory
tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s
getdents.h:151: TINFO: Testing the SYS_getdents64 syscall
getdents01.c:109: TINFO: Found '.'
getdents01.c:109: TINFO: Found '..'
getdents01.c:109: TINFO: Found 'dir'
getdents01.c:109: TINFO: Found 'symlink'
getdents01.c:109: TINFO: Found 'file'
getdents01.c:149: TPASS: All entries found
getdents01.c:97: TFAIL: getdents failed - returned end of directory
tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s
getdents.h:157: TCONF: libc getdents() is not implemented
tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s
getdents.h:162: TINFO: Testing libc getdents64()
getdents01.c:109: TINFO: Found '.'
getdents01.c:109: TINFO: Found '..'
getdents01.c:109: TINFO: Found 'dir'
getdents01.c:109: TINFO: Found 'symlink'
getdents01.c:109: TINFO: Found 'file'
getdents01.c:149: TPASS: All entries found
getdents01.c:97: TFAIL: getdents failed - returned end of directory

Summary:
passed   3
failed   3
broken   0
skipped  1
warnings 0

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 testcases/kernel/syscalls/getdents/getdents01.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/testcases/kernel/syscalls/getdents/getdents01.c b/testcases/kernel/syscalls/getdents/getdents01.c
index ef8f4e864..7982691a6 100644
--- a/testcases/kernel/syscalls/getdents/getdents01.c
+++ b/testcases/kernel/syscalls/getdents/getdents01.c
@@ -92,6 +92,9 @@ static void run(void)
 	} while (rval > 0);

 	check_flags();
+
+	SAFE_CLOSE(fd);
+	fd = SAFE_OPEN(".", O_RDONLY|O_DIRECTORY);
 }

 static void reset_flags(void)
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
