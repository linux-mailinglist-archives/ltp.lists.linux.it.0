Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4E71FEE83
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 11:20:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 475833C2CA2
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 11:20:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id CE9D53C0887
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 11:20:51 +0200 (CEST)
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1E9F11A0098D
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 11:20:48 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05I9KEAL026087
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 02:20:35 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 18 Jun 2020 02:20:17 -0700
From: <zhe.he@windriver.com>
To: <ltp@lists.linux.it>
Date: Thu, 18 Jun 2020 17:18:27 +0800
Message-ID: <20200618091827.4143850-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/copy_file_range02: Expect EFBIG in subcase
 max length on 32-bit architectures
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

From: He Zhe <zhe.he@windriver.com>

For syscall
ssize_t copy_file_range(int fd_in, loff_t *off_in,
                               int fd_out, loff_t *off_out,
                               size_t len, unsigned int flags);
off_out is loff_t* that is long long, 64 bits on 32-bit architectures,
while len is size_t that unsigned int, 32 bits on 32-bit architectures.

In subcase "max length", simplified as below,

dst = tst_max_lfs_filesize();
TEST(sys_copy_file_range(fd_src, 0, *tc->copy_to_fd, &dst, tc->len, tc->flags));

where dst is 4K*4G and len is 4G, so (4K+1)*4G is always smaller than 4G*4G,
it can never match the following kernel condition on 32-bit architectures.

if (pos_in + count < pos_in || pos_out + count < pos_out)
	return -EOVERFLOW;

And thus we would get error like
copy_file_range02.c:139: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EFBIG (27)

Also correct a typo.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 .../kernel/syscalls/copy_file_range/copy_file_range02.c     | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
index fa679c4d3..bc27fbe57 100644
--- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
@@ -78,7 +78,11 @@ static struct tcase {
 	{&fd_chrdev,	0,	EINVAL,		CONTSIZE,	"char device",	0},
 	{&fd_fifo,	0,	EINVAL,		CONTSIZE,	"fifo", 	0},
 	{&fd_pipe[0],	0,	EINVAL,		CONTSIZE,	"pipe", 	0},
-	{&fd_copy,	0,	EOVERFLOW,	ULLONG_MAX,	"max length lenght", 	1},
+#ifdef TST_ABI64
+	{&fd_copy,	0,	EOVERFLOW,	ULLONG_MAX,	"max length", 	1},
+#else
+	{&fd_copy,	0,	EFBIG,		ULLONG_MAX,	"max length", 	1},
+#endif
 	{&fd_copy,	0,	EFBIG,		MIN_OFF,	"max file size", 	1},
 };
 
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
