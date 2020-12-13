Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC4D2D90F4
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Dec 2020 23:47:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5099D3C59C8
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Dec 2020 23:47:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 01E163C176A
 for <ltp@lists.linux.it>; Sun, 13 Dec 2020 23:47:47 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2104.outbound.protection.outlook.com [40.107.22.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5DD1710009A6
 for <ltp@lists.linux.it>; Sun, 13 Dec 2020 23:47:47 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JaXKqVRdBmxZdk7szdmjzhnf+PSKObfqsQoXz2d5EakBMg/udHwjoNRe8F64KdXJ7Rlmzp7Y02Z7EsW5mm796FgxYLa7LtPfokTTKxnyiCHpP0nLr+Xf4h5YWHXixzRQckyOyxRuDeRqdve8+GcN7unQToO+v1JX2ZYHs7glgEPzeFvuircUHcV1wgQO3JYqKC/05AN4lbijb2i74OrKUy09S6XvipP90r+O+EbuxgxSWSM4yJOPKJ48cIY6k2KBa4ltHgzu4pW4QvMO/sEwzbeBHBmvWp986+eNWY7WLpIdxmthvPnw1aFKKJbQxxOMrsUPqgU4f/cDDN4Lgk9l6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcuRSWbvfbWNC30l+Ld4BSFZUVkilegJxivee928DNE=;
 b=Ikp7KW+6IdAUvagiURuSEuNezgA8ktckVAG2y5+omFo4jiSQvjSmzgSt/oHmxyDWmijooRxbRye3qRGm1UVt3kk8UB9L2/usG+JtY/+l+jB9xmkgc+Y93IOeZFhG0hTRdL6A1Hfw1hPAEm7d4BxuUPUOGr8b2Oh1dG/JJsiaRLnzUDl2Kt7vum3pwA5EB3WWwKX/ns1VlrOOZ+5ork8YbN1oVbaFKtZBvhfc25AL2IgHCDMpg2dq5/5TkupUWjQTCCX35kNSgo147BxZiqtJTdD1RgSovAyZ3eM6ZeUYqEd1plvqhpIJ33glNjILt1z/bdhFKWyod14iWmeO6lF0yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcuRSWbvfbWNC30l+Ld4BSFZUVkilegJxivee928DNE=;
 b=GUHFbfy2nnQLJpMi5qpfaW1UGwyoCT8FXejmJvcWRsPnm1AQ3DXt4hx2q18PeG/oIrJE+aOQnWmUpBJSfiYz8nQ1kVe2+16VTA9wLJCz+pvv2X5vE9uKwBTlflJoPEugB75jkilOsNNePPmLkoB74o6pKwa+ULLiX3JQgjQDSI0=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=syrmia.com;
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com (2603:10a6:20b:d1::19)
 by AS8PR03MB7496.eurprd03.prod.outlook.com (2603:10a6:20b:2b5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.18; Sun, 13 Dec
 2020 22:47:43 +0000
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::d897:6156:b3c7:114a]) by AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::d897:6156:b3c7:114a%4]) with mapi id 15.20.3654.024; Sun, 13 Dec 2020
 22:47:43 +0000
From: Filip Bozuta <Filip.Bozuta@syrmia.com>
To: ltp@lists.linux.it
Date: Sun, 13 Dec 2020 23:47:28 +0100
Message-Id: <20201213224729.17974-1-Filip.Bozuta@syrmia.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [62.240.24.119]
X-ClientProxiedBy: VI1PR0102CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::28) To AM6PR03MB5233.eurprd03.prod.outlook.com
 (2603:10a6:20b:d1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from bozuta-TUF-Gaming-FA506II-FA506II.cable.vektor.net
 (62.240.24.119) by VI1PR0102CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Sun, 13 Dec 2020 22:47:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e94dcbb5-5f81-4335-b68d-08d89fb91a78
X-MS-TrafficTypeDiagnostic: AS8PR03MB7496:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR03MB7496FDF6B15903FC3AE98129EBC80@AS8PR03MB7496.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: COaUpzdafntYkosGH0BSV5QNJpWsp7pAlwmyUkcj3UhCwEZqJKsraIQAvoBqUaTGx/C/9hewHRW6d3qf5zQRb3qqKtfRsyWh0B1bS0UM9QnGSb3MlbFW/IfbYePQxeljZUdgLvGAganLH1v7pTZ2NO6v3dvwonurXwe5aULY6AuqPlfbXgfskm3+ftAtNFz220SIM+9POcity4viWj7mAhgbssaOxm7jqjU5YY7KgGKsIhfhNVx2h38mhg9B4LamVteZ/DCCECPFOQP5VSmNW5+6TzFH6MWr8Jt0HKhAAmcBsdWEYaGe/aevX/Jf94nSFo5bYcRFVG5ocMZp+iNHAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB5233.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39830400003)(346002)(396003)(366004)(376002)(83380400001)(66476007)(66946007)(2906002)(478600001)(6666004)(6486002)(52116002)(316002)(86362001)(6512007)(8676002)(5660300002)(66556008)(6506007)(8936002)(1076003)(956004)(4326008)(2616005)(36756003)(26005)(6916009)(16526019)(186003)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JdlSI5j4bBByKzWwunKuC2KqMPvxlGqb2aUQI9kHPp8wyLW1/tbWfZAncUEm?=
 =?us-ascii?Q?SejsoaAICgXODyoUkIEoa1UK2gTSwtbtOCLIRXxH56zmwI8yzO5dFjitA62Z?=
 =?us-ascii?Q?JmGXJrUqFqLAHNRXAzSld9Ie9lBd7EM7icllRwJ9h3hnbYnXiymOxpbTBov1?=
 =?us-ascii?Q?S4eoFuuTBk9/gCyWx6Qf7fAKw6xCH8l6xkFApOX+3XMzwl8CE4HW+66r8Xm/?=
 =?us-ascii?Q?F28tlWkKEDJBABoDU9FhiUCCppD4bv5Q0da2rzQC26UNOJdhp9l7kKJFi0vo?=
 =?us-ascii?Q?slUNAyco/m5KkIsMfdN5+o05amIOZlfh1LGe7YoA0E4Ryv2c0tDb2XsuDdan?=
 =?us-ascii?Q?mLQ1UWcsNvhIjQDuWCHAPrE0d+HfuBcOEgVXKrpyJdSNNrGpDA6B4bDUnRvL?=
 =?us-ascii?Q?QEotCNQDdIHAmHab/+SmbKHIa/rjRHOwoqEdEtgyi1tR/w1BLHaL2E2nCGs5?=
 =?us-ascii?Q?eFHoaeYHlqB+6j9SaKG7uvtgA5pjSOeQ3uzK76CXrFXKGqsTnAKzABZl+gna?=
 =?us-ascii?Q?WQLXlc9BhPf4jQNB/bwekDQjpo7NdUNx1Bx37Zd2boWNrQzSG37tsHQ8KMDm?=
 =?us-ascii?Q?1DRXj7DdzR0+RGfZd9TlDKixFx/KtknBHsPlE84GQlN3RM5KGGb2/0TBQSBd?=
 =?us-ascii?Q?0eqRl9k27B6dVqcraAvNIiJwRspW5F6m7wTR4OSeNRyTyO2Eib+uO3pVvV9Y?=
 =?us-ascii?Q?0A8d7vPT7aapyh1lMt7c5RVKSyz7ZE76d2twydHHzLQlGiUgU984kGcKQeyd?=
 =?us-ascii?Q?Qa1387V6Hukl+JGiAvCYeQ0X/IWNKOFSbgj7fo6LtQV+Nz9/w+GNHpwtCYhg?=
 =?us-ascii?Q?x5g0dzknXIZ/pUWMjCB3aJT92JFMOk8AgH6QASyXJPOJJ4RsyHWt1wKLKQHv?=
 =?us-ascii?Q?7k8l6Ln+xFoQTq/4X8okKnVGXIs2muOBxIhRxHF9WjSFJnPdFsTHD4W6oqNI?=
 =?us-ascii?Q?y0xd5ZGsF8Ls6KxLnJ+mG9GyDmkL+g4Df6teMqGmpYYossQr39ItrPHg7iy9?=
 =?us-ascii?Q?GL3i?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB5233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2020 22:47:43.4210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-Network-Message-Id: e94dcbb5-5f81-4335-b68d-08d89fb91a78
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sN1pm7onbchNvSRfn+uicw/t1zaoRh+pCzYFooLGJZB+YdiFa0mYa5lXY280FBHFvSeZG4z+GIxw3n9aPCpxCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7496
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v5 0/1] Adding new testcases for existing tests
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
Cc: Filip Bozuta <Filip.Bozuta@syrmia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This series introduces new test cases for existing tests for syscalls:

    * sendmmsg()
    * recvmmsg()

These new test cases are part of my work of implementation for 2038
safe variants of the above mentioned 'recvmmsg()':

    * recvmmsg_time64()

These test cases are needed to make sure that QEMU implementation of
the above mentioned time64 syscall works properly.

v5:

    * Fixed the compilation error in 'recvmmsg01.c'
    * Created a separate setup for each test
    * Removed useless 'retval' variable

Filip Bozuta (1):
  syscalls/{send|recv}mmsg: add a test case for timeout and errno test

 runtest/syscalls                              |   3 +
 testcases/kernel/syscalls/recvmmsg/Makefile   |   7 +
 .../kernel/syscalls/recvmmsg/recvmmsg01.c     | 146 ++++++++++++++++++
 testcases/kernel/syscalls/sendmmsg/.gitignore |   1 +
 testcases/kernel/syscalls/sendmmsg/sendmmsg.h |  45 ++++++
 .../kernel/syscalls/sendmmsg/sendmmsg01.c     | 111 ++++++-------
 .../kernel/syscalls/sendmmsg/sendmmsg02.c     |  87 +++++++++++
 7 files changed, 347 insertions(+), 53 deletions(-)
 create mode 100644 testcases/kernel/syscalls/recvmmsg/Makefile
 create mode 100644 testcases/kernel/syscalls/recvmmsg/recvmmsg01.c
 create mode 100644 testcases/kernel/syscalls/sendmmsg/sendmmsg.h
 create mode 100644 testcases/kernel/syscalls/sendmmsg/sendmmsg02.c

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
