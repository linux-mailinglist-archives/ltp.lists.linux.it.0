Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B0A20305E
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 09:11:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2877D3C2C0E
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 09:11:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D6E1B3C2B12
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 09:09:46 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20066.outbound.protection.outlook.com [40.107.2.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 71E9E14017F3
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 09:09:46 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+3FSqTE2DkLsTARlvbbNj3maq6OwmcHBsJGp82eqs2PGWsy0c3ILWORG+Qf6VBhX/GHxtgz1Naa51JEl3A0Kd0mXQKaaQPcQQsXI37LfzYw0RnSQ78M2/p3T3a/mXzMMB111rOwY4biP7VRfH2+GoEvcHCG8GkSzfHv1xi38yIrtsnxRy/1Ol2dgja2KnGVCKvS+8AUjthEojuEo+LAi6cZinmQUkEMo89ExkFMUgqbNWc5uGGrq1T1weEaGntRUGLGjnw5l1NNHzbGs/mMlEiu7nwC1BRLrRnkg0sybrwnqZuQQ+NsyOH/UMrkuT5CwHrk0uEg5QpNy9/dmBbBFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDkCqSRRS90xZNSGUduD1V0g/gizGkWRjzOtVFIvvlI=;
 b=lSw44dIIC0qv+TitYfgyE9FBXMuSbAnmVWJAx/cl7ollvpELU0aahMK/eEewGTWInlV6lasYdJwH0Lf9GGIbtKX0o22FVd2btnOJJ68umnjBCAcc0cVorRIVWIqY8sLtpz6H15gHOwfDvdiuf4rObAEVZJhJeWEhXiRTbYWNP5UycxG3SGNqCzxZM1MrDq3Low9noxX3LQwAz/2DkVpiVLJEJPT5NxvVTPJKW4bINIeix1hxbanWYJq+ptFcpt8ocMpz2+eYANwATIELyVm2Aa/Nc1Zl4yPbTCusIkN4NmPVypYI83mcW1KgQDac3yEp4JFGZu6ICtJe0BAcdQFDXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDkCqSRRS90xZNSGUduD1V0g/gizGkWRjzOtVFIvvlI=;
 b=RY26Gamllx+tao173KuCCWZqr5cotyhfEoMGZJUPVCXwvo1/rWCudw7puWz27nGzyxoUYMIAMRzdl891c8yy8OMOVjGJ84n6KXIq8qvo/FQvFhj04ilL00yvL6g9Vxxc9udMBKD3uCoVtcBEhO9jhQGv53yuWfJsmaLmcDvgceFQSb0guYIPHOHN63LmmUk11gtBkxHk5gSgHf4k6VI9WeTcObLzXunHwAx8l81IoYLx5RzXm7bUTdOfqeTYnN6c2JDdhWfrKK772sLz+h8w6sYhXdXhGiTIDx8HYW4NHgt2WNPvTkvZrzQ9T5QE9Td+E9jTxMxi9aRC+1Gt0PvWYg==
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5503.eurprd04.prod.outlook.com (2603:10a6:803:d1::13)
 by VI1PR04MB5726.eurprd04.prod.outlook.com (2603:10a6:803:e5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 07:09:44 +0000
Received: from VI1PR04MB5503.eurprd04.prod.outlook.com
 ([fe80::394b:92df:1d86:d33e]) by VI1PR04MB5503.eurprd04.prod.outlook.com
 ([fe80::394b:92df:1d86:d33e%3]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 07:09:44 +0000
From: Petr Vorel <petr.vorel@suse.com>
To: ltp@lists.linux.it
Date: Mon, 22 Jun 2020 09:09:07 +0200
Message-Id: <20200622070911.16123-2-petr.vorel@suse.com>
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
 15.20.3131.10 via Frontend Transport; Mon, 22 Jun 2020 07:09:43 +0000
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [62.201.25.198]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecc07b10-647b-45e8-232b-08d8167b3d4b
X-MS-TrafficTypeDiagnostic: VI1PR04MB5726:
X-Microsoft-Antispam-PRVS: <VI1PR04MB57260DC0B2D04D93EF1B6071FA970@VI1PR04MB5726.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AmM8yTuzIUTwiDxP5BaUnJ4z/91dAvqMH04rcDZVMcQZnREa7RZftwFU9MemDEHk7YnOfqUi0KIwFqiZpT4+HVce73DOhEdSrxuqX8AD2eU2NyLE++F5TDWvTvIFr52P/gJhx/Y/pYqXhwBjg7cdwHzscvLsZEQ4s3ag+z+f0q/KzNL8EdJf8io7rpvvXb5svpIwnNRdGW8LU+DycZ5kg05XHXD1eSIcMJIDz8zJMYKqKkGT2jSTtjK0sUduumMwiu0LIbM/shSOs2XgjkNJCbaV/MmSlYPTuy87rDFjSbahDNWiNKan6TMCKZImITap
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5503.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(346002)(376002)(39850400004)(136003)(396003)(6486002)(52116002)(956004)(36756003)(8676002)(2616005)(6512007)(44832011)(86362001)(6506007)(26005)(186003)(316002)(54906003)(4326008)(16526019)(1076003)(8936002)(478600001)(5660300002)(6916009)(66476007)(66946007)(83380400001)(2906002)(6666004)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: TegSk1oPAAP3QLNDQORLqT1SvmLC+eR27AhAnZUV78wTQ55bA7k1xia5LLJYtV1aRrSsk/dY0n6R2hSDVICd3QfjyxI/k9M5ZvxUOWikRsHnbzmEJSjqWto+Qpxz9vZIF2xGwoBQlGaegQDBMHMGhgjCNI/CG7o3Ffgi4yh+vWePrjt/iyFUOIG9t+nzqNBRpOv6TFFysSZGYSkkxRqWhGNbbkPbPxU4jQh7peQDIO+JnP1h2vDOc0/0axI1axyus3tviTSQfK1ajKw6edHjaKLSQ4X2S2+KTPRelrKl3WYeB3GX2ATICFPzJA4tpiWEijuUg3FniLxM6EuFH6ZTAiTPht++oIRpLm3P9d38jb9eAt8+qgtaITepriiZ8NGpKQ9n0paWbsn5ifQM371PUmztjpB/IxewGt6j5an+tJbpBOEvE+UabVcm/QIWjzdmLZm2IUFPrGObJalAPSI6kLVfvFe2bOLUcnNtaBVPxNQ=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc07b10-647b-45e8-232b-08d8167b3d4b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 07:09:43.9617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2tVbVRsH+vqdlBn9k/1xB6O23pwi5P9eWS44WJciRr5EDf3GtlMFZDxycBC1DBqilnOBgH9Z8jBUydFOzfyqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5726
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_PASS, SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 22 Jun 2020 09:11:40 +0200
Subject: [LTP] [RESENT PATCH 1/5] tst_net.sh: Remove rsh support
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

rsh is not used nowadays. When was the first network library version
added in 18739ff06 (2014), it was a default + and ssh replacement was
optional. Netns based single machine testing was added in 5f8ca6cf0
(2016). After 6 years it's time to drop legacy rsh.

ssh based testing setup requires only RHOST variable, TST_USE_SSH has
been removed as unneeded. Also check for ssh in tst_rhost_run().

We still keep $LTP_RSH for some of the network stress tests, which has
not been ported to tst_net.sh yet.

Suggested-by: Alexey Kodanev <alexey.kodanev@oracle.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_net.sh | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 806b540cd..1b96b3bf4 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -136,7 +136,7 @@ init_ltp_netspace()
 # -b run in background
 # -c CMD specify command to run (this must be binary, not shell builtin/function)
 # -s safe option, if something goes wrong, will exit with TBROK
-# -u USER for ssh/rsh (default root)
+# -u USER for ssh (default root)
 # RETURN: 0 on success, 1 on failure
 tst_rhost_run()
 {
@@ -166,14 +166,12 @@ tst_rhost_run()
 		return 1
 	fi
 
-	if [ -n "${TST_USE_SSH:-}" ]; then
-		output=`ssh -n -q $user@$RHOST "sh -c \
-			'$pre_cmd $cmd $post_cmd'" $out 2>&1 || echo 'RTERR'`
-	elif [ -n "${TST_USE_NETNS:-}" ]; then
+	if [ -n "${TST_USE_NETNS:-}" ]; then
 		output=`$LTP_NETNS sh -c \
 			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR'`
 	else
-		output=`rsh -n -l $user $RHOST "sh -c \
+		tst_require_cmds ssh
+		output=`ssh -n -q $user@$RHOST "sh -c \
 			'$pre_cmd $cmd $post_cmd'" $out 2>&1 || echo 'RTERR'`
 	fi
 	echo "$output" | grep -q 'RTERR$' && ret=1
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
