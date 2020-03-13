Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 755B91840D2
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 07:21:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C33DA3C591C
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 07:21:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D317F3C58EF
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 07:21:29 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id BACE8140203C
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 07:21:25 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BE5B31B;
 Thu, 12 Mar 2020 23:21:24 -0700 (PDT)
Received: from a077208.blr.arm.com (a077208.blr.arm.com [10.162.42.56])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D63A83F67D;
 Thu, 12 Mar 2020 23:25:20 -0700 (PDT)
From: Vikas Kumar <vikas.kumar2@arm.com>
To: ltp@lists.linux.it
Date: Fri, 13 Mar 2020 11:50:57 +0530
Message-Id: <20200313062058.7058-1-vikas.kumar2@arm.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 0/1] Added Refrence for Linux Asynchronous IO APIs in
 LTP
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
Cc: Vikas Kumar <vikas.kumar2@arm.com>, anshuman.khandual@arm.com,
 viresh.kumar@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

    Enabled Linux Asynchronous IO(AIO) family of APIs in LTP
    AIO API: io_uring_setup(), io_uring_register(), io_uring_enter()
    
    Refrences for Linux AIO-
    
    https://lwn.net/Articles/776703/
    https://kernel.dk/io_uring.pdf
    https://www.mankier.com/2/io_uring_setup
    https://www.mankier.com/2/io_uring_register
    https://www.mankier.com/2/io_uring_enter
    
    Signed-off-by: Vikas Kumar <vikas.kumar2@arm.com>

---

Vikas Kumar (1):
  Added Refrence for Linux Asynchronous IO APIs in LTP

 configure.ac                                  |   3 +
 include/lapi/io_uring.h                       | 180 ++++++++++++++++++
 testcases/kernel/syscalls/io_uring/.gitignore |   1 +
 testcases/kernel/syscalls/io_uring/Makefile   |  25 +++
 .../kernel/syscalls/io_uring/io_uring01.c     |  85 +++++++++
 5 files changed, 294 insertions(+)
 create mode 100644 include/lapi/io_uring.h
 create mode 100644 testcases/kernel/syscalls/io_uring/.gitignore
 create mode 100644 testcases/kernel/syscalls/io_uring/Makefile
 create mode 100644 testcases/kernel/syscalls/io_uring/io_uring01.c

-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
