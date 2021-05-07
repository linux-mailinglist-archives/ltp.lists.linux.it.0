Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7A9376218
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 10:33:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C8E153C5632
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 10:33:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 11FDF3C55ED
 for <ltp@lists.linux.it>; Fri,  7 May 2021 10:33:11 +0200 (CEST)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3F8F11A0172F
 for <ltp@lists.linux.it>; Fri,  7 May 2021 10:33:09 +0200 (CEST)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fc3Yv12Z2zlcS2;
 Fri,  7 May 2021 16:30:59 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Fri, 7 May 2021 16:33:00 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 7 May 2021 16:33:18 +0800
Message-ID: <20210507083321.167998-1-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] syscalls/aio: Add testcases for native AIO
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
Cc: rpalethorpe@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Test io_destroy, io_setup, io_submit invoked via syscall(2).

Xie Ziyao (3):
  syscalls/io_destroy: Add io_destroy02 test for native AIO
  syscalls/io_setup: Add io_setup02 test for native AIO
  syscalls/io_submit: Add io_submit02 test for native AIO

 runtest/syscalls                              |   3 +
 .../kernel/syscalls/io_destroy/.gitignore     |   1 +
 .../kernel/syscalls/io_destroy/io_destroy02.c |  32 +++++
 testcases/kernel/syscalls/io_setup/.gitignore |   1 +
 .../kernel/syscalls/io_setup/io_setup02.c     |  52 ++++++++
 .../kernel/syscalls/io_submit/.gitignore      |   1 +
 .../kernel/syscalls/io_submit/io_submit02.c   | 119 ++++++++++++++++++
 7 files changed, 209 insertions(+)
 create mode 100644 testcases/kernel/syscalls/io_destroy/io_destroy02.c
 create mode 100644 testcases/kernel/syscalls/io_setup/io_setup02.c
 create mode 100644 testcases/kernel/syscalls/io_submit/io_submit02.c

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
