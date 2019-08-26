Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 216889CDCE
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 13:10:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A774A3C1D22
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 13:10:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 44AEA3C0E60
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 13:10:27 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3D2481000D26
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 13:10:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 395A7AF62
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 11:10:25 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 26 Aug 2019 13:10:20 +0200
Message-Id: <20190826111024.19053-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v4 0/4] Basic eBPF tests
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

I've ended up playing with the patchset and fixed a few loose ends on
the map test and as I had the code at hand I decided to send v4 instead
of pointing out the mistakes in a review.

There were numerous small changes for the map test:

* Make sure the key buffer is sized exactly for the content

* Initialized the array/hash element value in test setup

* Made the code flow a bit more obvious, it was hard to tell which
  part was run for n == 0 and which for n == 1

Also it looks that for me the test that loads the eBPF program ends up
with EPERM randomly at about 10th iteration both as unpriviledged and
priviledged user, which is really strange.

Richard Palethorpe (4):
  BPF: Essential headers for map creation
  BPF: Sanity check creating and updating maps
  BPF: Essential headers for a basic program
  BPF: Sanity check creating a program

 include/lapi/bpf.h                         | 526 +++++++++++++++++++++
 include/lapi/socket.h                      |   4 +
 include/lapi/syscalls/aarch64.in           |   1 +
 include/lapi/syscalls/i386.in              |   1 +
 include/lapi/syscalls/s390.in              |   1 +
 include/lapi/syscalls/sparc.in             |   1 +
 include/lapi/syscalls/x86_64.in            |   1 +
 runtest/syscalls                           |   3 +
 testcases/kernel/syscalls/bpf/.gitignore   |   2 +
 testcases/kernel/syscalls/bpf/Makefile     |  10 +
 testcases/kernel/syscalls/bpf/bpf_map01.c  | 158 +++++++
 testcases/kernel/syscalls/bpf/bpf_prog01.c | 162 +++++++
 12 files changed, 870 insertions(+)
 create mode 100644 include/lapi/bpf.h
 create mode 100644 testcases/kernel/syscalls/bpf/.gitignore
 create mode 100644 testcases/kernel/syscalls/bpf/Makefile
 create mode 100644 testcases/kernel/syscalls/bpf/bpf_map01.c
 create mode 100644 testcases/kernel/syscalls/bpf/bpf_prog01.c

-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
