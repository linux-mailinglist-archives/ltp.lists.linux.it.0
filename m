Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C741D36F81D
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Apr 2021 11:45:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 92EE43C607C
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Apr 2021 11:45:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 690933C2A5F
 for <ltp@lists.linux.it>; Fri, 30 Apr 2021 11:45:07 +0200 (CEST)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9ECB66010DD
 for <ltp@lists.linux.it>; Fri, 30 Apr 2021 11:45:06 +0200 (CEST)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FWnVC4JRhzlbf5
 for <ltp@lists.linux.it>; Fri, 30 Apr 2021 17:42:59 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Fri, 30 Apr 2021 17:44:56 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 30 Apr 2021 17:45:10 +0800
Message-ID: <20210430094513.162499-1-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3 v2] syscalls/chown: Rewrite chown/chown{02, 04,
 05} with the new api
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

Xie Ziyao (3):
  syscalls/chown: Rewrite chown/chown02.c with the new api
  syscalls/chown: Rewrite chown/chown04.c with the new api
  syscalls/chown: Rewrite chown/chown05.c with the new api

 include/tst_safe_macros.h                 |  12 +
 testcases/kernel/syscalls/chown/chown02.c | 307 ++++------------------
 testcases/kernel/syscalls/chown/chown04.c | 229 +++++-----------
 testcases/kernel/syscalls/chown/chown05.c | 195 +++-----------
 4 files changed, 175 insertions(+), 568 deletions(-)

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
