Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC22A3203BC
	for <lists+linux-ltp@lfdr.de>; Sat, 20 Feb 2021 06:10:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 606EB3C65DE
	for <lists+linux-ltp@lfdr.de>; Sat, 20 Feb 2021 06:10:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 3DB803C4F09
 for <ltp@lists.linux.it>; Sat, 20 Feb 2021 06:10:38 +0100 (CET)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6C991100046C
 for <ltp@lists.linux.it>; Sat, 20 Feb 2021 06:10:36 +0100 (CET)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DjGgR4KvjzMbgC
 for <ltp@lists.linux.it>; Sat, 20 Feb 2021 13:08:35 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Sat, 20 Feb 2021 13:10:24 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Sat, 20 Feb 2021 13:09:48 +0800
Message-ID: <20210220050948.142027-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2] openposix/fork/11-1.c: Clean up temporary file
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

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
(v2->v1: Call unlink behind of close(fd) that makes logic more clear then before fork.)
 .../open_posix_testsuite/conformance/interfaces/fork/11-1.c      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c b/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c
index a43bc274c..8a7796cfd 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c
@@ -106,5 +106,6 @@ int main(void)

 cleanup:
 	close(fd);
+	unlink(path_template);
 	return result;
 }
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
