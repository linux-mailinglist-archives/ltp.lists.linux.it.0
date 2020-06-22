Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 415DA203120
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 09:58:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A2A43C6AE9
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 09:58:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id EB5213C6769
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 09:43:49 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30083.outbound.protection.outlook.com [40.107.3.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4C1E81000CBC
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 09:43:49 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afxQbvCIP3FzJTYGucjqy9pCGmNsvTF5/13Wnju0bXTVM7S1RfoXbHUDMeRjNxGc6OpSD0mlKuUF+xFDd4H3RrZBsbGMLI1zhs1CE6XV15KyX/MYHlJVwqsaCE3/9JYpmbVkCKt1kxfxC+jGUDlHsVBQkeS6r5IQ9FfjOqXdqDnps6lkQgtMoFt6B26DzQyhqRXFg5ZXjA1+LWGXg5jzlMGF3e7AVo54JrGcCjLN8Zb9BWp9YcE0+SeJxOIsDLdVKz1IUop7BjEXWZOEHhVUJhpUev9fkQBqnz4tVnM/10SQTXK5n5vvlQNNiASiPkNbobnQFu/ixQrOx+/mE5zZTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f90TEXseYK+yvoXzwChY7podcwer8p0zUtsYzVDgL0k=;
 b=ijNS/b6hky3vbaOX4dXSmdNp5nhJzLsLXPSDrSdxBQmy3hPDq/mOJDFomIpYWcFmBsWjYXFIEBt/uSciyUtHqRsJ4IIf+RallSFeoXfbI1J+KwjRXxZt2EbJlFeGQxQ9h9miiHadngWm/7IiHLzyOzFN1eHC7hNpYervzFuLfMmYn8RStpjQiFc6sjaOSIcAdvQ0/RhL8bsVXPR+qcrRg0GNQVa+eZYPmD2NGyPsV/UrWWm7fghWsBWb7eN0vFs7kpPQofZzIf+L26B1o9yAQfm42zYGxo/+VZ8KjRO/rt9JAWrQPGaHijjROoC7wH/IRGvAeoRMMBvcixdlgse3JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f90TEXseYK+yvoXzwChY7podcwer8p0zUtsYzVDgL0k=;
 b=CrHq16adzF0LdwRuQxYsBP1ZLlQFkmRUoVPqn8xWTI2TJRUpW4+1A6he4mN02/WzJlFidINWz8xLSzsrb2xNv2FW1XVppk01P/uKglBcV/4kRm3pVWE5+wlp1rhAF/zD6bALSAs2ObYYC+Pe3F8a3sxTtTSI3puKIw1987qOMWjfxwInfxUtyjKGbzz0H76tD8LrGnG2HzDAJbG44FCJ8T4nXeUVLGBMSQoSDErlmETCfA21iEje7zEQUZySAiIhaI4nPZfQ0UnlHDHyKHvs06bO3Y59rgv/tpXDt5yUumJcBnXR6GCfl1BdhyoKqxtJtj70kP7q8DVB1hGleKWXzA==
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5503.eurprd04.prod.outlook.com (2603:10a6:803:d1::13)
 by VI1PR04MB3133.eurprd04.prod.outlook.com (2603:10a6:802:9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.25; Mon, 22 Jun
 2020 07:43:46 +0000
Received: from VI1PR04MB5503.eurprd04.prod.outlook.com
 ([fe80::394b:92df:1d86:d33e]) by VI1PR04MB5503.eurprd04.prod.outlook.com
 ([fe80::394b:92df:1d86:d33e%3]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 07:43:46 +0000
From: Petr Vorel <petr.vorel@suse.com>
To: ltp@lists.linux.it
Date: Mon, 22 Jun 2020 09:43:13 +0200
Message-Id: <20200622074314.22098-1-petr.vorel@suse.com>
X-Mailer: git-send-email 2.27.0
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To VI1PR04MB5503.eurprd04.prod.outlook.com
 (2603:10a6:803:d1::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from dell5510.arch.suse.de (62.201.25.198) by
 FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.23 via Frontend Transport; Mon, 22 Jun 2020 07:43:46 +0000
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [62.201.25.198]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8905ff8e-6ed2-4344-526b-08d8167ffed5
X-MS-TrafficTypeDiagnostic: VI1PR04MB3133:
X-Microsoft-Antispam-PRVS: <VI1PR04MB313303F58DEF45F64DDA5232FA970@VI1PR04MB3133.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UMZRG80C1P36hFvaobj3sWCOoZIxcyBiF/y4B4LHmH28M+8xQxFnpJ5ARcVbyhkAB/RD8KMIDOin/lVvl46ZP1SOgyM+nHLfj4hceijOQFJ6otrYU9/uJtFSYGn79jposNI5zPPz3omFFkakHPV9teC+bAuYaZ+KAZUQTgZkbeJEF8HACZUE2ykiTxft/Zz040lZS0+yv0IMwa8MCcl4P7phAFTjxd68mvVhge8jnqFAYoQ1GkdEm55Mak7twWzegXM+cgCSC5srmO5iERME3+0bj7NQO+9UKo2FZGHNObebpi6TKlZQx5HwlO5JsEPDgctoC9WFwLCeKrB5TgdTTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5503.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(346002)(136003)(376002)(39850400004)(396003)(52116002)(6916009)(44832011)(6512007)(2616005)(956004)(16526019)(316002)(186003)(5660300002)(26005)(6666004)(36756003)(66946007)(86362001)(6506007)(8936002)(4744005)(4326008)(54906003)(2906002)(478600001)(1076003)(8676002)(66556008)(6486002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: zsS7n6G8kb66cbinlgD2GVuseIVnjFKt6iVXKmyUe0CZRG71sdnDKTUsm2CkBFFXoHvxTPxweawS1S7zSZn7O54S3uyrFA2CLEtSJwxM5HlMYUdE3RFxIuXh9zdN4xXoKPYLOw3+ioFeNU83yjleJELpvFSB5jBfth8Otk4603/U9XFj2xagWVb9vjkPku4DdOfnqNhOjDfLJfgcqjCi7l+FDCVv+E5d9g/bmomv9Xdm9hr1lD9+d/ZO21GYtztdgmH5a4d4pctu03TndnKsRFbmAWkuAsDjJiPtQl1x+CFA+gWUzshkH5KsQvi8D+m0YzQXyV0s7WOmEJxQn4jgEcZUSk1I7SXMlrKbdSzkwoSHaT3yrrYL3QwXL1X2LoYwxjCBT/qPsc/qtfVTW3vxOYYfmxN44HhCVWiiJpF9CN9kaDAlXf608qttpGsZUD7kBFQQDFf01VMhjRt5mHzUBTTVBoUN17D5K04CMHOMXjo=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8905ff8e-6ed2-4344-526b-08d8167ffed5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 07:43:46.6525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3i1D0SgFF5Zz90rrvQCcfNClizrsgw1aiubyAAzbqX0vUthXkR/DbsgcDB4CeuWe5/gsjVwyn4UOhsDhWL59wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3133
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_PASS, SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 22 Jun 2020 09:58:50 +0200
Subject: [LTP] [PATCH 1/2] cgroup: Fix build with -Werror=return-type
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

Adding bogus return to keep compiler happy.

Fixes: 3b716981b ("lib: add new cgroup test API")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

IMHO using pragma would be better, but I don't know how to write it portable way.

Kind regards,
Petr

 lib/tst_cgroup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
index f55d8818d..0118dd7b2 100644
--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -49,6 +49,7 @@ enum tst_cgroup_ver tst_cgroup_version(void)
 		return TST_CGROUP_V1;
 
 	tst_brk(TCONF, "Cgroup is not configured");
+	return TST_CGROUP_V1; /* fix -Werror=return-type */
 }
 
 static void tst_cgroup1_mount(const char *name, const char *option,
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
