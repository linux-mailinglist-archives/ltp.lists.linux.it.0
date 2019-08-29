Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C185A26FF
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2019 21:07:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DFAE73C2020
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2019 21:07:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 7AF933C1CFF
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 21:07:16 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 203EF602987
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 21:07:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B4E25AD22;
 Thu, 29 Aug 2019 19:07:15 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 29 Aug 2019 21:07:09 +0200
Message-Id: <20190829190709.30834-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190829190709.30834-1-pvorel@suse.cz>
References: <20190829190709.30834-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] tst_net.sh: Rename variables to comply name policy
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

internal variables are lower case, with _tst_net prefix

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_net.sh | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index eba60bd44..d5ed533b0 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -765,7 +765,7 @@ _tst_net_variable_setup()
 	# tst_net_ip_prefix -h
 	# tst_net_iface_prefix -h
 	# tst_net_vars -h
-	if [ -z "$TST_PARSE_VARIABLES" ]; then
+	if [ -z "$_tst_net_parse_variables" ]; then
 		eval $(tst_net_ip_prefix $IPV4_LHOST || echo "exit $?")
 		eval $(tst_net_ip_prefix -r $IPV4_RHOST || echo "exit $?")
 		eval $(tst_net_ip_prefix $IPV6_LHOST || echo "exit $?")
@@ -774,7 +774,7 @@ _tst_net_variable_setup()
 
 	[ -n "$TST_USE_NETNS" -a "$TST_INIT_NETNS" != "no" ] && init_ltp_netspace
 
-	if [ -z "$TST_PARSE_VARIABLES" ]; then
+	if [ -z "$_tst_net_parse_variables" ]; then
 		eval $(tst_net_iface_prefix $IPV4_LHOST || echo "exit $?")
 		eval $(tst_rhost_run -c 'tst_net_iface_prefix -r '$IPV4_RHOST \
 			|| echo "exit $?")
@@ -791,7 +791,7 @@ _tst_net_variable_setup()
 		tst_res_ TINFO "$LHOST_IFACES -- $RHOST_IFACES"
 		tst_res_ TINFO "$IPV4_LHOST/$IPV4_LPREFIX -- $IPV4_RHOST/$IPV4_RPREFIX"
 		tst_res_ TINFO "$IPV6_LHOST/$IPV6_LPREFIX -- $IPV6_RHOST/$IPV6_RPREFIX"
-		export TST_PARSE_VARIABLES="yes"
+		export _tst_net_parse_variables="yes"
 	fi
 
 	export TST_NETLOAD_CLN_REQUESTS="${TST_NETLOAD_CLN_REQUESTS:-10000}"
@@ -845,9 +845,9 @@ if [ -z "$TST_USE_LEGACY_API" ] && ! tst_cmd_available ping6; then
 	{
 		ping -6 $@
 	}
-	if [ -z "$ping6_warn_printed" ]; then
+	if [ -z "$_tst_net_ping6_warn_printed" ]; then
 		tst_res_ TINFO "ping6 binary/symlink is missing, using workaround. Please, report missing ping6 to your distribution."
-		export ping6_warn_printed=1
+		export _tst_net_ping6_warn_printed=1
 	fi
 fi
 
-- 
2.22.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
