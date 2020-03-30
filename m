Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0604519759A
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 09:25:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B4F613C315A
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 09:25:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 8DE7A3C316A
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 09:24:49 +0200 (CEST)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C6B2F20004E
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 09:24:48 +0200 (CEST)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C25EB7FDB95580278531
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 15:24:38 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Mon, 30 Mar 2020 15:24:27 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 30 Mar 2020 15:27:49 +0800
Message-ID: <1585553269-119544-4-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1585553269-119544-1-git-send-email-zou_wei@huawei.com>
References: <1585553269-119544-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 3/3] syscalls/statx01: Fix bug caused by default
 umask
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
Cc: Zou Wei <zou_wei@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

v3:
The case is only successful when system default umask is 0022.
When default umask is 0077 or other values, should clear current umask by umask(0) in setup().

Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 testcases/kernel/syscalls/statx/statx01.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/syscalls/statx/statx01.c b/testcases/kernel/syscalls/statx/statx01.c
index 4f9d582..2358dd7 100644
--- a/testcases/kernel/syscalls/statx/statx01.c
+++ b/testcases/kernel/syscalls/statx/statx01.c
@@ -148,6 +148,8 @@ static void setup(void)
 	char data_buff[SIZE];
 	int file_fd;

+	umask(0);
+
 	memset(data_buff, '@', sizeof(data_buff));

 	file_fd =  SAFE_OPEN(TESTFILE, O_RDWR|O_CREAT, MODE);
--
2.6.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
