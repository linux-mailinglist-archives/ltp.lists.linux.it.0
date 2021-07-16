Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6763CB5F7
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 12:23:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 825FE3C752D
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 12:23:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E2CD13C7381
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 12:22:28 +0200 (CEST)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 53DA01A016F2
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 12:22:16 +0200 (CEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GR6bK5VSvz1CKJQ
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 18:16:29 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 16 Jul 2021 18:22:10 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 16 Jul 2021 18:22:09 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 16 Jul 2021 18:22:52 +0800
Message-ID: <20210716102257.20882-1-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210628080424.245911-3-xieziyao@huawei.com>
References: <20210628080424.245911-3-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 0/5 v2] epoll_pwait2: Add test for epoll_pwait2
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

v1->v2:
1. Add the prototype for epoll_pwait and epoll_pwait2 into include/lapi/epoll.h.
2. Add test variants to switch between epoll_pwait and epoll_pwait2 for epoll_pwait.

Xie Ziyao (5):
  lapi/syscalls: Add syscall number for epoll_pwait2
  lapi: Add the prototype for epoll_pwait and epoll_pwait2
  epoll_pwait: Add test variants for epoll_pwait
  epoll_pwait: Add test for epoll_pwait02
  epoll_pwait: Add test for epoll_pwait03

 configure.ac                                  |  1 +
 include/lapi/epoll.h                          | 37 +++++++++-
 include/lapi/syscalls/aarch64.in              |  1 +
 include/lapi/syscalls/arc.in                  |  1 +
 include/lapi/syscalls/arm.in                  |  1 +
 include/lapi/syscalls/hppa.in                 |  3 +-
 include/lapi/syscalls/i386.in                 |  1 +
 include/lapi/syscalls/ia64.in                 |  1 +
 include/lapi/syscalls/powerpc.in              |  1 +
 include/lapi/syscalls/powerpc64.in            |  1 +
 include/lapi/syscalls/s390.in                 |  1 +
 include/lapi/syscalls/s390x.in                |  1 +
 include/lapi/syscalls/sh.in                   |  1 +
 include/lapi/syscalls/sparc.in                |  1 +
 include/lapi/syscalls/sparc64.in              |  1 +
 include/lapi/syscalls/x86_64.in               |  1 +
 runtest/syscalls                              |  2 +
 .../kernel/syscalls/epoll_pwait/.gitignore    |  4 +-
 .../syscalls/epoll_pwait/epoll_pwait02.c      | 65 ++++++++++++++++
 .../syscalls/epoll_pwait/epoll_pwait03.c      | 74 +++++++++++++++++++
 .../syscalls/epoll_pwait/epoll_pwait_var.h    | 43 +++++++++++
 21 files changed, 237 insertions(+), 5 deletions(-)
 create mode 100644 testcases/kernel/syscalls/epoll_pwait/epoll_pwait02.c
 create mode 100644 testcases/kernel/syscalls/epoll_pwait/epoll_pwait03.c
 create mode 100644 testcases/kernel/syscalls/epoll_pwait/epoll_pwait_var.h

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
