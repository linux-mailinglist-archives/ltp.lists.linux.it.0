Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0EB74C92
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 13:10:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 94E3D3C1D70
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 13:10:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 85C4E3C1C95
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 13:10:31 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 35CF9601F87
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 13:10:29 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 910A1AFF9;
 Thu, 25 Jul 2019 11:10:28 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 25 Jul 2019 13:10:22 +0200
Message-Id: <20190725111027.18716-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/5] net/route: rewrite route-change-{dst, gw,
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

hope this version could be sufficient enough.

I've added some support to tst_net.sh for general IP address handling.

I'm thinking about adding support for adding general vlan support to
tst_net.sh instead of using add_macvlan() (virt_lib.sh, ipsec_lib.sh and dhcp_lib.sh would use it),
but that would be in separate patchset.

Kind regards,
Petr

Petr Vorel (5):
  tst_net.sh: enhance tst_add_ipaddr(), add tst_del_ipaddr()
  tst_net.sh: Add -m option to return mask in tst_ipaddr_un()
  network/route: Rewrite route-change-dst into new API
  network/route: Rewrite route-change-gw into new API
  network/route: Rewrite route-change-if into new API

 runtest/net_stress.route                      |  12 +-
 testcases/lib/tst_net.sh                      |  81 +++--
 .../network/stress/route/00_Descriptions.txt  |  54 +--
 .../network/stress/route/route-change-dst     |  33 ++
 .../network/stress/route/route-change-gw      |  38 ++
 .../network/stress/route/route-change-if      |  87 +++++
 testcases/network/stress/route/route-lib.sh   |  17 +
 .../network/stress/route/route4-change-dst    | 276 ---------------
 .../network/stress/route/route4-change-gw     | 292 ----------------
 .../network/stress/route/route4-change-if     | 324 ------------------
 .../network/stress/route/route6-change-dst    | 272 ---------------
 .../network/stress/route/route6-change-gw     | 292 ----------------
 .../network/stress/route/route6-change-if     | 323 -----------------
 13 files changed, 249 insertions(+), 1852 deletions(-)
 create mode 100755 testcases/network/stress/route/route-change-dst
 create mode 100755 testcases/network/stress/route/route-change-gw
 create mode 100755 testcases/network/stress/route/route-change-if
 create mode 100644 testcases/network/stress/route/route-lib.sh
 delete mode 100644 testcases/network/stress/route/route4-change-dst
 delete mode 100644 testcases/network/stress/route/route4-change-gw
 delete mode 100644 testcases/network/stress/route/route4-change-if
 delete mode 100644 testcases/network/stress/route/route6-change-dst
 delete mode 100644 testcases/network/stress/route/route6-change-gw
 delete mode 100644 testcases/network/stress/route/route6-change-if

-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
