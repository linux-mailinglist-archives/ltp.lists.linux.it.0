Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8692E7AA1
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Dec 2020 16:49:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D4C63C558E
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Dec 2020 16:49:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 0A1453C28E3
 for <ltp@lists.linux.it>; Wed, 30 Dec 2020 16:49:27 +0100 (CET)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6E407600ABE
 for <ltp@lists.linux.it>; Wed, 30 Dec 2020 16:49:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1609343366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LLs2G4T/YZOAsDezoEgZMbCiTVEcUSKV4clTcWzo0O4=;
 b=VBGLAb0TyLAAPVbtZoNu5Kuq5BWdd0FFRn157XKHWmefiitZVIUEkzy7gbj7rv5+oNdKpW
 86bNQSldr4Lxm5FMS0Hw7jFxYI0P3MWX0xVJzQNs6WFRXs04IWQdmsLkUPOqeRudGrZFfM
 PShxlZ0bHfFKp/Wq5ieSR+e1ecppqCY=
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-rhI0mfLKNBazzgrPqhiyZg-1; Wed, 30 Dec 2020 16:49:25 +0100
X-MC-Unique: rhI0mfLKNBazzgrPqhiyZg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RX8pXh4Zdr+EBLUdCWJaqHPBsxEPBwjP8BflxlSzwfELKNFRs/60WvtnS1G0jg8U+LayOURvRsNobXuVTtGFDgEFZ/sZy9QAbJ227kP4my4WCkAynFCPeMsx9xchj3n9iD1djNVLKG0Hl3lRpdApuHSXtygstfugSUqUyneH5qZM0HYXRBt+29TuJGwQ7Sv8+uy32FoCmLdyDfTtcDKsPsglakYr/mUTCqhAKdNa2avk9aDXb/syXf2w91nniZr3tIINm1ibvoZV5OOpmLuoOPM0IRNL2EbDRTBvjtVCaITKpFgISo/XhCpnAYKCYZVQu9MUVGnqV4XNdVhrJGgQZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXNfpIbYxc6z8fQJEBG64WtgLYXWuw3RVLyfRMYi5Gs=;
 b=Tm5rZ9T+lOgIQcurR+aHAO7aJZ1JVfnj4SMpXkVTYPoL8nLWhmyMtJtw8q+ls8iipKSrSHKwAlhUQwwAMlJKZ95QSGa2G3wMteeL9P81zQALVjve5mqsf+0cSOXkDwbPeBqv3JJGZUoggRj0lA3d2L23AJSZ6FEoVkCFLYDqRNfrp4vjADP/qZHM924CSw4q0LqiO0mmsMlPKTp0Sx3+3Of2ERVvX+DNL0xJ30bUdoprLNmjG+oI304l5X7b0BbTiLfhzM9WXPot6+iwg4goQo3C5FkZsflOIsA8oXyPp4wYWgNzXFM31Zld+VpFI0YOWfm88H2jXW4bC06W8UkBfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB4958.eurprd04.prod.outlook.com (2603:10a6:803:60::23)
 by VI1PR04MB4173.eurprd04.prod.outlook.com (2603:10a6:803:47::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Wed, 30 Dec
 2020 15:49:23 +0000
Received: from VI1PR04MB4958.eurprd04.prod.outlook.com
 ([fe80::91d9:719a:add5:392e]) by VI1PR04MB4958.eurprd04.prod.outlook.com
 ([fe80::91d9:719a:add5:392e%6]) with mapi id 15.20.3700.031; Wed, 30 Dec 2020
 15:49:23 +0000
To: ltp@lists.linux.it
Date: Wed, 30 Dec 2020 18:48:56 +0300
Message-ID: <20201230154856.26252-1-bogdan.lezhepekov@suse.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [46.32.67.173]
X-ClientProxiedBy: AM5PR1001CA0050.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::27) To VI1PR04MB4958.eurprd04.prod.outlook.com
 (2603:10a6:803:60::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.info-lan.me (46.32.67.173) by
 AM5PR1001CA0050.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:15::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Wed, 30 Dec 2020 15:49:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acc76d32-293c-4607-47d2-08d8acda7a7a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4173:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB417384E0E3A82ED31E6D9EDF93D70@VI1PR04MB4173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /dimYstHJXhH3N/Zlr3/QjS1XZsrGvVkKLfsN1tVXYWXs11V7d14BQkqHJ/6t5rk3JbFG7Uie11Bvz3CBUl7Wq4iaV3hifQZ6ILiAl86leLg6KyzXWji25YicIAYEJ0gFrz5to3C5RsSzqmaGabDh8XXsoGrk9kX9UJ1swx/jer2IOVqguiBpyT6KpOuf6LugpECWDgx6LEWTcybV9eQlYG+wgDx/c/iehmSVcDq0ZrONixKkj49x+zEvJmvnqYrMo30+pulIw4xQzM5PYdoUdY5S/QcLW7m9icWTvRyso1sm5i47VLgEriqcBhZ0ly8Vhtp0C4o4nhRxWypPwTCVkmfMT+X0Nji21kTRvlSfhYMfawcPb+fu9Ysxn9L8HVjvf329r3dIQqtYNHYJhUeBbFDxJy9qVblc1i+xj39028ih1WKFd2zJXTJ2tjluqAk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB4958.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(376002)(136003)(346002)(316002)(4744005)(8676002)(16526019)(6916009)(186003)(36756003)(52116002)(6666004)(83380400001)(1076003)(5660300002)(6512007)(6486002)(478600001)(44832011)(956004)(107886003)(2616005)(6506007)(4326008)(66946007)(66556008)(8936002)(2906002)(66476007)(86362001)(26005)(81226002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QocCOP3Iejc58pSq6wKJFPkQJJJKDLXLiCVEq8EO220oKshEzIoAO226bXXW?=
 =?us-ascii?Q?gqZwwYj6gOxN2eWjT0bf8Z1Vt9+gBpifwDDOVUUP231uyUEe8as5/OdUO2Hu?=
 =?us-ascii?Q?6R4wNO9CfYcxbOPv0yweFkAPyGkXeK5xOlgDAlD95JDKaucmJgw75hTaMuUL?=
 =?us-ascii?Q?ueSnthFK3U6Mr/bpsLEqAmRIgU3LV5C+GpOAI15V0uxQwY2nsPY3Wp5UK/Gw?=
 =?us-ascii?Q?z06L7uVAzrU0NpK3xb6KPH3P0mBQrzh5BtFHKLVqh4nCkj5ojCT17h2mUX5I?=
 =?us-ascii?Q?GQLfko3WuIOuKB7O6v2WgMoOZJGMvaavebjXNdZDzi5dT8ioRCYjxN313SGM?=
 =?us-ascii?Q?D6Rj1YSsdzLX10XSIs8GFs+yG058L3c8bbmwRCALBU6mduMz3Ac/LjNadDrV?=
 =?us-ascii?Q?xV5CoRcLDGdycMIfSoolaUGAykKGYQ5tmAnx3TEZr1os42Aw9y9deuEJVQaM?=
 =?us-ascii?Q?V7hOUUQN7IVeEZChVcr18fffSwvoadpq3vNP9Zp0nbxHMIYnN8ydLI/ZXsOm?=
 =?us-ascii?Q?UtDWGPs2H0fE/hFP+RVO8ZDrbD8WB2F/i9+AZTVUSsAzsIPd2aWv4HTvjdlz?=
 =?us-ascii?Q?uokitntBW3x/2Jo3J+KI7cefKAdHyuMiIkqQz+76AcvDC9KEUXlVSFkFARtt?=
 =?us-ascii?Q?cd3k1nPifi0tza073tO4sSxuKd95PRwaERRr4ip3fEFzmxXIccPo7hrQJnxe?=
 =?us-ascii?Q?qukc4/dK0zm5P8GsJhEz90uWcskYwwO1WbXkgWdcSls5sa0jvuqdsdEAYwh9?=
 =?us-ascii?Q?Rw8qTGQYsPRJ48ZxfllRe8BqanKHPAv3qIYu8t7/iCLZUTtvC9tzhxcuS9GM?=
 =?us-ascii?Q?nh2cAvDOZir0F9EQel+6S0pmWoCRzFy5iQAK+641QVciV4Vozak7FJcV8GVW?=
 =?us-ascii?Q?p8jw2C/1HAC5ytdBLQT8nKGsz6VLzbmt+rk+ec4E6iTiGalGrUTS9Ht0a5td?=
 =?us-ascii?Q?3Ecy6G+G07s02Kg3tj1el2p16DwqHXuSVnxX5B6PkCg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4958.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2020 15:49:22.8738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: acc76d32-293c-4607-47d2-08d8acda7a7a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6n9Da46vceARELlfWrinX+lAmCetmzI/4pq5tIkQ1AGRRaFlBgnHp+W0fiIMxF4J69PIXiQSFdoiWbIEYnqnTIv1CNGf7iRn7+Z7rpCsl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4173
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v1] include/tst_cgroup.h: Replace hardcoded cgroup
 paths
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
From: Bogdan Lezhepekov via ltp <ltp@lists.linux.it>
Reply-To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Macros PATH_TMP_CG_CST and PATH_TMP_CG_MEM defined cgroup
temporary directory paths to be in /tmp that can be a mount point.

Enable an option to set PATH_TMP_CG_CST and PATH_TMP_CG_MEM
through TMPDIR environment variable keeping old paths as default ones.

Signed-off-by: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
---
 include/tst_cgroup.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/tst_cgroup.h b/include/tst_cgroup.h
index bfd848260..0f7db5487 100644
--- a/include/tst_cgroup.h
+++ b/include/tst_cgroup.h
@@ -7,8 +7,9 @@
 #ifndef TST_CGROUP_H
 #define TST_CGROUP_H
 
-#define PATH_TMP_CG_MEM	"/tmp/cgroup_mem"
-#define PATH_TMP_CG_CST	"/tmp/cgroup_cst"
+#define PATH_BASE (getenv("TMPDIR") ? getenv("TMPDIR") : "/tmp")
+#define PATH_TMP_CG_CST (strcat(PATH_BASE, "/cgroup_cst"))
+#define PATH_TMP_CG_MEM (strcat(PATH_BASE, "/cgroup_mem"))
 
 enum tst_cgroup_ver {
 	TST_CGROUP_V1 = 1,
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
