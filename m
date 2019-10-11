Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C40CD410D
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 15:25:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 43D843C1814
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 15:25:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 0DF813C1454
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 15:24:43 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5C442140125C
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 15:24:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B9DA5AD95;
 Fri, 11 Oct 2019 13:24:42 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 11 Oct 2019 15:24:25 +0200
Message-Id: <20191011132433.24197-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v5 0/8] net/route: rewrite route-change-{dst, gw,
 if} into new API
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

Hi,

changes v4->v5:
addressed these Alexey's requests:
* tst_ipadd_un() now handles both host_id and net_id, with
-h MIN,MAX, -n MIN,MAX
(instead of -b, -f, -n which handled only host_id)

* add -q to tst_add_ipaddr() (silence test output)

* introduce EXPECT_{FAIL,PASS}_BRK() to shell API and use it to stop
test on first error.

@Cyril the only commit for you: "shell: Introduce EXPECT_{FAIL,PASS}_BRK()"

Kind regards,
Petr

Petr Vorel (8):
  tst_net.sh: enhance tst_add_ipaddr(), add tst_del_ipaddr()
  tst_net.sh: Add -p option to return prefix in tst_ipaddr_un()
  tst_net.sh: Add -h -n options to tst_ipaddr_un()
  net: Add tst_ipaddr_un.sh test
  shell: Introduce EXPECT_{FAIL,PASS}_BRK()
  network/route: Rewrite route{4,6}-change-dst into new shell API
  network/route: Rewrite route{4,6}-change-gw into new shell API
  network/route: Rewrite route{4,6}-change-if into new API

 doc/test-writing-guidelines.txt               |   5 +-
 lib/newlib_tests/shell/net/tst_ipaddr_un.sh   | 167 +++++++++
 runtest/net_stress.route                      |  15 +-
 testcases/lib/tst_net.sh                      | 173 +++++++---
 testcases/lib/tst_test.sh                     |  34 +-
 .../network/stress/route/00_Descriptions.txt  |  54 +--
 .../network/stress/route/route-change-dst.sh  |  34 ++
 .../network/stress/route/route-change-gw.sh   |  39 +++
 .../network/stress/route/route-change-if.sh   |  90 +++++
 testcases/network/stress/route/route-lib.sh   |  17 +
 .../network/stress/route/route4-change-dst    | 276 ---------------
 .../network/stress/route/route4-change-gw     | 292 ----------------
 .../network/stress/route/route4-change-if     | 324 ------------------
 .../network/stress/route/route6-change-dst    | 272 ---------------
 .../network/stress/route/route6-change-gw     | 292 ----------------
 .../network/stress/route/route6-change-if     | 323 -----------------
 16 files changed, 528 insertions(+), 1879 deletions(-)
 create mode 100755 lib/newlib_tests/shell/net/tst_ipaddr_un.sh
 create mode 100755 testcases/network/stress/route/route-change-dst.sh
 create mode 100755 testcases/network/stress/route/route-change-gw.sh
 create mode 100755 testcases/network/stress/route/route-change-if.sh
 create mode 100644 testcases/network/stress/route/route-lib.sh
 delete mode 100644 testcases/network/stress/route/route4-change-dst
 delete mode 100644 testcases/network/stress/route/route4-change-gw
 delete mode 100644 testcases/network/stress/route/route4-change-if
 delete mode 100644 testcases/network/stress/route/route6-change-dst
 delete mode 100644 testcases/network/stress/route/route6-change-gw
 delete mode 100644 testcases/network/stress/route/route6-change-if

-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
