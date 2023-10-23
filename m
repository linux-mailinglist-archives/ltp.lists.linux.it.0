Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A04F07D3922
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Oct 2023 16:18:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1FB083CECCB
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Oct 2023 16:18:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D6D4A3CECAD
 for <ltp@lists.linux.it>; Mon, 23 Oct 2023 15:57:24 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 348DD1000414
 for <ltp@lists.linux.it>; Mon, 23 Oct 2023 15:57:22 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D97332F4;
 Mon, 23 Oct 2023 06:58:01 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com
 [10.1.194.65])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 606613F64C;
 Mon, 23 Oct 2023 06:57:20 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: ltp@lists.linux.it
Date: Mon, 23 Oct 2023 14:56:44 +0100
Message-Id: <20231023135647.2157030-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 23 Oct 2023 16:18:31 +0200
Subject: [LTP] [PATCH 0/3] Various fixes for out-of-bound uaccess
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
Cc: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

This series addresses various situations where syscalls tests cause the
kernel to access arbitrary data, beyond the bounds of the object that
the test meant to specify.

Patch 1 and 2 are straightforward fixes for tests that don't pass
syscall arguments correctly.

Patch 3 is a little subtler, in that the argument is appropriately
passed, but the kernel ends up accessing arbitrary data due to the
referenced buffer being too small.

These issues were caught while running the syscalls suite on
Morello [1], using the pure-capability ABI [2]. Thanks to the capability
representation, pointers carry bounds that match the object they refer
to. The kernel accesses user memory via such capabilities, and as a
result a syscall will fail (-EFAULT) if any uaccess goes out of bounds.

A CI run can be found here [3].

Cheers,
Kevin

[1] https://www.morello-project.org/
[2] https://git.morello-project.org/morello/kernel/linux/-/wikis/Morello-pure-capability-kernel-user-Linux-ABI-specification
[3] https://github.com/kevin-brodsky-arm/ltp/actions/runs/6610988117

Kevin Brodsky (3):
  syscalls/{,f}setxattr: Fix passing of value pointer
  syscalls/msgctl06: Pass an appropriate struct to msgsnd()
  Provide a PATH_MAX-long buffer when expecting ENAMETOOLONG

 include/old/usctest.h                             | 12 ++----------
 testcases/kernel/syscalls/fsetxattr/fsetxattr01.c |  2 +-
 testcases/kernel/syscalls/ipc/msgctl/msgctl06.c   |  6 +++++-
 testcases/kernel/syscalls/rename/rename10.c       |  2 +-
 testcases/kernel/syscalls/setxattr/setxattr01.c   |  2 +-
 5 files changed, 10 insertions(+), 14 deletions(-)

-- 
2.38.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
