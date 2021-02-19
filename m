Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F34131F491
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Feb 2021 06:05:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DCB6D3C8797
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Feb 2021 06:05:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4A0C93C5501
 for <ltp@lists.linux.it>; Fri, 19 Feb 2021 06:05:31 +0100 (CET)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6F8EC201085
 for <ltp@lists.linux.it>; Fri, 19 Feb 2021 06:05:30 +0100 (CET)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dhfc108f5zMbxn
 for <ltp@lists.linux.it>; Fri, 19 Feb 2021 13:03:29 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Fri, 19 Feb 2021 13:05:17 +0800
From: zhao gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 19 Feb 2021 13:04:39 +0800
Message-ID: <20210219050439.179039-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] openposix/fork/11-1.c: Clean up temporary file
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

We need to clean up temporary file /tmp/fork-11-1-XXXXXX which created by mkstemp.

Signed-off-by: zhao gongyi <zhaogongyi@huawei.com>
---
 .../open_posix_testsuite/conformance/interfaces/fork/11-1.c     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c b/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c
index a43bc274c..e9b18958c 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c
@@ -79,6 +79,8 @@ int main(void)
 		return result;
 	}

+	unlink(path_template);
+
 	if (fcntl(fd, F_SETLK, &fl) == -1) {
 		printf("Could not set initial lock: %s (%d)\n",
 		       strerror(errno), errno);
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
