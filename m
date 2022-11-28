Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C98E163A485
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Nov 2022 10:15:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 57BFD3CC644
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Nov 2022 10:15:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3E7BF3C585E
 for <ltp@lists.linux.it>; Mon, 28 Nov 2022 10:15:24 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id C06F41A00368
 for <ltp@lists.linux.it>; Mon, 28 Nov 2022 10:15:22 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4539DD6E
 for <ltp@lists.linux.it>; Mon, 28 Nov 2022 01:15:27 -0800 (PST)
Received: from e126380.arm.com (unknown [10.57.39.128])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 249DE3F73B
 for <ltp@lists.linux.it>; Mon, 28 Nov 2022 01:15:19 -0800 (PST)
From: Teo Couprie Diaz <teo.coupriediaz@arm.com>
To: ltp@lists.linux.it
Date: Mon, 28 Nov 2022 09:15:07 +0000
Message-Id: <20221128091508.75414-1-teo.coupriediaz@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 0/1] brk: use direct syscalls
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

Hello LTP maintainers,

This patch slightly reworks the brk01 and brk02 tests to use direct
syscalls with tst_syscall rather than calling through the libc.

While running LTP on a musl-based distribution, we noticed that the brk
tests were failing. It turns out that Musl prevents the use of brk
with their wrapper: it always returns an error.
This isn't too egregious as using brk is deprecated in favor of malloc
and it isn't part of POSIX anymore since POSIX.1-2001, but it _is_
different from glibc's beavior, which allows using it.

This patch allows proper testing of brk's functionality, independent of
libc specifics, and thus allows the tests to pass on Musl-based
distributions like Alpine.

Do you think this is a correct approach for LTP ?
From what I could see there are a few tests that use tst_syscall directly
and it doesn't affect the logic much for brk.

Green build:
https://github.com/Teo-CD/ltp/actions/runs/3563193507

This was discovered in the context of the Morello project[0].
[0]: https://www.morello-project.org/

Teo Couprie Diaz (1):
  syscalls/brk: use direct syscall

 testcases/kernel/syscalls/brk/brk01.c | 15 ++++++---------
 testcases/kernel/syscalls/brk/brk02.c | 14 ++++++--------
 2 files changed, 12 insertions(+), 17 deletions(-)


base-commit: 498247917f40b0a82cb149e2ec1cb518acd7b632
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
