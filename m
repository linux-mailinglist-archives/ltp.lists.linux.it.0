Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 290C8203063
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 09:12:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C54CF3C5E94
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 09:12:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id F0D523C2B12
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 09:09:48 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20066.outbound.protection.outlook.com [40.107.2.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2EEDC14017DB
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 09:09:48 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R4SBG++XMx49mbUgozcQ/aA1/F/iuRGHSi+5sYc/v9IBRzfvkHXs+YxtxvuEGhSSAI36hWtqgZ/AU1MGIp08TnDSNjZm8FYUgHWTDPyjoaJqfDlZsVEz3l4qMCOi5vy00q+METR8mv+lJrnwnjnkoIVoqwUlwVckutRxoik+LsN/rT0IcGpTspI0LMLow+k8Jm9Y4atpiVzq4Af5iP0Bkx5CAkXSMJiY4wzuyPLQoiv4sw09xAM1BG75IML3fiWk5AdA6ZrRAmxCRm/stoLbnEbUtOocOS/wx+eI/TaiXLnIhkSY3rzdC20mA7JJD0dIL8VxjI2wbhYoWatgH6mtLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVMmX4r7Usv9dDc7BC8eU7WLO3N+zl1+/ZFm0ZdrNb4=;
 b=WSH9un0BP1r8yZ94dWjlXKitUXULOSIa6Xp6rbAzqYkM/gofM9GlDVOjHztOSAEe8Dp7/2wQPKg8COYQBe/7aNObQi/I9J9tLLnfRe8You86zyETssHkn+ap2TxsrJG1+yh+CAoR4FXDbcx0Zm5yc4CWJZdCgFb+Uof4/vDWD3scyxuK3MZuHu/WEut+R8yYpBBFzttsv2TA026oALfQ/J9BCO/SZD0oXrjmeRjHfhZGGMGp8tnWVglYvRXG4XdrilQ7yMBculJErvtj9K8og9NndPXGXArEhqmXonllE8XzQwLz7NU8nK1p2ETn5k27a6fjsC/7q+Is9mqgGLXFsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVMmX4r7Usv9dDc7BC8eU7WLO3N+zl1+/ZFm0ZdrNb4=;
 b=G9jlfmgdtijLRMSGd1hVKQBRzIPnycy5We4TTfMZHpNo2pqlTkdajV5ijgRf3znaEDePgYunmLUFYrHn80hgHMUVvP1z4Aa5ZnR5nPP6wM2CqYNbfjp+vx0r41wF7YYW5unOk0l9k0q8rn6a5c/63e8QdvZMDJIyX3MbnaCpK/in4q6t5deVE/X3EaC9eMpUFrIa3ca1DIW0WGa5EXUz9wgT+EJKL+E62VafHJOw3ZoQXOKoSH4jDSrvWdIT6k6FeNJJgVDAOSjIBFDGzl/PWVlU0JtJrkBIgtfFQa9pB3z+NFabiSbYLDvwTzACNpy/HNrbb/B9ItKLLiavUcILHA==
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5503.eurprd04.prod.outlook.com (2603:10a6:803:d1::13)
 by VI1PR04MB5726.eurprd04.prod.outlook.com (2603:10a6:803:e5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 07:09:46 +0000
Received: from VI1PR04MB5503.eurprd04.prod.outlook.com
 ([fe80::394b:92df:1d86:d33e]) by VI1PR04MB5503.eurprd04.prod.outlook.com
 ([fe80::394b:92df:1d86:d33e%3]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 07:09:46 +0000
From: Petr Vorel <petr.vorel@suse.com>
To: ltp@lists.linux.it
Date: Mon, 22 Jun 2020 09:09:11 +0200
Message-Id: <20200622070911.16123-6-petr.vorel@suse.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622070911.16123-1-petr.vorel@suse.com>
References: <20200622070911.16123-1-petr.vorel@suse.com>
X-ClientProxiedBy: AM0PR07CA0016.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::29) To VI1PR04MB5503.eurprd04.prod.outlook.com
 (2603:10a6:803:d1::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from dell5510.arch.suse.de (62.201.25.198) by
 AM0PR07CA0016.eurprd07.prod.outlook.com (2603:10a6:208:ac::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.10 via Frontend Transport; Mon, 22 Jun 2020 07:09:45 +0000
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [62.201.25.198]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbde07fe-a31c-438c-6536-08d8167b3ed1
X-MS-TrafficTypeDiagnostic: VI1PR04MB5726:
X-Microsoft-Antispam-PRVS: <VI1PR04MB5726411C062CE90785F1CD8EFA970@VI1PR04MB5726.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KzV5St4CEdeakoHnGHtd8S/wIZ18Lv5MHaZRp/3gLSGxafo3yf6+EnZU/EaqgA4lvgmCw2zxOSU0RR/aTvWr2xgCuYLqJ7l8xpVTRG2doFPuV8PpZVJFd7xnSJUdo6vAB5Mh98k6gUX4Nt+9q6/io+6fmc21Lr0A6Ebglu6p7wZYX94SwV577h6qR3nVoy8hrqDMHBGCNi+U5tjVLbjIXPWewN9Klwe8A1J67MhBJ/785bQM1/yM+3v4zKo+ZNUX+YQf64h0LT3TxEXKbUvFmuo6cXK/0Yesw3+TQErrtCMueWQ+20uLs3rQtRgguD8xUwPRUy/kW7RhS7FVF0w9I1IOn+vikuUB2Wzlv6cAkgoBSzHMS6FDtNdJmxOMKQC6RMs/jbZnd6XSCLZR8pTUKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5503.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(346002)(376002)(39850400004)(136003)(396003)(6486002)(52116002)(956004)(36756003)(8676002)(2616005)(6512007)(44832011)(86362001)(6506007)(26005)(186003)(316002)(54906003)(4326008)(16526019)(1076003)(8936002)(478600001)(5660300002)(6916009)(66476007)(66946007)(966005)(83380400001)(2906002)(6666004)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: YKb6F8zh17qQE+UVn/3gwgpIOdQUSXHFX8jV3isZAQScI9zJ2c8xc1H+7X93JH9SkT9IeFJ8Kc3BRvLoZCj2D+uZzA2F6hozcP2wHsUVeviPcsa8wlFjnqAdCW7YdegkPFqCjIxGXp6Zivwj2xecDGYm1nErF9jeYlbxSSQgN2jbxUKhOlloaqLOB5Gj987nK/crfbPgQfosdozoKJoo9M7iuUAeDS5BZMgijoEpRMSsXJ4VMfZgrhDww3nThEaLRV7pzPFTRBiBIi92/oGrL3Yjm2I5vmfY/I2Sh+7VgU1OhXEFVE8SrTTZAG/eADyFCznSkmJATtNyq8PcVDHLNHFEVJmkjN2CrfRZ020D4Y6br1tHPnyJ7TrBtCCqBphwK5tD+RSg3B8y514eHWlBmV3qMnk07IJ77mNzPS1aopS/K0VFbQoSmkhaJ21fG4IiiUU30Btq5v/FnVlp4ewMRxHIYQQ+qno93dDtAlQssPM=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbde07fe-a31c-438c-6536-08d8167b3ed1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 07:09:46.4643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnKGvbdxUui/W6HhuA6mqYU491LTwSLiMrwHJA58iotBjj8xx9FXKb6a/bCvsqSpUUJbP/nN9iP1uvHz42M8lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5726
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_PASS, SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 22 Jun 2020 09:11:41 +0200
Subject: [LTP] [RESENT RFC PATCH 5/5] st_net.sh: tst_rhost_run: Add -d
 option (debug)
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

From: Petr Vorel <pvorel@suse.cz>

-d debug mode (print command and netns/ssh handling into stderr)

Add tst_net_debug() simple helper for printing into stderr.

Also use new parameter in tst_rhost_run.sh.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

RFC: I use it quite a lot, but not sure if needed.

Probably using $TST_NET_DEBUG instead of -d would be better.

If we merge "tst_test.sh: Print tst_{res, brk} into stdout" [1],
simple tst_res_ could be used. I was also thinking about adding new flag
"DEBUG", but that's probably not needed.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/patch/20200619192542.20113-1-pvorel@suse.cz/

 lib/newlib_tests/shell/net/tst_rhost_run.sh |  8 +++---
 testcases/lib/tst_net.sh                    | 29 ++++++++++++++++-----
 2 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/lib/newlib_tests/shell/net/tst_rhost_run.sh b/lib/newlib_tests/shell/net/tst_rhost_run.sh
index 4c034a4ac..ebcd4ca03 100755
--- a/lib/newlib_tests/shell/net/tst_rhost_run.sh
+++ b/lib/newlib_tests/shell/net/tst_rhost_run.sh
@@ -10,14 +10,14 @@ do_test()
 {
 	local file="/etc/fstab"
 
-	tst_rhost_run -c 'which grep > /dev/null' || \
+	tst_rhost_run -d -c 'which grep > /dev/null' || \
 		tst_res TCONF "grep not found on rhost"
 
-	tst_rhost_run -c "[ -f $file ]" || \
+	tst_rhost_run -d -c "[ -f $file ]" || \
 		tst_res TCONF "$file not found on rhost"
 
-	tst_rhost_run -s -c "grep -q \"[^ ]\" $file"
-	tst_rhost_run -s -c "grep -q '[^ ]' $file"
+	tst_rhost_run -ds -c "grep -q \"[^ ]\" $file"
+	tst_rhost_run -ds -c "grep -q '[^ ]' $file"
 
 	tst_res TPASS "tst_rhost_run is working"
 }
diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 2ed570a6b..d6845618d 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -130,11 +130,17 @@ init_ltp_netspace()
 	tst_restore_ipaddr rhost
 }
 
+tst_net_debug()
+{
+	echo "DEBUG: $@" >&2
+}
+
 # Run command on remote host.
 # tst_rhost_run -c CMD [-b] [-s] [-u USER]
 # Options:
 # -b run in background
 # -c CMD specify command to run (this must be binary, not shell builtin/function)
+# -d debug mode (print command and netns/ssh handling into stderr)
 # -s safe option, if something goes wrong, will exit with TBROK
 # -u USER for ssh (default root)
 # RETURN: 0 on success, 1 on failure
@@ -143,16 +149,17 @@ tst_rhost_run()
 	local post_cmd=' || echo RTERR'
 	local user="root"
 	local ret=0
-	local cmd out output pre_cmd safe
+	local cmd debug out output pre_cmd rcmd sh_cmd safe use
 
 	local OPTIND
-	while getopts :bsc:u: opt; do
+	while getopts :bc:dsu: opt; do
 		case "$opt" in
 		b) [ "${TST_USE_NETNS:-}" ] && pre_cmd= || pre_cmd="nohup"
 		   post_cmd=" > /dev/null 2>&1 &"
 		   out="1> /dev/null"
 		;;
 		c) cmd="$OPTARG" ;;
+		d) debug=1 ;;
 		s) safe=1 ;;
 		u) user="$OPTARG" ;;
 		*) tst_brk_ TBROK "tst_rhost_run: unknown option: $OPTARG" ;;
@@ -166,14 +173,24 @@ tst_rhost_run()
 		return 1
 	fi
 
+	sh_cmd="$pre_cmd $cmd $post_cmd"
+
 	if [ -n "${TST_USE_NETNS:-}" ]; then
-		output=$($LTP_NETNS sh -c \
-			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR')
+		use="NETNS"
+		rcmd="$LTP_NETNS sh -c"
 	else
 		tst_require_cmds ssh
-		output=$(ssh -n -q $user@$RHOST \
-			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR')
+		use="SSH"
+		rcmd="ssh -n -q $user@$RHOST"
 	fi
+
+	if [ "$debug" ]; then
+		tst_net_debug "tst_rhost_run: cmd: $cmd"
+		tst_net_debug "$use: $rcmd \"$sh_cmd\" $out 2>&1"
+	fi
+
+	output=$($rcmd "$sh_cmd" $out 2>&1 || echo 'RTERR')
+
 	echo "$output" | grep -q 'RTERR$' && ret=1
 	if [ $ret -eq 1 ]; then
 		output=$(echo "$output" | sed 's/RTERR//')
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
