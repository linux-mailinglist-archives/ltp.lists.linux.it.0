Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 767E73525BB
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Apr 2021 05:46:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 455373C5F64
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Apr 2021 05:46:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D329A3C229A
 for <ltp@lists.linux.it>; Fri,  2 Apr 2021 05:46:29 +0200 (CEST)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 787EB1A014AA
 for <ltp@lists.linux.it>; Fri,  2 Apr 2021 05:46:28 +0200 (CEST)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FBQrc1BpWznY0K
 for <ltp@lists.linux.it>; Fri,  2 Apr 2021 11:43:44 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Fri, 2 Apr 2021 11:46:16 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 2 Apr 2021 11:46:10 +0800
Message-ID: <20210402034612.127912-1-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] cleanup: Modify incorrect use of test macros and
 annotation style
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

- modify incorrect use of test macros;
- unify the annotation style and remove Redundant code.

Xie Ziyao (2):
  Modify incorrect use of TERRNO and replace functions with safe_macros
  Unify the annotation style and remove Redundant code

 testcases/kernel/syscalls/bpf/bpf_map01.c     |  2 +-
 .../syscalls/clock_gettime/clock_gettime03.c  | 20 +++++++------------
 .../clock_nanosleep/clock_nanosleep01.c       |  2 +-
 .../clock_nanosleep/clock_nanosleep03.c       | 18 +++++++----------
 testcases/kernel/syscalls/clone3/clone301.c   |  5 +++++
 testcases/kernel/syscalls/clone3/clone302.c   |  5 +++++
 .../copy_file_range/copy_file_range02.c       |  2 +-
 .../copy_file_range/copy_file_range03.c       |  2 +-
 testcases/kernel/syscalls/dup/dup03.c         |  4 ++--
 testcases/kernel/syscalls/execle/Makefile     | 19 +++---------------
 testcases/kernel/syscalls/execlp/Makefile     | 19 +++---------------
 testcases/kernel/syscalls/execve/execve02.c   |  4 ++--
 testcases/kernel/syscalls/execvp/Makefile     | 20 +++----------------
 .../kernel/syscalls/fallocate/fallocate04.c   |  2 +-
 testcases/kernel/syscalls/getcwd/getcwd01.c   |  4 ++--
 testcases/kernel/syscalls/getcwd/getcwd02.c   |  2 +-
 .../syscalls/init_module/init_module01.c      |  2 +-
 .../syscalls/init_module/init_module02.c      |  2 +-
 .../kernel/syscalls/io_uring/io_uring02.c     | 10 +++++-----
 testcases/kernel/syscalls/ioctl/ioctl04.c     |  4 ++--
 testcases/kernel/syscalls/ioperm/ioperm01.c   |  2 +-
 testcases/kernel/syscalls/lgetxattr/Makefile  | 16 +--------------
 22 files changed, 56 insertions(+), 110 deletions(-)

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
