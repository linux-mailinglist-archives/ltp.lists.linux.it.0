Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE39E05FF
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 16:08:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EDF733C203D
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 16:08:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 54DB73C1C89
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 16:08:00 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 57FDA600EBD
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 16:07:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A1B29B7EE
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 14:07:58 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 22 Oct 2019 16:07:55 +0200
Message-Id: <20191022140757.29713-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/2] Add support for a test tags
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

This is a newest version of the test tags, first patch adds a support
for test tags to a test library, the second one annotates tests with
tags. Not everything is annotated at the moment but fair amount of tests
is included.

These patches are also a stepping stone for the test metadata project
that will allow us to do much more than this. You can have a look at:

https://github.com/metan-ucw/ltp/tree/master/docparse

Also if you run a make in the docparse directory it will generate test
metadata along with a single html page with nice test metadata
description.

While the whole project is work-in-progress, the test tags are finished
and may add a value even without the rest of the changes, see the first
commit for details.

Changes for v2:

- Made the output more compact both for the -h flag as well as for the
  failure annotation (see the first commit for example output)

- Changed function name from print_test_info() to print_test_tags()

- Converted two more {NULL, NULL} into {}

Cyril Hrubis (2):
  lib: Add support for test tags
  testcases/kernel: Add linux git and CVE tags

 include/tst_test.h                            | 10 ++
 lib/tst_test.c                                | 91 +++++++++++++++++--
 testcases/cve/cve-2014-0196.c                 |  5 +
 testcases/cve/cve-2015-3290.c                 |  5 +
 testcases/cve/cve-2016-10044.c                |  5 +
 testcases/cve/cve-2016-7042.c                 |  5 +
 testcases/cve/cve-2016-7117.c                 |  5 +
 testcases/cve/cve-2017-16939.c                |  5 +
 testcases/cve/cve-2017-17052.c                |  5 +
 testcases/cve/cve-2017-17053.c                |  5 +
 testcases/cve/cve-2017-2618.c                 |  5 +
 testcases/cve/cve-2017-2671.c                 |  5 +
 testcases/cve/meltdown.c                      |  6 +-
 testcases/cve/stack_clash.c                   |  4 +
 testcases/kernel/crypto/af_alg01.c            |  5 +
 testcases/kernel/crypto/af_alg02.c            |  5 +
 testcases/kernel/crypto/af_alg03.c            |  4 +
 testcases/kernel/crypto/af_alg04.c            |  4 +
 testcases/kernel/crypto/af_alg05.c            |  8 +-
 testcases/kernel/crypto/af_alg06.c            |  4 +
 testcases/kernel/crypto/crypto_user01.c       |  6 ++
 testcases/kernel/crypto/crypto_user02.c       |  4 +
 testcases/kernel/crypto/pcrypt_aead01.c       |  5 +
 testcases/kernel/sound/snd_timer01.c          |  6 ++
 testcases/kernel/syscalls/accept/accept02.c   |  5 +
 testcases/kernel/syscalls/acct/acct02.c       |  4 +
 testcases/kernel/syscalls/add_key/add_key02.c |  5 +
 testcases/kernel/syscalls/bpf/bpf_prog02.c    |  4 +
 testcases/kernel/syscalls/bpf/bpf_prog03.c    |  5 +
 .../syscalls/futex/futex_cmp_requeue02.c      |  5 +
 testcases/kernel/syscalls/keyctl/keyctl02.c   |  4 +
 testcases/kernel/syscalls/keyctl/keyctl04.c   |  5 +
 testcases/kernel/syscalls/keyctl/keyctl05.c   |  4 +
 .../kernel/syscalls/move_pages/move_pages12.c |  6 ++
 .../kernel/syscalls/realpath/realpath01.c     |  4 +
 .../syscalls/request_key/request_key05.c      |  4 +
 testcases/kernel/syscalls/sbrk/sbrk03.c       |  4 +
 testcases/kernel/syscalls/sendto/sendto02.c   |  4 +
 .../kernel/syscalls/setrlimit/setrlimit06.c   |  4 +
 39 files changed, 270 insertions(+), 9 deletions(-)

-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
