Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 444242A0883
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Oct 2020 15:54:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0F8243C5561
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Oct 2020 15:54:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id B327A3C2467
 for <ltp@lists.linux.it>; Fri, 30 Oct 2020 15:54:03 +0100 (CET)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [51.163.158.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5207E2011A5
 for <ltp@lists.linux.it>; Fri, 30 Oct 2020 15:54:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1604069642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bkTXsC9fWB1VbIUNtgeIGlKSi1TvtkDWwyKW1+byv8E=;
 b=Oihi+vMJX3WkzrtE+TzVHjcWWeJ62caFyQUZoxAlk7jbRMG7P5LPxBbbYl6WsWurnCOCtI
 3Gbx7q3y0Cj2KukjB44bSIPoMgpZWYl86BBiHNc1Wqttk7uigx1Dr+q3fm28yCyh69Vvvv
 2pW3o0hDtGzheMtLKMNTDSxPR9otSfE=
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-Ea1Ag44fOfmI5kSA_fMyJA-1; Fri, 30 Oct 2020 15:54:00 +0100
X-MC-Unique: Ea1Ag44fOfmI5kSA_fMyJA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3/7scxye+bHaSv4EHiHILNg+f7UNxOiDz7o2oBsAtVrCYjeWzDXKlvupPOQT5LynA74Dxb/gXNlFZ1V5aKhoHSJ4NG9XiDw8SLdt4QvlDeb9KKYOBxeivK8LlaQywbUyvoyP6AKrA5xmZwMy8m+NdFzBQnYVNZwll/OBiF0GdjPXkmDx3+mTs/fP6HZrskfBgneIfxgls5sayQh+katvDD5vzv82P3uN2Dcaf1IZUGGAO0KTnAjVJNz1pmd+Sw/18VykuVm1OuIFO8Mts4NCC3GD3IklS1iQjLD3gWR4QYt+Yha3YY5UBoV0zfXnMhq/I864IvthrVe35hFsH782w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbDuG/2wnQ88LykTxkDf+7BMwAi1or5HsLiwDmir19E=;
 b=a0FPN7v05V8fN3NZEosDcwgYRTaW5+1S592QBeEmp+bwoEp6q6wVX2WLNShw0/o0o+4d6ZoyCy8Vcl8/IqLXLI1ZP9nQlo6RAcHYFs/tsCcuH0L8xNF8+iNkTorX3QZ92Pm9NZ7nB/2BbN835Iq16HzY5+Qewmjgz3Q7Ta4EngQbYHXqKDDxbIclWmDdvvZ5vLsUJOHWYv/DeV9HhbwygJl4BdcCZxgfFvxKzLX0baT/v/JHmBuBABMWTBhCRlj4PifkckGPO8DCgQmJbMz0HCX3hexBWrDIVOV7GF+80vkBm5TRKxMkKd7U0hptJazcvFAjMHFKzONEZS9Eyv2byw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24) by VI1PR04MB4447.eurprd04.prod.outlook.com
 (2603:10a6:803:76::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 14:53:59 +0000
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224]) by VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224%7]) with mapi id 15.20.3499.028; Fri, 30 Oct 2020
 14:53:59 +0000
From: Radoslav Kolev <radoslav.kolev@suse.com>
To: ltp@lists.linux.it
Date: Fri, 30 Oct 2020 16:53:49 +0200
Message-ID: <20201030145350.23829-1-radoslav.kolev@suse.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [85.196.172.93]
X-ClientProxiedBy: FR2P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::23) To VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.suse.de (85.196.172.93) by
 FR2P281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.9 via Frontend Transport; Fri, 30 Oct 2020 14:53:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d881c0f-ebab-4949-54db-08d87ce3a25a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4447:
X-Microsoft-Antispam-PRVS: <VI1PR04MB44473C666868A4A4C31EAFEDE0150@VI1PR04MB4447.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GAKbUe1u3qKfCcIIWP7dAR6hmFKnLugZMHb8E40d6GSn2rGBztputUtjqTVck1zXaywTp5lZIncvK3PTh+VB7QDdMtq3v10Rj10PRSiiogaPdqCLq+GtWMqmk1K4tVDUPfLIsbqTNOPMNnBlFngIs6bmFDOfDf7LeH5WBeqwvlXLmscJFQxQVLW9UJPWsKZHyY8niMVgRvVEi7FH77cUqt+GNF5v8DpTD8BZsBbyzpMyR57RSJCIPWzfHHNU4s0N276+ULVUyAZ8VU1twg8VoTbHnommfjs+8IfnGRblB2SR+Hp7CcNFLT3LDXRjUDy6lfUHbPCNODhObJ9Xth43Pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3663.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(396003)(376002)(346002)(39860400002)(6512007)(558084003)(2906002)(478600001)(2616005)(956004)(66556008)(66476007)(66946007)(6916009)(8936002)(186003)(8676002)(6486002)(52116002)(16526019)(44832011)(36756003)(26005)(6666004)(86362001)(316002)(1076003)(5660300002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: yXRkqxW2k6Kiuav2g0drM9eHEB5JlsxYiBmaFSc5Fup+8wlOn0k8N16vepxfftBe9DudrlFhsEiHd/dpMdfrDFMMuAEDaAPGu5T3SvZxaQp7KrX5H6tU85zr2Hamk+4XbTtKByaXoZfY3S0w1Xb8sGskuMlGX9J8wDfpwHaorw7wOZqy2wWH91TAItht4JSOX0mtVJHdo+T89Rvk1bLmIjoSCeOfkUBg2qP8zo0gEH3GdzIvOuztBuTVvPvoUG7tyIt1p0xudxYfsUU3OM6cMlu03u4f7vpSdoBHbHG5BhV+LRwScVuCUtiYGFERBtiSPboW+/jmYVeC/yEGNReUGTvnFwMqOq268V8baFSryEZqv1EvGH53YFOxYl/WZWV9+VcIZKEndLMreMW4XYh1M2CqKXOaxC/8mf6cIY+2jwNygnkNN1nFe/dMKwz7MIa/dL5SejA+VKzp1Fgmr8VjRwscwXKQa8gEq5NeMsAA4P9Or8ec3qM0zl7GbqhCaW5g2QuaJT0ltdfl8M4e3m1NW0PoywSQ6PyJvR2L04WzuhJ+TFid+f2JQ4pJlEjjc/mo7ZL38+hKF4+b67BgEZMA5/WVNWry0T5YRsRHwgBjDPxWiCBxKrN+y0kRqayg596N0pKstIYxd4wPXCQy6v2TFQ==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d881c0f-ebab-4949-54db-08d87ce3a25a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3663.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 14:53:59.7693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PqtuyAF33Ey74sXe2Bx20eHgJC1thDt+mKSJaCMk2ZRYHqblguLGZsLFFMQf3WZhsJSi9go0uRxOSBJ9N/cxLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4447
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] Convert dup01 to new library
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

Hello, 

here's my first attempt at converting the dup01 tescase to the new
library. Feedback is welcome.

Best regards,
Radoslav



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
