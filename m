Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 42671BF599
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 17:14:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 03DE73C22CE
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 17:14:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 641063C22CD
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 17:13:33 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5E9571401817
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 17:13:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 77012AC68
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 15:13:31 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 26 Sep 2019 17:13:27 +0200
Message-Id: <20190926151331.25070-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/4] Increase bind() converage - GH#538
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

This patchset updates syscalls/bind02 to new API and adds a test that bind()
opens sockets for incoming connections. The test is split into two programs,
one for stream-oriented sockets and the other for datagram-oriented sockets.

Changes from previous version:
- minor code style fixes in syscalls/bind02
- refactoring of include/tst_net.h (patch #2)
- code from libbind.c and some setup code moved to tst_net.c (patch #3)
- added UDPLITE and SCTP test cases
- common constants and test_case data structure moved to libbind.h

Petr Vorel wrote:
> Both tests also share a lot of code. I understand you don't want to mix TCP
> and UDP tests (I would probably do), but could you at least move setup()
> and constants into libbind.h?

I tried to write a single test file for both at first but the code flow is
slightly different which would result in a huge if/else mess. In SOCK_STREAM
test file, main thread gets a new socket from accept() so it can (and should)
use read()/write() to communicate with peer. On the other hand, SOCK_DGRAM
test file has to do its own handshake and main thread has to use recvfrom()
and sendto() because the main thread never gets a point-to-point connection
to peer.

I've decided not to write test cases for SOCK_SEQPACKET+IPPROTO_SCTP (yet)
because this type of socket doesn't support connect() at all. The call will
succeed but write() will then raise SIGPIPE. So I'd have to write a third
test file with yet another slightly different code flow.


Martin Doucha (4):
  Update syscalls/bind02 to new API
  Create separate .c file for include/tst_net.h
  Add socket address initialization functions to tst_net library
  Add connection tests for bind()

 include/tst_net.h                         | 122 ++-----------
 lib/tst_net.c                             | 205 ++++++++++++++++++++++
 runtest/syscalls                          |   2 +
 testcases/kernel/syscalls/bind/.gitignore |   2 +
 testcases/kernel/syscalls/bind/Makefile   |   2 +
 testcases/kernel/syscalls/bind/bind02.c   | 154 +++++-----------
 testcases/kernel/syscalls/bind/bind04.c   | 180 +++++++++++++++++++
 testcases/kernel/syscalls/bind/bind05.c   | 192 ++++++++++++++++++++
 testcases/kernel/syscalls/bind/libbind.h  |  29 +++
 9 files changed, 672 insertions(+), 216 deletions(-)
 create mode 100644 lib/tst_net.c
 create mode 100644 testcases/kernel/syscalls/bind/bind04.c
 create mode 100644 testcases/kernel/syscalls/bind/bind05.c
 create mode 100644 testcases/kernel/syscalls/bind/libbind.h

-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
