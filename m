Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B942A203062
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 09:12:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 624F33C6767
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 09:12:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 2D4C03C2B12
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 09:09:48 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20066.outbound.protection.outlook.com [40.107.2.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DE45F14017CE
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 09:09:47 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQO54s3BznKF3p8xthmz1lK0x+eQiYVCrqydZ8LXWNlVNazQI5CkxeKSlGtTCrsR1NWIvpWA8wCu4t1qwMNcicLsuWlkCV124WW6S/3KCpbA0DRmFh9rj6GzT3q8ETjUqjSs9eR3CJ1/Uce7tJT0BGG3d9bHpAwF2yztFJJgKiwbgbuzoK4w+2whBDUSG5mzmRMSHoNAhrwzfn8eR2JI11IptJ3VC/CyeVgtkcF6BZ2rtoAy2xN2TBt4eeJKLaS8OImlq0GX6R9AAr2pGucbhtxmctgOxvrsGX1AyuZnbTP65ZKW/8t4TYEllVJcYXgf3tgkE7UG+RlA9Kr6/q52SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=et5NVp5a8UEQy6MHkRztmhthoHyXWuz3sJ0Tu1x44jw=;
 b=F7rrcDltuRsjZ0X0GRWTwQMIjVza5m2dB1439l8ISL50wM3rlVqNnYhdDSewBCq6u56XFa3b2+QqWoWe0VUmX3KB3Owgt93mdcBya2yN6Ieb9nruUpR441pmFc+LCe1pr8y3lKLtCP9euayX9daW1HyN7zZH72XWjeBNYHbep+xMp7lUFCUWruxW4LtiKo7meroPLpV0xQuOS019B6E60x9xHjqxNJE1pf7XE7Ovk2wCBka4jrdhrHdDFgPumGv5PbB640wEmhF/5tKSZuBRRSk0lwf5ZvxuIi9gezKdtOPrMQ3mEEVE9BZZdfPAsdRi3sgUhixuhbjh3y52x586GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=et5NVp5a8UEQy6MHkRztmhthoHyXWuz3sJ0Tu1x44jw=;
 b=EmaGgKEhDeoID2rKfyAKkHvwOyZR6nMnOrY8RLxIWTXW0j9zt+TzpCe5JdeLtSYEnLco4AomGWVlgtg1nVZ20tyH/wTc0N2GhFZUOcqfj0O4HXM3QPLS6mwtYW5Vuk2okhZ+lTTz4a5q6rwibIRVtk0dcqQmN3sVxES+zFhDzpmlRczAswD/6gif/kwK2Of0MoKdpAQhnTNSjn46JSnoJY43zTzMUI6MJdNL8yAVUnSRP2z4155HzlywHoHDBI8azD86L9ZT64F9FGPy1mSDejzx1GLnWNzZ2e2XTTq9DCONLHxgVKYyEe1owGPgewG/fbCYaNxG0iGJHk+ELGlVrA==
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
Date: Mon, 22 Jun 2020 09:09:10 +0200
Message-Id: <20200622070911.16123-5-petr.vorel@suse.com>
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
X-MS-Office365-Filtering-Correlation-Id: fe303318-9414-4297-e99f-08d8167b3e6a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5726:
X-Microsoft-Antispam-PRVS: <VI1PR04MB5726AC95A0DECF60040D6D44FA970@VI1PR04MB5726.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:60;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5x89unNfFZseXIyR3MBox/GfxAWqNUqyaqsbx4OBwEYb7KBBka65Y7NmOmWXENo3F8ZhQFPPVnD8f2rIS0hh7tgDZ94s284mVs72s+gCUl30FtoihrUZFmViz+jtgNpEWnaadCpl3ErIUeJImI6p3YcQx1jru+E4PzxTL6mOo2oYR+lRk+zEg/GPhmgpyqU95QU8lWs94kr2s+Up0oT98TbN1yOuJ0IVPWCuLTmpKya2UFwdGzpbCylb73T81wFG3YzjaGgTCtOfSLXkEFBDiETRg0M6GKdGSZ8ZoCnDl5+/TezvObRA1IpPwRYDmANv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5503.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(346002)(376002)(39850400004)(136003)(396003)(6486002)(52116002)(956004)(36756003)(8676002)(2616005)(6512007)(44832011)(86362001)(6506007)(26005)(186003)(316002)(54906003)(4326008)(16526019)(1076003)(8936002)(478600001)(5660300002)(6916009)(66476007)(66946007)(2906002)(6666004)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: o8t9SnAkV+ieoSejsIAI//AnEHmdv/lkO1FDgFn81dQR/qQOCm7shGrmwEiSF6UNZVuiQIUHvgq6zmWYef/Mqk1uP0bu5BJBG6rcy+I+W4rggXPvz+rxD/0MkP5NSZPNAvBMaQsvIsznqBvZQRMR8Js2D7i5oJDCJ3XUnvRkrK5ZqLj5y0r8GAHm+qGEpeGimmRydO6Rl4/T/PSqOKZY1YdYRBzbBy00askwnHtBldN7H5XNQmQwvMR0DX0WfuFqOvRIxEqf0NlUiRjoF7dX0SZEnC5UEIFkClEO43QT69+ts85fW7uNgBHEl5qwPCjxL9VF6FE1tR2jG66N7VRpbkpqUnfZHji3beL0FS3Bo8CV4BN3Q1QXI5hp6uOS2NfU0cY6K0k+zt/DdY/lgcucjYChBazUvGPrHNDWX88r7qQCr9B+2GIHLDu0Be3Ajew11yg7ajLgaqdu5PICGkyp9FcGsrcrEc3KMgHWAL9xSuo=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe303318-9414-4297-e99f-08d8167b3e6a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 07:09:45.8346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEM/fK9Qghi7q4inmh/fhFUVafK0O3JFj/ybNALmsKDTYtI5+Q+IaRmNY9JbmS6IOvAy23KrpQh2xzOFQsWpPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5726
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_PASS, SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 22 Jun 2020 09:11:41 +0200
Subject: [LTP] [RESENT PATCH 4/5] net/test: Add basic testing for
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

Regression test for use of nested single quotes
(fixed in previous commit).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/newlib_tests/shell/net/tst_rhost_run.sh | 25 +++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100755 lib/newlib_tests/shell/net/tst_rhost_run.sh

diff --git a/lib/newlib_tests/shell/net/tst_rhost_run.sh b/lib/newlib_tests/shell/net/tst_rhost_run.sh
new file mode 100755
index 000000000..4c034a4ac
--- /dev/null
+++ b/lib/newlib_tests/shell/net/tst_rhost_run.sh
@@ -0,0 +1,25 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
+
+TST_TESTFUNC=do_test
+PATH="$(dirname $0)/../../../../testcases/lib/:$PATH"
+. tst_net.sh
+
+do_test()
+{
+	local file="/etc/fstab"
+
+	tst_rhost_run -c 'which grep > /dev/null' || \
+		tst_res TCONF "grep not found on rhost"
+
+	tst_rhost_run -c "[ -f $file ]" || \
+		tst_res TCONF "$file not found on rhost"
+
+	tst_rhost_run -s -c "grep -q \"[^ ]\" $file"
+	tst_rhost_run -s -c "grep -q '[^ ]' $file"
+
+	tst_res TPASS "tst_rhost_run is working"
+}
+
+tst_run
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
