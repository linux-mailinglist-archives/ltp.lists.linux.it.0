Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD033EE6E1
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Aug 2021 08:49:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C9D863C57E9
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Aug 2021 08:49:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 71D0A3C56D3
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 08:48:40 +0200 (CEST)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 494E3200751
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 08:48:39 +0200 (CEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GphSC0qvfz1CXhl
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 14:48:11 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 14:48:33 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 14:48:33 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 17 Aug 2021 14:49:17 +0800
Message-ID: <20210817064924.127970-1-xieziyao@huawei.com>
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
Subject: [LTP] [PATCH 0/7] epoll: Add more basic test for epoll_{create,
 create1, ctl}
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

Xie Ziyao (7):
  epoll_ctl: Add docparse formatting and cleanup for epoll_ctl01
  epoll_ctl: Add docparse formatting and cleanup for epoll_ctl02
  epoll_ctl: Add test for epoll_ctl03
  epoll_create1: Add docparse formatting and cleanup for
    epoll_create1_01
  epoll_create1: Add test for epoll_create1_02
  epoll_create: Add test for epoll_create01
  epoll_create: Add test for epoll_create02

 runtest/syscalls                              |  4 +
 .../kernel/syscalls/epoll_create/.gitignore   |  2 +
 .../kernel/syscalls/epoll_create/Makefile     |  9 ++
 .../syscalls/epoll_create/epoll_create01.c    | 40 +++++++++
 .../syscalls/epoll_create/epoll_create02.c    | 37 ++++++++
 .../kernel/syscalls/epoll_create1/.gitignore  |  3 +-
 .../syscalls/epoll_create1/epoll_create1_01.c | 53 ++++++-----
 .../syscalls/epoll_create1/epoll_create1_02.c | 38 ++++++++
 .../kernel/syscalls/epoll_ctl/.gitignore      |  5 +-
 .../kernel/syscalls/epoll_ctl/epoll_ctl01.c   | 28 +++---
 .../kernel/syscalls/epoll_ctl/epoll_ctl02.c   | 87 +++++++------------
 .../kernel/syscalls/epoll_ctl/epoll_ctl03.c   | 75 ++++++++++++++++
 12 files changed, 280 insertions(+), 101 deletions(-)
 create mode 100644 testcases/kernel/syscalls/epoll_create/.gitignore
 create mode 100644 testcases/kernel/syscalls/epoll_create/Makefile
 create mode 100644 testcases/kernel/syscalls/epoll_create/epoll_create01.c
 create mode 100644 testcases/kernel/syscalls/epoll_create/epoll_create02.c
 create mode 100644 testcases/kernel/syscalls/epoll_create1/epoll_create1_02.c
 create mode 100644 testcases/kernel/syscalls/epoll_ctl/epoll_ctl03.c

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
