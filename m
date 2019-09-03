Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 55459A6B05
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2019 16:16:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E9D923C2105
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2019 16:16:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 7931E3C20B9
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 16:16:20 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5BDA1601926
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 16:16:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 61CFEAF54;
 Tue,  3 Sep 2019 14:16:18 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  3 Sep 2019 16:16:03 +0200
Message-Id: <20190903141610.28887-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v4 0/7] net/route: rewrite route-change-{dst, gw,
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

Hi Alexey,

this version address functionality problems you pointed out.
But yet there might need to be another version as I'm not sure about
tst_ipaddr_un() API changes.

Changes v3-v4:
* enhanced tst_ipaddr_un() with -b, -h -l, -m, -n and -p options (-p was
previous -m)
* use tst_ipaddr_un() options to fix address clash on host_id, net_id clash fix
by adjusting $1 in test (this is really inconsistent, see note at 3/7).
* added tests for tst_ipaddr_un()
* quiet EXPECT_PASS ping$TST_IPV6

Kind regards,
Petr

Petr Vorel (7):
  tst_net.sh: enhance tst_add_ipaddr(), add tst_del_ipaddr()
  tst_net.sh: Add -p option to return prefix in tst_ipaddr_un()
  tst_net.sh: Add (mostly) HOST_ID related options to tst_ipaddr_un
  net: Add tst_ipaddr_un.sh test
  network/route: Rewrite route{4,6}-change-dst into new shell API
  network/route: Rewrite route{4,6}-change-gw into new shell API
  network/route: Rewrite route{4,6}-change-if into new API

 lib/newlib_tests/net/tst_ipaddr_un.sh         | 239 +++++++++++++
 runtest/net_stress.route                      |  15 +-
 testcases/lib/tst_net.sh                      | 196 +++++++++--
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
 14 files changed, 595 insertions(+), 1868 deletions(-)
 create mode 100755 lib/newlib_tests/net/tst_ipaddr_un.sh
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
2.22.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
