Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CBF2DFB8C
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Dec 2020 12:35:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 375763C32FE
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Dec 2020 12:35:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 33A3C3C2965
 for <ltp@lists.linux.it>; Mon, 21 Dec 2020 12:35:04 +0100 (CET)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [62.140.7.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B7B3C1400F28
 for <ltp@lists.linux.it>; Mon, 21 Dec 2020 12:35:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1608550503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fRhk0uRkuf12I6FOQCkZhAJ0naUe2+RolKKJ9vL8fhg=;
 b=QFWCkSOcUf9XpyHfQrUSBVO6a2Ekk1qS++pOjUJfdV/Irut1VlgAijiqla+2UB5obhOmt0
 841BVGv7rB7pZ/dP12E2FN5Q0NKP7LC2uFBmODYiodtUWHpMrDLb+oQyP6gqovty/qdq7C
 1vG9AGKQz5GqETJM89sN0U5f4U8vin8=
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2051.outbound.protection.outlook.com [104.47.4.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-TcsT612sOJyzVqeXpwpqSA-1; Mon, 21 Dec 2020 12:35:01 +0100
X-MC-Unique: TcsT612sOJyzVqeXpwpqSA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKbFmIKUqDKH9PlIWCcOuU8EQNBrUh9RG1AjczMsfzR4yiILcz5wdIUZQ3/CwOJ0RAXQQIBmJLX9h5AleW3Xnpg64wqtK+WncccKfqcJQ5vNG3eQ6R3Hw9hhjR+IUdyEtUkIImIwj1CQ/SOBBvzyyzJMikEN/uTf7hWheSyoLkJlz63F9ghnqFxUfjYwzJ+Cdd8PbcSvYNQwtGGp4fPMuq9wwwixh6gnUDue1Qcm668aAdfHtmtgz71ojQEvR4v16OXV1z9JWtJnbGF1/YQQNqsdellnUcvdFcmYZaokybYxNQrdBTiBt9nVtcMinfyen8x5NhYxlRypF03+6LpurQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRvtiBWQX2cSwSFzrg+3VEzuwKWR+K8VGNB/rhZVwPM=;
 b=P3+AxAnuoqz1qs8QEHMqLk8T1acnM5MTq9ZDYzbNtMOiGITNrMmXR3hrw61fEwZlmryOU3jz/0WXeoCHN8NKNI4rsKwDO7ECok0DEomdqVTB278ijWDWj6fhuhjm8bCb5ci5T/wh6QvwI7UkgGIVevaY0Qt+SW7cV4OtQ39Jw0PtgpEJUopYoaeryem5eziDV1hNrTLhviju66lomOIB+cCP3IuhQOtIAkOOc6Gmssy5WgwPNI+BclllAmzo5Qu9+YaVKtAnWVsRsidPSARLwNGrAjVHHBXxoRALmJQn583Tr3Dv96YprBqD7FQjqZx0IAk9samkUgINN7JrgeCd2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24) by VI1PR04MB7167.eurprd04.prod.outlook.com
 (2603:10a6:800:12a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Mon, 21 Dec
 2020 11:34:59 +0000
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224]) by VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224%7]) with mapi id 15.20.3654.034; Mon, 21 Dec 2020
 11:34:59 +0000
To: ltp@lists.linux.it
Date: Mon, 21 Dec 2020 13:34:49 +0200
Message-ID: <20201221113449.30656-1-radoslav.kolev@suse.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [85.196.172.93]
X-ClientProxiedBy: AM8P190CA0014.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::19) To VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.suse.de (85.196.172.93) by
 AM8P190CA0014.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.28 via Frontend Transport; Mon, 21 Dec 2020 11:34:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2767831f-d6df-4019-e360-08d8a5a47309
X-MS-TrafficTypeDiagnostic: VI1PR04MB7167:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB7167BD1FDE22BA8A1708904FE0C00@VI1PR04MB7167.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c00j2EK42oQw6sICW12uLSwIGpwHp4IgAHHbLWmHZd1LJUw5Y4eOOqMwQzySSxXCaQJQKDvkC+V3vq8QtQfv1bcYJiVccFkj0y6SOO0dHH1SoQN1cQJqHOTz73wt3gPnMO1XARe7aBIFoK+Lx15xnIAsSxahJozsICkeiR6nnvAiEzYUx58DTy9BOIs48QCeWjWAhQkId04nE4DmI/Feet1b0z6D/6v88fSoDRAXNH16lTIJbnqogKl7xGZMHRohfwghAA8Vpqy6NJ/aCsKwTJWCl0UxS+VlaGC4J0OXZEx4BmSPCsOCi+XI+clEVunSM8Xx0FUHNH0HNyCkRCnPnRA4rRJqAO7q+X9opPBp7HOQsm08B2Sbyh8FJgs1e+PPpK0Sz/NIqHYVPXdjz2vsaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3663.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(346002)(39860400002)(136003)(366004)(26005)(4744005)(8676002)(4326008)(16526019)(6506007)(2906002)(186003)(52116002)(6486002)(107886003)(5660300002)(66556008)(66476007)(66946007)(478600001)(8936002)(86362001)(44832011)(2616005)(956004)(6916009)(36756003)(1076003)(6512007)(316002)(6666004)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qbO2g1ZN8g/Fl7HQXKhQXhA/ES2aaS+veKTRlzDPsWWLnLDxTvT9Xy32ukGb?=
 =?us-ascii?Q?EucliPqW23s+2Tjbju5HkZnKv3ydCxcDkttxDKe5WxJPAL6goygZWbL7oiJQ?=
 =?us-ascii?Q?TcDFyZKSU97Hf1GQ8i8tBrBJJz3lvVpfPo1/IpEYwFC1i1yrxEs7DwgWP4tn?=
 =?us-ascii?Q?D0s3/MmDbPERkIvxfNLTRxlXg1nGnF4WrFuoAwWGP33YW4FQLLyoyfEun/PF?=
 =?us-ascii?Q?vwdswBXgD0TmKsQjVv9f0Kb5isE61yjZ8w6krweMG7YPggyDxmSv0B7+FFaa?=
 =?us-ascii?Q?WHNq2wRWz3+0Wqzox/fwdQIWImXYdfa9x8zbHcQOxtFe/cqfy9lFWWg0YbaA?=
 =?us-ascii?Q?uLtyVmLDnR/DoUpzEIv0Ty2oEDCY0YAo2nKc2zuNZNHAVqaWmB6pkexBcjm2?=
 =?us-ascii?Q?ExWmoEnuJJogiHeg9zzZ3POnDG7joCCDxyZT8ucSjZbGJdA0KvM0r+GjktCc?=
 =?us-ascii?Q?DxorZ7ECGLE5DEFZK5JQ3DfUKZC+Elm0t91+z7ZJouBJ6ng7ucuqgrVkCvYJ?=
 =?us-ascii?Q?B/nNodKm+jZZCEK2/0ugv2bQoMvu2SC4VSJZcumMr5pRQfJsxDnGpRMvgYyK?=
 =?us-ascii?Q?B7OEwynUR4Lc+aUubAbUtpDuOvSJyovbhNJ+yoIWHZYEG+hcThrSnWb2cpbo?=
 =?us-ascii?Q?phb363WnuYgd+/v0sxfjDaHiMXiaCeRNRUT7l/6YWroJdiUTosZ3G0YNfhu1?=
 =?us-ascii?Q?DAQVY7rHTukd3dCCdQLxxbJ7FO2z8eUL09hLLI+f0RRIqwtsSY6jv4XJ/x1r?=
 =?us-ascii?Q?co2jBitR058qveLxO0FCFzXSsXJSPSpl3/e7eboEK6fbhikD2UTTTEgc2D25?=
 =?us-ascii?Q?TEqmVBJnfmT9V9PYt9cOILKio2RGAr9c75SvLiAtf5Z3CdY35Wi1fsjhRsur?=
 =?us-ascii?Q?HgMKL6nAiLYzOLo8P35df9BGif+catLDcWrgNmPqQuDalwB8ZG6OuZRDXM3F?=
 =?us-ascii?Q?6JkdNVy/yOQZCsGzxG75/hqdQQzQ8yTrt9vveqPFHxa6c0HtIJW3zlsh734t?=
 =?us-ascii?Q?XoIf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3663.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 11:34:59.4903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 2767831f-d6df-4019-e360-08d8a5a47309
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQfv8x+6n+aJ8TdQEfUOSYFTPldczEVpSe4SJ6rPgpiAhpRPezJBLy++GcbFmuGDo4qz6w5QZvxpYKrn96pvWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7167
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] df01.sh: Fix failure when block size < 1024
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
From: Radoslav Kolev via ltp <ltp@lists.linux.it>
Reply-To: Radoslav Kolev <radoslav.kolev@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

If block size is < 1024 shell integer division will always round down.
Add 512 (1024/2) to the left side, to cause round up for values >= .5.

Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
---
 testcases/commands/df/df01.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/commands/df/df01.sh b/testcases/commands/df/df01.sh
index 02aeec7b4..0e73a16af 100755
--- a/testcases/commands/df/df01.sh
+++ b/testcases/commands/df/df01.sh
@@ -101,8 +101,8 @@ df_check()
 		local free=$(stat -f mntpoint --printf=%f)
 		local used=$((total-free))
 		local bsize=$(stat -f mntpoint --printf=%s)
-		total=$(($total * $bsize / 1024))
-		used=$(($used * $bsize / 1024))
+		total=$((($total * $bsize + 512)/ 1024))
+		used=$((($used * $bsize + 512) / 1024))
 	fi
 
 	grep ${TST_DEVICE} output | grep -q "${total}.*${used}"
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
