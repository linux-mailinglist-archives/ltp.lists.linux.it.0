Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 072B91D2A7E
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 10:42:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1A653C5461
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 10:42:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 14C5B3C180D
 for <ltp@lists.linux.it>; Thu, 14 May 2020 10:42:31 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 30E132011F9
 for <ltp@lists.linux.it>; Thu, 14 May 2020 10:42:29 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1DA931B;
 Thu, 14 May 2020 01:42:28 -0700 (PDT)
Received: from a077208.arm.com (unknown [10.163.73.92])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C80913F71E;
 Thu, 14 May 2020 01:42:24 -0700 (PDT)
From: Vikas Kumar <vikas.kumar2@arm.com>
To: ltp@lists.linux.it
Date: Thu, 14 May 2020 14:11:56 +0530
Message-Id: <20200514084157.30625-1-vikas.kumar2@arm.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] syscall: Add io_uring test
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
Cc: vikas.kumar2@arm.com, viresh.kumar@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

   Added Linux asynchronous I/O API Test for io_uring_setup(), 
   io_uring_register() and io_uring_enter(). This test intend to 
   check basic io_uring api operation.
	
   io_uring_setup() creates submission queue and completion queue 
   to perform subsequent operations on the io_uring instance.
   io_uring_register() registers user buffers to kernel for long term usese.
   io_uring_enter() initiate and finish I/O using the shared sq and cq queue.
    
Signed-off-by: Vikas Kumar <vikas.kumar2@arm.com>


Vikas Kumar (1):
  syscall: Add io_uring test

 testcases/kernel/syscalls/io_uring/Makefile   |   8 +
 .../kernel/syscalls/io_uring/io_uring01.c     | 194 ++++++++++++++++++
 2 files changed, 202 insertions(+)
 create mode 100644 testcases/kernel/syscalls/io_uring/Makefile
 create mode 100644 testcases/kernel/syscalls/io_uring/io_uring01.c

-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
