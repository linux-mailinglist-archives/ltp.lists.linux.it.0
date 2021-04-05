Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63647354203
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Apr 2021 14:23:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF42A3C206C
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Apr 2021 14:23:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EB0AE3C1DD4
 for <ltp@lists.linux.it>; Mon,  5 Apr 2021 14:23:45 +0200 (CEST)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7F27C10006C2
 for <ltp@lists.linux.it>; Mon,  5 Apr 2021 14:23:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1617625423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Gmn1Jx0e5ubD8TW+kVlnRmieLDLd2jIRkOpLrG9CsgM=;
 b=a5S8T2fyvOKbReZLEPtGSrWohclzy+c/tl108CHCkEGB9vf5nD0JqANQ+B8OVUtuW4y60+
 P3TydKpjEpM32FRnm+qM/0fD9ecBDCEbwxAZHbzdbnTQF0sI5p87nY2xbp4c3/QL4tMbkx
 Xfub7GEkD1f9zLuecEKFjxukxz/19Do=
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-_zs4pwqKPiqcU-c5jl5dOQ-1;
 Mon, 05 Apr 2021 14:23:35 +0200
X-MC-Unique: _zs4pwqKPiqcU-c5jl5dOQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYcMDaFRxt0MLBOeWRMnaMyXOl7zT5dOAckYgUQVvkI3Ho2b0CnwCy9ZLgkAl5QnZ6GMVTM3E99Wac+5EOoVt0WwvLIFYnSTdCUUut8ZU7Xn4VY95e08pYdsWCVI9R3rqWWxy8yILWPhGQOmlDJNIzs8yWwOx+h/3VCicyx993Abwzr5FQNbygo2dOkHfEbzZWz8odIPwNne3BxtKm6X1NYnNKbdh/78ZFJj2sarcgj1qUQldtjT6DK0n+Z3krJpECDQPsj8FSvjLNBLVRu/zdJa29AR1rNq0c+8x6YrVvtTFSwqaRdQNXRIB9FQbdbb8ZGY+hQ/+5E179MpaTT0QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ir91/qyx+fP+4yAosgfqAoe/fcPeuEboJvDfBtBuVEs=;
 b=YK77t/OvSj5Z+V5EhTzfGoCEqZcnjqcGmkl/c9e4bkH2zZksQismWHP2x+DfYVqAxyfzJyFnLiPJDiBVx7CL8ND+bX8g97b0WKTY5c2PSb8KoxLuxJ1ftDdcsNG7wEuVoHVG/NwRNwFWJZMxU88i7ECvNWZQgnoSLkvIwkdJNlR8U+LUxT+K6bXXmFQe8zzgQ9MYeLxaN/ZyzKsWKlD6BEAjVedKGPbVlipQ2HJFKpr92Xkq2MdKDd3u2MYD0qW4ZNlpceTRFLwI3F0vFX3dBwY3AwLNT/7IJ/KV92cD0qmL0tcG9LRFBlC8y+UEW+PvD4eYr2fWUZsmRwnyTJtTeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB4958.eurprd04.prod.outlook.com (2603:10a6:803:60::23)
 by VI1PR0401MB2398.eurprd04.prod.outlook.com (2603:10a6:800:2a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Mon, 5 Apr
 2021 12:23:34 +0000
Received: from VI1PR04MB4958.eurprd04.prod.outlook.com
 ([fe80::e0a8:d324:669a:571]) by VI1PR04MB4958.eurprd04.prod.outlook.com
 ([fe80::e0a8:d324:669a:571%5]) with mapi id 15.20.3999.032; Mon, 5 Apr 2021
 12:23:34 +0000
To: ltp@lists.linux.it
Date: Mon,  5 Apr 2021 15:23:22 +0300
Message-ID: <20210405122322.23134-1-bogdan.lezhepekov@suse.com>
X-Mailer: git-send-email 2.30.2
X-Originating-IP: [77.70.99.251]
X-ClientProxiedBy: FR0P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::8) To VI1PR04MB4958.eurprd04.prod.outlook.com
 (2603:10a6:803:60::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.suse.de (77.70.99.251) by
 FR0P281CA0043.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.10 via Frontend Transport; Mon, 5 Apr 2021 12:23:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 689fe336-4edd-4fe2-6dd0-08d8f82da1ab
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2398:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB23984AAA81544E6C4749CAE693779@VI1PR0401MB2398.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vbSpKDW42By5PUV1b5pdAHP46PXwakTPg6vW0r/tv0El4I0hg93uuhqDCY89dfyQiR9y/ThXqKOjiXyCHaZTO/YtMy//5UvNPdYG98zNU2MQwom2pLYksZRqjk7bKGpL6D/5DQvQNp0PyUrS+pq8BwsqFjxdgoUwpiH9unzSdoxJwvcx0PIAqN4jcR6Kd3iq0fDKBLLj3q13ngP6wwW6tfvRXxottYVzNow0x3EYz2+L7xY0arLz1/lebXPEJ+Q9gAtGox9kEWFZwrituKISJ7DLHvh9049IfxCiP07GUxxvwkNMzjTx6C1lgyntbfk/h5JnouQf3P025FiYcjuB66bi6c5QagcHC+tf0PKm7lmYt/td6YGTJca+pjpb7EBwNxFisbkeZ1XYJnEk1RTqvLC0sPxrO9AeXPuPBTeQ2hiIVxvdT8dJWZrZmEiXpqCUXe/4uD1oJeJmp4/6ybr1eND+/B80S6YqRWoQl+K+TO4WAwC+daWU9S4bi9QzRWh9THg4vwbFEzLhXWW26BCzWCX7eiRIWKfc5cp78yhUsH4d/kpWqiOXn8mo0zEpIRNspoxs4fxP/Q6vC2TGbZ1dCP7X7zCbNHS8JOg34AskVdCartPa6dPZFG90irXGxsuD84x68GdBzrwb7GNQd5StTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB4958.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(376002)(39860400002)(136003)(396003)(107886003)(86362001)(8936002)(5660300002)(6506007)(2906002)(44832011)(2616005)(316002)(4326008)(4744005)(6486002)(38100700001)(6512007)(8676002)(956004)(6916009)(66946007)(478600001)(36756003)(66556008)(66476007)(83380400001)(1076003)(26005)(6666004)(186003)(16526019)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?deSuFLhcOa6qvFHsJ44PGjVCP1Yy4uhfeUlyfLAx9UpbVjlGIUoSujvrqKFm?=
 =?us-ascii?Q?lP4EcwBxfrethVHSAWOHgOwLnnsrXXkaQzRMMsrZMSIH6IzGg36XBme1yS/j?=
 =?us-ascii?Q?eNB18h30lbh7xg8gKqokOVee9Ok3rPawRyZ0pWuyxn6mwBEr8v9yd4j7KxmG?=
 =?us-ascii?Q?QO3c5JeOkQF3JM5WnQrtw5HvyL66y60hwltf91ykqoNCs7BWjJuegbGrBUQb?=
 =?us-ascii?Q?blD8KASfWRL369dbdN460GNPmRKQNQQ5z1hD/zaxS7YTYkRXKnTNQU3g5fZA?=
 =?us-ascii?Q?oLcLkoyB9ZEtwT8ZFzMVkaHyFD/393MNOSpziYq8iNEr7tbSh3N7wQcSwMgJ?=
 =?us-ascii?Q?06es9uQ0LnO8p5S1Fpv6zYVh3LMEyYeQvHbit2czb7tQwN2TqmYTNSXN/CPr?=
 =?us-ascii?Q?8vfl+i5UDzFxq/9+biY6l1sdWmC8TiyFv6dxHGaE8AlqA3wlJ5eNqo5TDXOO?=
 =?us-ascii?Q?en7lSPcJFt6VtlCcidhtoCNK9X6aE7yj2X5JaVptMrL1TD08nVrn/aynnkvm?=
 =?us-ascii?Q?ZU3fyVatGsTu2mf4AlkO7hAiA+SHDUlFN2TNAa4vyB08x/xVuSGqOby6XemI?=
 =?us-ascii?Q?vedzOs2oAJw1cc2upTRPKVFq9pteLXgfmj9GB+981XVqHsSMefVCcDx1qtCl?=
 =?us-ascii?Q?fPlSymcJobdEONfceUs/9Zv3C+eog5jqtSX0UriLCTFS+ZjgKDx1BIj10Fou?=
 =?us-ascii?Q?s6UlrPkf2DglYwZUbx6QAYJ4QmjLdbKI5i93Fc+6PBwccNABbkj02Ot9R6Ym?=
 =?us-ascii?Q?1FS6n+5qlpajIVumHoBHKl0LOTJllLS/KttY4b/ZTFNlJ9Yu9OUro2tz4t8A?=
 =?us-ascii?Q?2dvoXTm272/vtIvw06LW8618+DJWPnQ4aGSiObHn8uKi2ovxZh9JYyV8by7J?=
 =?us-ascii?Q?ClE7AVhBaadgl1JdEmFnovGTaSSyNXmG3ziaevHExK2mkca6C/XX2guJzP62?=
 =?us-ascii?Q?Cv+GwwNfbJI4CQNkjcmT3ptfa47KjzUe86WKLeTmdBXEcZbK5ggdTBCM0iKS?=
 =?us-ascii?Q?Xb9KxiPGKJ9K/fLJUUv6pPBGjJET5MSArf++4uqxMMaJadWeYYiid7uoL3jW?=
 =?us-ascii?Q?vcYPI38+GPLzH/u//mK9L9rQC9hMlwTNiKzob+Lr/k8Dw8uVGeyADiWyJnVi?=
 =?us-ascii?Q?TumEkz1vVGijGK75hd6C6ck/iAmL8j8fDRWkXJN/i5ilwg+8vbnkhwDSsepB?=
 =?us-ascii?Q?ESNDt4BOW+IMhJy686CdDn4LaEqCmUQhVrbeBtSiwLXp2a9zTcTinQKCO6UW?=
 =?us-ascii?Q?5ckddA7o9f+B5G287iGM+jPNzxslDlXlzTc5omCGwLRIfaXjoQmxaBsYkJg/?=
 =?us-ascii?Q?7YCK8p16y+mZqO9EJmYhg1V7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 689fe336-4edd-4fe2-6dd0-08d8f82da1ab
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4958.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2021 12:23:34.4977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K8Umsum+U6HfQUvFvPM1zFxWj7Pz8sT7MC+HaFKFHTQDzr6KUbKtCwIqGUuennnZQPumKx0ARmMAkkf8FbbKZw4Lw7Zr/Zz7F0+AUKfBe6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2398
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v1] openposix/mmap/1-4: correct a typo
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

A typo in the name of the temporary file:
     pts_mmap_11_5 -> pts_mmap_11_4

Signed-off-by: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
---
 .../open_posix_testsuite/conformance/interfaces/mmap/11-4.c     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/mmap/11-4.c b/testcases/open_posix_testsuite/conformance/interfaces/mmap/11-4.c
index cb238b40e..45dc746f3 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/mmap/11-4.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/mmap/11-4.c
@@ -66,7 +66,7 @@ int main(void)
 	/* mmap will create a partial page */
 	len = page_size / 2;
 
-	PTS_GET_TMP_FILENAME(tmpfname, "pts_mmap_11_5");
+	PTS_GET_TMP_FILENAME(tmpfname, "pts_mmap_11_4");
 #ifdef	__linux__
 	struct statfs buf;
 
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
