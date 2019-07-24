Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC4372976
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 10:04:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ACEE13C1D14
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 10:04:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 381883C18F7
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 10:03:53 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 64C6960111C
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 10:03:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B8283ADC4
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 08:03:50 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Wed, 24 Jul 2019 10:03:26 +0200
Message-Id: <20190724080328.16145-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] [RFC] BPF testing
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

This patch set introduces a very basic test which kicks the tires of the bpf
system call. It doesn't actually load a eBPF program, I will create another
test for that. However I have some concerns which I will discuss while doing
that.

There are already extensive BPF tests in the kernel selftests. These appear to
be quite complex and test a variety of functionality. They also are far less
structured than LTP's modern tests and are tied to the kernel tree which makes
using them in QA a pain. There are also some tests in the BCC project, which
may test the kernel as a byproduct.

So there are a number of options which are not necessarily mutually exclusive:

1) Port (some of) the selftests to the LTP.
2) Port the LTP library to the selftests.
3) Focus the LTP's BPF tests on reproducing specific high impact bugs.

This patch set copies in the necessary headers so that we have zero external
dependencies. I will also use raw byte code for the program test which is at
least acceptable for trivial programs. So we do not need BCC or Clang/LLVM
with eBPF support or matching kernel sources to generate offsets into internal
structures.

For the time being atleast my preference would be for (3) while avoiding
taking on any dependencies to ensure those tests are run by users mostly
ignorant of BPF, but are still exposed to critical bugs in the BPF stack.

Richard Palethorpe (2):
  Essential headers for BPF map creation
  BPF: Sanity check creating and updating maps

 include/lapi/bpf.h                        | 242 ++++++++++++++++++++++
 include/lapi/syscalls/aarch64.in          |   1 +
 include/lapi/syscalls/i386.in             |   1 +
 include/lapi/syscalls/s390.in             |   1 +
 include/lapi/syscalls/sparc.in            |   1 +
 include/lapi/syscalls/x86_64.in           |   1 +
 runtest/syscalls                          |   2 +
 testcases/kernel/syscalls/bpf/.gitignore  |   1 +
 testcases/kernel/syscalls/bpf/Makefile    |  10 +
 testcases/kernel/syscalls/bpf/bpf_map01.c | 138 ++++++++++++
 10 files changed, 398 insertions(+)
 create mode 100644 include/lapi/bpf.h
 create mode 100644 testcases/kernel/syscalls/bpf/.gitignore
 create mode 100644 testcases/kernel/syscalls/bpf/Makefile
 create mode 100644 testcases/kernel/syscalls/bpf/bpf_map01.c

-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
