Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DBA37BA94
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 12:31:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 13A613C6472
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 12:31:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8FE343C4CA2
 for <ltp@lists.linux.it>; Wed, 12 May 2021 12:30:59 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AE75A200AE2
 for <ltp@lists.linux.it>; Wed, 12 May 2021 12:30:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 24E87B028;
 Wed, 12 May 2021 10:30:58 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 12 May 2021 12:30:52 +0200
Message-Id: <20210512103052.9646-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] netns_helper.sh: Fix parsing recent iproute2
 versions
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
Cc: Alexey Kodanev <alexey.kodanev@oracle.com>,
 Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

iproute2 prior v5.8.0 contained snapshot date:
$ ip -V
ip utility, iproute2-ss190107

But since version v5.7.0-77-gb687d1067169 (released in v5.8.0) there is
new scheme. For releases it contains kernel version:

$ip -V
ip utility, iproute2-5.8.0

and for snapshots build from git it contains version generated with git
describe:

$ip -V
ip utility, iproute2-v5.10.0-74-g2953235e

Thus the original parsing in tst_check_iproute() leads to error:
[: too many arguments

Because function was used only on single place, move expected version
into the function and consider new format as always valid.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

there are more tests which need ip version check: mc_cmds.sh,
netns_netlink.c, netns_helper.sh.

netns_netlink.c can be checked for tuntap support with simple running
'ip tuntap' [1], mc_cmds.sh correctly detect new version with new
scheme, thus only netns_helper.sh needs to be fixed, although it's just
a warning.

Proper way would be to have C implementation to check version, which
would be reusable in both C and shell. I plan to add it after the
release but because there is git freeze due new release sending just
this quick fix.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/patch/20210512100746.5907-1-pvorel@suse.cz/

 testcases/kernel/containers/netns/netns_helper.sh | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/testcases/kernel/containers/netns/netns_helper.sh b/testcases/kernel/containers/netns/netns_helper.sh
index a5b77a0aa..4dac0e306 100755
--- a/testcases/kernel/containers/netns/netns_helper.sh
+++ b/testcases/kernel/containers/netns/netns_helper.sh
@@ -47,16 +47,21 @@ IFCONF_IN6_ARG=
 
 tst_check_iproute()
 {
-	local cur_ipver="$(ip -V)"
-	local spe_ipver="$1"
+	local current_ver="$(ip -V)"
+	local expected_ver="111010"
 
-	cur_ipver=${cur_ipver##*s}
+	current_ver=${current_ver##*s}
 
-	if [ -z "$cur_ipver" -o -z "$spe_ipver" ]; then
+	if [ -z "$current_ver" ]; then
 		tst_brk TBROK "failed to obtain valid iproute version"
 	fi
 
-	if [ $cur_ipver -lt $spe_ipver ]; then
+	# new version scheme since v5.7.0-77-gb687d1067169
+	if echo "$current_ver" | grep -q 'iproute2-v\?[0-9]\+\.'; then
+		return
+	fi
+
+	if [ $current_ver -lt $expected_ver ]; then
 		tst_brk TCONF "too old iproute version"
 	fi
 }
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
