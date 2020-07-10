Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC2D21BC11
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jul 2020 19:21:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 02EDF3C14F8
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jul 2020 19:21:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 804D73C1C9A
 for <ltp@lists.linux.it>; Fri, 10 Jul 2020 19:20:57 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C26AC200AD6
 for <ltp@lists.linux.it>; Fri, 10 Jul 2020 19:20:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 41BE9AC50;
 Fri, 10 Jul 2020 17:20:56 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 10 Jul 2020 19:20:37 +0200
Message-Id: <20200710172044.21592-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/7] tst_net.sh: Remove rsh,
 update docs add debug & test
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

Hi Alexey, Xiao,

changes v1->v2:
* Add new commit "net: Remove rsh, rcp, rlogin tests"
* Use TST_NET_RHOST_RUN_DEBUG=1 instead of -d in tst_rhost_run

I wonder if we want to drop more TCP tests
(testcases/network/tcp_cmds/). Maybe:

* drop arping and clockdiff (they're legacy + IMHO they should be tested in inputils package)
* drop arp from ipneigh01.sh (keep only ip neigh)
* drop netstat (legacy, from net-tools) should be replaced with ss (iproute2)
* also ftp01.sh has non-trivial setup, but maybe there is a benefit in this smoke test
* how about telnet01.sh and host01.sh?

If we keep them I'd suggest (apart from porting to the new API) also use
different variable than RHOST for tests in testcases/network/tcp_cmds/
(ftp01.sh, host01.sh, telnet01.sh) to avoid having the same variable for
2 purposes, it's already used in two host configuration - now only ssh.

Other thing is the docs, we have setup in INSTALL,
testcases/network/README.md, than specific setup in
testcases/network/tcp_cmds/README, testcases/network/stress/README and
other various places. I'd prefer to have some cleanup, but first we
should decide which tests are worth to keep.

Kind regards,
Petr

Petr Vorel (7):
  tst_net.sh: Remove rsh support
  tst_net.sh: Use ssh in LTP_RSH
  net: Remove rsh, rcp, rlogin tests
  net: Update README.md
  tst_net.sh: Drop 'sh -c' use from ssh in tst_rhost_run
  net/test: Add basic testing for tst_rhost_run
  tst_net.sh/tst_rhost_run: Add debugging

 lib/newlib_tests/shell/net/tst_rhost_run.sh   |  27 ++++
 runtest/net.tcp_cmds                          |   3 -
 testcases/lib/tst_net.sh                      |  33 ++--
 testcases/lib/tst_test.sh                     |   2 +-
 testcases/network/README.md                   |  97 +++++-------
 testcases/network/stress/README               |   9 +-
 testcases/network/tcp_cmds/rcp/Makefile       |  30 ----
 testcases/network/tcp_cmds/rcp/rcp01.sh       | 144 ------------------
 testcases/network/tcp_cmds/rlogin/Makefile    |  31 ----
 testcases/network/tcp_cmds/rlogin/rlogin01.sh |  91 -----------
 testcases/network/tcp_cmds/rsh/Makefile       |  31 ----
 testcases/network/tcp_cmds/rsh/rsh01.sh       | 115 --------------
 12 files changed, 91 insertions(+), 522 deletions(-)
 create mode 100755 lib/newlib_tests/shell/net/tst_rhost_run.sh
 delete mode 100644 testcases/network/tcp_cmds/rcp/Makefile
 delete mode 100755 testcases/network/tcp_cmds/rcp/rcp01.sh
 delete mode 100644 testcases/network/tcp_cmds/rlogin/Makefile
 delete mode 100755 testcases/network/tcp_cmds/rlogin/rlogin01.sh
 delete mode 100644 testcases/network/tcp_cmds/rsh/Makefile
 delete mode 100755 testcases/network/tcp_cmds/rsh/rsh01.sh

-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
