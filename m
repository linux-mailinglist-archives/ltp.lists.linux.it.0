Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3EA3B5A3A
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 10:04:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6075A3C0E61
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 10:04:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7607F3C8D9C
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 10:03:45 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 48CEC60086F
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 10:03:40 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GD0NC3wrQzXm2T
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 15:58:19 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 16:03:30 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 16:03:30 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 28 Jun 2021 16:04:21 +0800
Message-ID: <20210628080424.245911-1-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] epoll_pwait2: Add test for epoll_pwait2
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
  lapi/syscalls: Add syscall number for epoll_pwait2
  epoll_pwait2: Add test for epoll_pwait201
  epoll_pwait2: Add test for epoll_pwait202

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
 .../kernel/syscalls/epoll_pwait2/.gitignore   |  2 +
 .../kernel/syscalls/epoll_pwait2/Makefile     |  9 +++
 .../syscalls/epoll_pwait2/epoll_pwait201.c    | 62 +++++++++++++++
 .../syscalls/epoll_pwait2/epoll_pwait202.c    | 76 +++++++++++++++++++
 19 files changed, 166 insertions(+), 1 deletion(-)
 create mode 100644 testcases/kernel/syscalls/epoll_pwait2/.gitignore
 create mode 100644 testcases/kernel/syscalls/epoll_pwait2/Makefile
 create mode 100644 testcases/kernel/syscalls/epoll_pwait2/epoll_pwait201.c
 create mode 100644 testcases/kernel/syscalls/epoll_pwait2/epoll_pwait202.c

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
