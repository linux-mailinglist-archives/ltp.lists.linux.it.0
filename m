Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E95C139989E
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 05:35:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 822B13C5579
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 05:35:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 067853C5599
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 05:35:38 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4037C600621
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 05:35:37 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FwWd50fn5zWqb5
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 11:30:49 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 11:35:32 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 11:35:32 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 3 Jun 2021 11:36:08 +0800
Message-ID: <20210603033611.15619-1-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] Fix and convert sendfile{02, 06} to the new API
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

1. Convert sendfile{02, 06} to the new API with file descriptors instead
of socket descriptors.
2. Remove the support for UCLINUX.
3. Remove redundant testcases {4, 22, 26} and {6, 20, 26} for
sendfile02.
4. Remove unnecessary header files for sendfile{03, 04, 05, 07}.

Xie Ziyao (3):
  syscalls/sendfile: Convert sendfile02 to the new API
  syscalls/sendfile: Convert sendfile06 to the new API
  syscalls/sendfile: Remove unnecessary header files

 .../kernel/syscalls/sendfile/sendfile02.c     | 323 ++++--------------
 .../kernel/syscalls/sendfile/sendfile03.c     |   3 -
 .../kernel/syscalls/sendfile/sendfile04.c     |   9 -
 .../kernel/syscalls/sendfile/sendfile05.c     |   9 -
 .../kernel/syscalls/sendfile/sendfile06.c     | 247 +++-----------
 .../kernel/syscalls/sendfile/sendfile07.c     |   9 -
 6 files changed, 108 insertions(+), 492 deletions(-)

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
