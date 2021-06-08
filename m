Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D7739F835
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 15:56:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 076C03C7B08
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 15:56:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 870F73C2685
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 15:56:43 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 48431200BB0
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 15:56:42 +0200 (CEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FzsCb0WsRzYrhm
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 21:53:47 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 21:56:36 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 21:56:36 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 8 Jun 2021 21:57:14 +0800
Message-ID: <20210608135718.36579-1-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 0/4 v2] syscalls/aio: Add testcases for native AIO
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

1. Split io_submit02 into two, one for negative and one for positive cases.
2. Add .needs_kconfig in this test.
3. Print values not variable names in TST_EXP_PASS/FAIL().

Xie Ziyao (4):
  syscalls/io_destroy: Add io_destroy02 test for native AIO
  syscalls/io_setup: Add io_setup02 test for native AIO
  syscalls/io_submit: Add io_submit02 test for native AIO
  syscalls/io_submit: Add io_submit03 test for native AIO

 runtest/syscalls                              |   4 +
 .../kernel/syscalls/io_destroy/.gitignore     |   1 +
 .../kernel/syscalls/io_destroy/io_destroy02.c |  38 ++++++
 testcases/kernel/syscalls/io_setup/.gitignore |   1 +
 .../kernel/syscalls/io_setup/io_setup02.c     |  64 ++++++++++
 .../kernel/syscalls/io_submit/.gitignore      |   2 +
 .../kernel/syscalls/io_submit/io_submit02.c   |  89 +++++++++++++
 .../kernel/syscalls/io_submit/io_submit03.c   | 118 ++++++++++++++++++
 8 files changed, 317 insertions(+)
 create mode 100644 testcases/kernel/syscalls/io_destroy/io_destroy02.c
 create mode 100644 testcases/kernel/syscalls/io_setup/io_setup02.c
 create mode 100644 testcases/kernel/syscalls/io_submit/io_submit02.c
 create mode 100644 testcases/kernel/syscalls/io_submit/io_submit03.c

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
