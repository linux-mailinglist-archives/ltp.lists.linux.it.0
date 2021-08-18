Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF5D3F0238
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 13:05:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 972B33C55BD
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 13:05:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EFD7A3C2EC6
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 13:04:57 +0200 (CEST)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3F075600C28
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 13:04:55 +0200 (CEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17IB2R3g027270
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=afhtoNiwEU/+RNxiuRI3ZjaxBheG7tycvEM/0+HV25U=;
 b=FbDUqB/CFgSusKjOtMnaK6ZiQ9eDPtQOshP7MbEv9tUF48R4xMHTNTnChDl/TWF6DslN
 m0TzrzHAd8FDcHyFEgPfNPYT6/taxhQhMkXh+b693+N9Exgi3f5B9lFzx/HFN1K3SS6R
 chz2T+AcR5vXnktSpYkzP4azCNiMSsttzEwjK29rBCa/OWA7hl99ulUz4IiuEWbMwCac
 zu2NYmy00lVZnxCO4Y1lp9ODaj1xGmOjLMTudsOVqrrxY8rfGMotNft1/1Fk3PeiFgQ9
 MBX8fsN5Fvu6KRvJWlRy7iwfjcuDVMXfVOxmv65sU5E0flqLgYI5UpOdFDX50AWT32aB 6Q== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2020-01-29;
 bh=afhtoNiwEU/+RNxiuRI3ZjaxBheG7tycvEM/0+HV25U=;
 b=WrGiu3kSviuJ5J1iaWttytLucY9/clBdmbVaCfcSa3478aoFWL11Rp1y1bzUxRfIqK6Z
 0PJNcmQVF0t6vbdOacMtPopLBPQrPz53yyJDuxqrMp1NQuADMIDBBTnv9uiYfVBCNZQW
 yTyIZTRTdlnJ31R/rynXMY3iiMyM5WQLiMXz3AbNG9hTdt4OQsJLX/vv3R5T7GPai+84
 2Z0JEPMllYm5FQDyokJXu7RQntLFWjKJ349SiZdbrORVYMcsazLgfOQvAMb6BwNtiLCu
 oFcJbVEgAvQllitP92MzXkMb9R7o1l6MxWESeuLhdgqPOUA6PVtZWlxYQwIXNOeAd9iO YQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3age7mtd0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:04:54 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17IB13Ue121330
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:04:53 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by userp3020.oracle.com with ESMTP id 3aeqkw1kc0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:04:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Igcp753TTyWGZE6UitVJtJq+rm6n5jNAcHWywe7gEoGZSVStr79SBC6WhNuuuVqPXYHu0ugMaST10SydqTlpF2mYn+YfmPPHI9pNCYYfk9S3aHXOstX8hCxgbzEQDyBC0sZTbT7OpCsmvLWOIiX6LKb9sYbTLp1tWMT/qQU8VcW4U6rKktmJnNs29Nv66WWrAW7cEjuaxUoQi1BzClD1n6YAbqZ0/SLL8B2E9b9W/2hSTzXoDOHxzyWollqPi8rk83zUmP8yGzH6fZWC4NaiIKEqt21sN8i70zWGJsyXRf0r7UDodTw1RimKBtaSZ69NeUkX9Y3G+w6rVxP9/nmH0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afhtoNiwEU/+RNxiuRI3ZjaxBheG7tycvEM/0+HV25U=;
 b=Tv6iKrO1H/DXAyZEqwFuN2o/VrgU4p8HyuWsvdMZeOvgYCpnogRS6zCJwGNL6+fNY32nutN2BV8nGA4wYACRAztLXSrUoo9op/8YdA8tnkIwFhmngLz6GTAMjJA5u1excojYCJOzGost/b1/mOpHc8nR3OvyxVHVG6uGqIVXzWvxo3Ct1s6WOWqfxG226GmHORcugjjZkl+kkU/BIJXP2foePZqkf1/BZY4XNHa+gYRaCcX47EjzFsejRcQ65hWHah0PUOCgl4jVblcMv2Ejfh93VhcrsptxTrq1ck1R6Ach64uPlGR32oXlLaLVC3ws2B2yDbxGwapYFPzXdhytqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afhtoNiwEU/+RNxiuRI3ZjaxBheG7tycvEM/0+HV25U=;
 b=slluyRLE4syVLPMj+nmaT+mKovSqJnUm/Xg6faZtCXzquSxp4ndGL9gGUcSZJSzt7noFi0mqMH7vw8c3LRUWUH8zzYLf6KVOFUBjeuJyRUhc747a9eFB2LuptVbboK5j0lcDhRhN7xYFnXPk2Qm2+AirSfSB9zwIncA+nrQdtg8=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=oracle.com;
Received: from CY4PR10MB1847.namprd10.prod.outlook.com (2603:10b6:903:11d::11)
 by CY4PR10MB1959.namprd10.prod.outlook.com (2603:10b6:903:126::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.22; Wed, 18 Aug
 2021 11:04:51 +0000
Received: from CY4PR10MB1847.namprd10.prod.outlook.com
 ([fe80::70e3:ba65:bc27:d206]) by CY4PR10MB1847.namprd10.prod.outlook.com
 ([fe80::70e3:ba65:bc27:d206%5]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 11:04:51 +0000
From: Egor Petrov <egor.petrov@oracle.com>
To: ltp@lists.linux.it
Date: Wed, 18 Aug 2021 14:04:40 +0300
Message-Id: <20210818110440.285-1-egor.petrov@oracle.com>
X-Mailer: git-send-email 2.32.0.windows.2
X-ClientProxiedBy: AM4PR07CA0009.eurprd07.prod.outlook.com
 (2603:10a6:205:1::22) To CY4PR10MB1847.namprd10.prod.outlook.com
 (2603:10b6:903:11d::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from EPETROV-7310.ru.oracle.com (138.3.203.22) by
 AM4PR07CA0009.eurprd07.prod.outlook.com (2603:10a6:205:1::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.5 via Frontend Transport; Wed, 18 Aug 2021 11:04:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25bbae9e-bd60-43ee-1806-08d96237fffd
X-MS-TrafficTypeDiagnostic: CY4PR10MB1959:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR10MB195946D39496F6246AE8BAB698FF9@CY4PR10MB1959.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: owGZlI+8W12PywT0Sv/POiWLJ1Sq0YlwU+5F6v4rvihosT1TrOi7w5iyQiUOL6AhQa/ERdvUd4bsy+L4B8tcIGH4fELAnMaPgk3ATLQ/WHrIgf/20L2F9WW3CKw++y4l/YM1SJLTMA8Os0ZEcrqt7+Haw7bWYWS2z7BNIl5p91DpLP4Fo+isVWH3XBwyC02poChiVqjLr1mmHEePZ+cSLYkzG9y7xaROj/bYY5nSNhwsj7o1zWvf3OHVeNdIZWNEW1ojwfFEF55k7QGvHJcwolEAdaBBgIOZq+vql9MFBe/arA/N4zQlQILrwcrDrn+12+WOJvh3m6GpJq3J/ZPAvNIOIcG/P30V+X+oZKHtKOiYYfoy1h9BYprKqknjrtUD58NCNBK4m5oUSnd5kvt2W1/rAwNgpuiRt7Zr7fIcVSJ/yk58kP6CXWAdmIYGwF4gIHmKqoqgumFAdT+IamTwpEFVUhXY/08OIxhjDLDEZSabPkrUDIExd5TwskKuibHMcSc4GgzMiXtOJHYskjh99Gis2vz5Vzl8nqRI1Ae6/TLOn0K5SDts546bdtx0h5j+X0IK5OgomRPj4X/YeZ6ShNRk6n7NEGIe3h6ephJ/ljkD3rDZaq4X5WpC0Rs5o7kcw0pspYBAljMqbpwrEkSbf5z+UugvpNNo4mtbVYkFnuelZ2k0EaoPL+qW529xW1FTvBpA9SdDO6ftE9o03PawFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR10MB1847.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(346002)(366004)(39860400002)(376002)(2616005)(1076003)(956004)(107886003)(186003)(36756003)(4326008)(26005)(8676002)(44832011)(6916009)(4744005)(6486002)(2906002)(5660300002)(316002)(6666004)(38100700002)(8936002)(66476007)(38350700002)(66556008)(52116002)(7696005)(83380400001)(86362001)(478600001)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mgrQqVsDklId+viZi5kVCRgcUbctTwmmWPRzOQ/I0F5IP7dFQB2d750nlXSL?=
 =?us-ascii?Q?jPQf9lN0rdo3ISX2Qbw6Xwt+sTvTPZ05Cu7IFisj/pKYfm9/46yw9dSQZ1M3?=
 =?us-ascii?Q?79X/zOBXqkl3VlfHbDtgCiRbf6auiWNQfyxbSn6FyWSahSeUTBsqhglFINO2?=
 =?us-ascii?Q?WtvGqVSK5pplN3AckVsmS9WfbQZTw9uruvczuoKK465Q32+2C9IbkupPC3QS?=
 =?us-ascii?Q?MJjHZlMbm6QWUzRUFcON3IBe9PgprMtRjXUl9CJkniDNjw+M3OTaqNBvxpoH?=
 =?us-ascii?Q?fWpJijHdwIbPXtZ5sGEmIJoD7BmYXf/N3jucHx/tSBAvjcIT3h2cVy5t0kgr?=
 =?us-ascii?Q?mO9lSMqZnQNp+iyW+a6kaMsGeez63xHWKfIbSuD0H3aW6L3dDWDgbdCMM+yI?=
 =?us-ascii?Q?SBofwG9ecNdiADVu8L/V97pHbrYDqKfV8FdpmMMlUEZmiAwX3ec+kd1p7Omn?=
 =?us-ascii?Q?hxXy5YiIoQY9APUj3oqRRMUG5QwDVzMb5UaPwQGMn71EBFKZhgL6zNNGKYhj?=
 =?us-ascii?Q?D4pVdq6QxyBskzilCWIa7dB5JrRenlygKDmRje8l0Wj1rnKEhxGNixZ0oS45?=
 =?us-ascii?Q?1iKjMkyHaqfjxqvC7DHD7zY0vbIFZ1zDXuiNl1506hfR8ookN3Vo/r/Qa39R?=
 =?us-ascii?Q?7Wu4gAOmMOivJHAJBvgQ9pvVHQgR84bwFOZ2yBiGl55liyfuZahMvZLDjxDm?=
 =?us-ascii?Q?O76+YudDofUUqzORjDh7rKklMlSK6ibg9ygUy4zUI0+iIr3CdTmGwIEGag3t?=
 =?us-ascii?Q?mCflotLqgQ/N9qFa3KIJPI/FJVpdkjz7g5h+mPoBmrb+MAitimRN5GqYLXa5?=
 =?us-ascii?Q?n3fAPKfSo9+04kmHBmQggwahniJmfTha2oaayJzIX6AFjqouuEDIx7jLzXiG?=
 =?us-ascii?Q?yNpNWjL39mPb4+1j9NXa2q9kDmveFUqP+X6FdhRjZ1s0lmHGxvgJrwNEdmpy?=
 =?us-ascii?Q?X1AlSwU8ZSpFquFId7O2UHfKSiB9O4h1u3Tn07RE2X8l0B+HnmC7NJBD7tCl?=
 =?us-ascii?Q?VDgTI3M1MZLAhHszGLWn7LRarNe8XosHco6gfGasNzLhzusYljadb1/kz0+t?=
 =?us-ascii?Q?xB5L7DsoXiyNtFKzkztW+mPHdh5hYTUZ/S4NZgQXGbX6lanbtNf4TgIt4mZP?=
 =?us-ascii?Q?XSRinFl0hi7KzQgwgJ5/RYwNjuwhw5wQ1oKPGM6tajRZP7sdqhR9Se2oPcpV?=
 =?us-ascii?Q?10yEr82nHAMCMomZIhLtSv1mtN5/p9zj8IiV8RWPwSICzchvFuh7iqL8wizP?=
 =?us-ascii?Q?i73tlAGzks/KR21bFChHKz9598HVvAls0yJ39ByPt11bIjw1sKl1asCNDShJ?=
 =?us-ascii?Q?BEl/WI6ki9WfvaVnacesas9L?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25bbae9e-bd60-43ee-1806-08d96237fffd
X-MS-Exchange-CrossTenant-AuthSource: CY4PR10MB1847.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 11:04:50.9704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6wHCjGhccPekY1E8mp87Wdi8Guj0MSYoBf64e99OxKYreS2B0IPlTgi/CgquOFJu04NAIdT2hhKqv3wMoNKmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1959
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10079
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108180069
X-Proofpoint-ORIG-GUID: 4kf1OgserQZccxrsB6Sw5Gud0t3drkRU
X-Proofpoint-GUID: 4kf1OgserQZccxrsB6Sw5Gud0t3drkRU
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] Fixed SELinux path check in tst_get_enforce()
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
Cc: Egor Petrov <egor.petrov@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

tst_get_enforce() ignored the output from tst_get_selinux_dir() and
returned an empty string on systems with valid SELinux path while
expected to return path to the SELinux enforce. Fixed it.

Signed-off-by: Egor Petrov <egor.petrov@oracle.com>
---
 testcases/lib/tst_security.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/lib/tst_security.sh b/testcases/lib/tst_security.sh
index 7ae6ddb61..05640234e 100644
--- a/testcases/lib/tst_security.sh
+++ b/testcases/lib/tst_security.sh
@@ -135,7 +135,7 @@ tst_get_selinux_dir()
 tst_get_enforce()
 {
 	local dir=$(tst_get_selinux_dir)
-	[ -z "$dir" ] || return
+	[ -z "$dir" ] && return
 
 	local f="$dir/enforce"
 	[ -f "$f" ] && echo "$f"
-- 
2.32.0.windows.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
