Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 449E036EAEE
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 14:54:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AAE0D3C6197
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 14:54:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1910B3C1C13
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 14:54:25 +0200 (CEST)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 885C6600338
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 14:54:24 +0200 (CEST)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FWFjs5LY7zlW7d
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 20:51:13 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Thu, 29 Apr 2021 20:54:13 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 29 Apr 2021 20:53:38 +0800
Message-ID: <20210429125338.31609-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 0/4] Replace TINFO with TPASS or TFAIL
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

1)remove redundant Variables
2)remove redundant log
3)replace TINFO with TPASS or TFAIL

Zhao Gongyi (4):
  syscalls/writev: Replace TINFO with TPASS or TFAIL
  syscalls/modify_ldt: Replace TINFO with TPASS or TFAIL
  syscalls/getpgid01: Replace TINFO with TPASS or TFAIL
  syscalls/fcntl: Replace TINFO with TPASS or TFAIL

 testcases/kernel/syscalls/fcntl/fcntl16.c     | 70 ++++++------------
 testcases/kernel/syscalls/fcntl/fcntl18.c     | 40 ++--------
 testcases/kernel/syscalls/getpgid/getpgid01.c | 74 ++++---------------
 .../kernel/syscalls/modify_ldt/modify_ldt01.c | 44 +++--------
 .../kernel/syscalls/modify_ldt/modify_ldt02.c | 35 ++-------
 testcases/kernel/syscalls/writev/writev02.c   |  1 -
 testcases/kernel/syscalls/writev/writev05.c   | 16 +---
 testcases/kernel/syscalls/writev/writev06.c   | 15 +---
 8 files changed, 60 insertions(+), 235 deletions(-)

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
