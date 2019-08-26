Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 784EB9D16F
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 16:11:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B5D43C1D07
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 16:11:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 0F3013C180B
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 16:11:08 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id F0440100171A
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 16:11:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F162FADDC;
 Mon, 26 Aug 2019 14:11:06 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 26 Aug 2019 16:11:01 +0200
Message-Id: <20190826141101.10144-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] tst_net.sh: Fix root detection on netns on new shell
 API
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

When using LTP with netns ("Single Host Configuration"),
init_ltp_netspace before running test which performs checking for
TST_NEEDS_ROOT=1, therefore adding it is not enough.
It fails on adding netns:

RTNETLINK answers: Operation not permitted
sctp01 1 TBROK: ip li add name ltp_ns_veth1 type veth peer name ltp_ns_veth2 failed

NOTE: tst_restore_ipaddr is called before running tests only on netns,
in init_ltp_netspace, therefore tst_require_root_ as a check is enough.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi Alexey,

I also wanted to move variable setup (everything after
tst_default_max_pkt() definition) to separate function and call it
inside tst_net_setup() for new shell API, but all TST_* setup
(currently at least TST_TMPDIR_RHOST=1 and TST_NEEDS_ROOT=1)
would not work (we'd need to use tst_cleanup_rhost and _tst_require_root
directly, which is IMHO not good).

+ We might want to cleanup variables (prefix library internal variables
with _tst_net, use lower case), at least these two:
s/ping6_warn_printed/_tst_net_ping6_warn_printed/g
s/TST_PARSE_VARIABLES/_tst_net_parse_variables/g

 testcases/lib/tst_net.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 1678bcfda..5a149530c 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -105,7 +105,7 @@ tst_require_root_()
 init_ltp_netspace()
 {
 	tst_test_cmds ip
-	tst_require_root_
+	[ -z "$TST_USE_LEGACY_API" ] && _tst_require_root || tst_require_root
 
 	local pid=
 
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
