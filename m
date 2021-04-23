Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAB5368C61
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Apr 2021 06:55:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 75FDF3C69E5
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Apr 2021 06:55:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8896E3C69D6
 for <ltp@lists.linux.it>; Fri, 23 Apr 2021 06:55:15 +0200 (CEST)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3E45A200C19
 for <ltp@lists.linux.it>; Fri, 23 Apr 2021 06:55:10 +0200 (CEST)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FRMNV50Trz7w9R
 for <ltp@lists.linux.it>; Fri, 23 Apr 2021 12:52:42 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Fri, 23 Apr 2021 12:54:57 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 23 Apr 2021 12:54:33 +0800
Message-ID: <20210423045433.1885-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/name_to_handle_at: Clean memory after
 calling name_to_handle_at
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

Need to cleanup memory after calling name_to_handle_at, otherwise the
test will fail when we run with option '-i', as follows:

./name_to_handle_at02 -i 2
tst_test.c:1313: TINFO: Timeout per run is 0h 05m 00s
name_to_handle_at02.c:74: TPASS: invalid-dfd: name_to_handle_at() failed
as expected: EBADF (9)
name_to_handle_at02.c:74: TPASS: not a directory: name_to_handle_at()
failed as expected: ENOTDIR (20)
name_to_handle_at02.c:74: TPASS: invalid-path: name_to_handle_at()
failed as expected: EFAULT (14)
name_to_handle_at02.c:74: TPASS: invalid-file-handle:
name_to_handle_at() failed as expected: EFAULT (14)
name_to_handle_at02.c:74: TPASS: zero-file-handle-size:
name_to_handle_at() failed as expected: EOVERFLOW (75)
name_to_handle_at02.c:74: TPASS: high-file-handle-size:
name_to_handle_at() failed as expected: EINVAL (22)
name_to_handle_at02.c:74: TPASS: invalid-mount_id: name_to_handle_at()
failed as expected: EFAULT (14)
name_to_handle_at02.c:74: TPASS: invalid-flags: name_to_handle_at()
failed as expected: EINVAL (22)
name_to_handle_at02.c:74: TPASS: empty-path: name_to_handle_at() failed
as expected: ENOENT (2)
name_to_handle_at02.c:74: TPASS: invalid-dfd: name_to_handle_at() failed
as expected: EBADF (9)
name_to_handle_at02.c:74: TPASS: not a directory: name_to_handle_at()
failed as expected: ENOTDIR (20)
name_to_handle_at02.c:74: TPASS: invalid-path: name_to_handle_at()
failed as expected: EFAULT (14)
name_to_handle_at02.c:74: TPASS: invalid-file-handle:
name_to_handle_at() failed as expected: EFAULT (14)
name_to_handle_at02.c:62: TFAIL: zero-file-handle-size:
name_to_handle_at() passed unexpectedly
name_to_handle_at02.c:74: TPASS: high-file-handle-size:
name_to_handle_at() failed as expected: EINVAL (22)
name_to_handle_at02.c:74: TPASS: invalid-mount_id: name_to_handle_at()
failed as expected: EFAULT (14)
name_to_handle_at02.c:74: TPASS: invalid-flags: name_to_handle_at()
failed as expected: EINVAL (22)
name_to_handle_at02.c:74: TPASS: empty-path: name_to_handle_at() failed
as expected: ENOENT (2)

Summary:
passed   17
failed   1
broken   0
skipped  0
warnings 0

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 .../kernel/syscalls/name_to_handle_at/name_to_handle_at02.c    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at02.c b/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at02.c
index d60c8a0c1..e3e77ef3f 100644
--- a/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at02.c
+++ b/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at02.c
@@ -54,6 +54,9 @@ static void run(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];

+	/* Need to clean memory after calling name_to_handle_at. */
+	memset(&fh, 0, sizeof(fh));
+
 	TEST(name_to_handle_at(tc->dfd, *tc->pathname, *tc->fhp, *tc->mount_id,
 			       tc->flags));

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
