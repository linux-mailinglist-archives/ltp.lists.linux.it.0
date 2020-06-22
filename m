Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C84D203061
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 09:12:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A24343C2CD4
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 09:12:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id DCCCC3C2B12
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 09:09:47 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20066.outbound.protection.outlook.com [40.107.2.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 92C3414017DB
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 09:09:47 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOzD8W/fnSI0uLdFlByPI+7YMP8FXPTX8yQG0FQ2yS8+R0B2ahQT05R7DVTLS5Ry+FsZQ1kYIc4Q/b7F2IOyFicFCoeFELdm21zotF4QL5OY2R3s8WrR3nJMDDI+boSDidp6k3RhLoOBv5aK1CxqGzzqX7sAjLqnqREcH7WQKH/mjmhVqbeHgheP+KtPx0jBiZA0LzGFZOFH4PFrBXWQowHrprtpJrO8CsaspmgRjn8F0J0K+6zEpOWie2nd+U4ZhBhR1U0S6IHg6xJ59j76zZN0hfAwuaCf2zTBXE+HXAFRfwihbZGyfurgYyL9QOUgpzQfW0XHofVhJhRHHnwaeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2A8Gi9pqXZGkGjpfjUsI7KvSCZ0XZ7U1rLaLvz0Ln4Y=;
 b=j22MuzS3mat5fAWv+Nd+2iJeGcTQTLvyP5h6r/PKE6c3HENPB6RqtEv9j8c+Bl5jp//UhB4DB1GnlsoDyAeYMQCGCMQwETts0oIPsqbZRMukXYJ2gDrLhiAR/uc0we36u+mVjunaDJ/db5gjYxc23AD8Fm6rj3ttLMTpMsL8BtV8FbIIilB5OfJL4HoPKQl6wgirnwFXkORAywjFCKXveSbOa2uOZlp6rV9fqiNBiPUqyCrQVO/hyMz12v779t8X6Zg2diHp0M6IPr+yJN06+B4uNBva4fB6/TS6a+0H/1eUmNNlnJWysW1WuYcRyni3mNhvnOA4xaumYGLL1E0x9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2A8Gi9pqXZGkGjpfjUsI7KvSCZ0XZ7U1rLaLvz0Ln4Y=;
 b=D6xTJzPPEp4DaAjIkCfV8hF3wVoNmMN5tuKU6d7nobPbyQHAkS6YfLwb2808do1tsvssE6F3uz+KjVzWMTOS8/U1EWH7uHgBInKF+5IyOzSjnlPDOO6vwFs/upQizCNwOeRoOzhnaN5+0l/lv+Lx3EpxxKzO6W4n9XYJYJKC6JTVhf9++TAq96HiBH6fpoq2nF0ZNgm+NaBz5oLIuCVq7oWSUmBzp523dyfsV2A51cHV3vrOFKoeo0kbvf47ljXWc02YV3xqmD2mPhyDiXi8Gx1omkJGklNTwJfbYM+cV8C78cYD83v2QTWby5+B+aTp9yvAAwyGhbJK6Lhfb8T7wQ==
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5503.eurprd04.prod.outlook.com (2603:10a6:803:d1::13)
 by VI1PR04MB5726.eurprd04.prod.outlook.com (2603:10a6:803:e5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 07:09:45 +0000
Received: from VI1PR04MB5503.eurprd04.prod.outlook.com
 ([fe80::394b:92df:1d86:d33e]) by VI1PR04MB5503.eurprd04.prod.outlook.com
 ([fe80::394b:92df:1d86:d33e%3]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 07:09:45 +0000
From: Petr Vorel <petr.vorel@suse.com>
To: ltp@lists.linux.it
Date: Mon, 22 Jun 2020 09:09:09 +0200
Message-Id: <20200622070911.16123-4-petr.vorel@suse.com>
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
 15.20.3131.10 via Frontend Transport; Mon, 22 Jun 2020 07:09:44 +0000
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [62.201.25.198]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cddcdd6-5041-48c8-428d-08d8167b3e06
X-MS-TrafficTypeDiagnostic: VI1PR04MB5726:
X-Microsoft-Antispam-PRVS: <VI1PR04MB572637EE5DC62D1FAC6F90B3FA970@VI1PR04MB5726.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SSrW2NBh5pKsOq7oeeP0l+MJMNihpDfeRfHKPyoYCTfnwVIv5ogBlJgEshtrp9MfGLmntbJ0av6fx1S/sC8tHBHZUctgK4R1qN10cAsrbMCfi/JQdaQfsdhtS3Dat2CaXzGdw9Cb2p5wKw3J1LZDxzVWo8zuaW1OqJ2Ltxs6+yt8lZFkI0M5qdXqXRCAGY+ZUHe4WGLbVGpXjvgYiOYCNFreszEN2gE5EvCQtbzmeYQulH1sy4to6QcUic0Y487haSYlmn+kiFKD7xSrC/Qv3cSgkaYYisVjFlJ6gKo3/CqEXNWrEXEzwLL4oYBKSM69qDvx5I4eGg7wtRvig2LZTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5503.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(346002)(376002)(39850400004)(136003)(396003)(6486002)(52116002)(956004)(36756003)(8676002)(2616005)(6512007)(44832011)(86362001)(6506007)(26005)(186003)(316002)(54906003)(4326008)(16526019)(1076003)(8936002)(478600001)(5660300002)(6916009)(66476007)(66946007)(83380400001)(2906002)(6666004)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: cK/udthury0tX6Jmu5vBWepEd08caSzkvJi0m6ELNQp3cZyW9ICdbTAdoyit/e+oh71mHvu6jfA7vOblCtXRz0NO4oalECqyCnFHR7iEPUSbFMZbSkRvVuYQU4/MmsKh7j/wR4ScAccZHOZ0EwoC6HKDWS6rgekwmLSZsioN6OJqRfG1YYnaqpKfNK6ojcUd7f6SxyOzAK+ktObu5xk4DQsgPOUHTz46OxyXVCu07wLIzAe88g4GypHgvY80W3659YXeL4zHMHAPZWVpdZ0l+UCTR1ZDGDAE1p7PD1ssaS5zHtABhfAA/EftlxKtXcUInS2ahQXSH8et0JuLZuQdsNGahrgwiaNzw3HC9oEpF5OUHQZuheSuOt3NPauDFmZqcU61T1ojcN1ZL7l5E+bbb85kNPA+C0qYGfYxmoUf8w4nMYhNOcmxmvJ1E8S9AFPLrMLzITTgckJ8qqL28Ciq0O4ohq4kzd/L0FehF7pu/cY=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cddcdd6-5041-48c8-428d-08d8167b3e06
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 07:09:45.1820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7epTKkcF5WdNX2QsxiTb5Or18DwJuPOnYbztxaxP3s3DderEFp/0zM8VD2g9gXJu+hDPrtIYRIgDCDxzwU+raQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5726
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_PASS, SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 22 Jun 2020 09:11:41 +0200
Subject: [LTP] [RESENT PATCH 3/5] tst_net.sh: Drop 'sh -c' use from ssh in
 tst_rhost_run
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

This simplifies the command and allows to use double quotes in command
parameter for ssh, as it removes single nested quotes of command
parameter (thus fixes like c1a2d53f6 "network/nfs_lib.sh: Use double
quotes for grep pattern" are not needed any more).

NOTE: 'sh -c' is still required for netns based testing, but does not
use nested quotes. Now both variants use only double quotes.

Suggested-by: Alexey Kodanev <alexey.kodanev@oracle.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_net.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 1b96b3bf4..2ed570a6b 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -167,12 +167,12 @@ tst_rhost_run()
 	fi
 
 	if [ -n "${TST_USE_NETNS:-}" ]; then
-		output=`$LTP_NETNS sh -c \
-			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR'`
+		output=$($LTP_NETNS sh -c \
+			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR')
 	else
 		tst_require_cmds ssh
-		output=`ssh -n -q $user@$RHOST "sh -c \
-			'$pre_cmd $cmd $post_cmd'" $out 2>&1 || echo 'RTERR'`
+		output=$(ssh -n -q $user@$RHOST \
+			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR')
 	fi
 	echo "$output" | grep -q 'RTERR$' && ret=1
 	if [ $ret -eq 1 ]; then
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
