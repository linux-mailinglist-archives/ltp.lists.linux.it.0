Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3763A33E8A7
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 05:58:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D55D93C6429
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 05:58:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 879BC3C2D4E
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 05:58:24 +0100 (CET)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5E8D51A00363
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 05:58:22 +0100 (CET)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F0dDD51J5zkZZX
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 12:56:44 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Wed, 17 Mar 2021 12:58:05 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Wed, 17 Mar 2021 12:57:49 +0800
Message-ID: <20210317045749.3335-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2] runtest/syscalls: Add testcases to test list
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

Add syscall test cases to test list.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
v1->v2: remove mem03 and mmap10.
 runtest/syscalls | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/runtest/syscalls b/runtest/syscalls
index fe22ae5b6..9d4c57bb2 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -44,6 +44,7 @@ bpf_prog03 bpf_prog03
 bpf_prog04 bpf_prog04

 brk01 brk01
+brk02 brk02

 capget01 capget01
 capget02 capget02
@@ -492,6 +493,7 @@ getrlimit02 getrlimit02
 getrlimit03 getrlimit03

 get_mempolicy01 get_mempolicy01
+get_mempolicy02 get_mempolicy02
 get_robust_list01 get_robust_list01

 getrusage01 getrusage01
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
