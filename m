Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2A923CAB2
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 14:48:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 477E03C25C5
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 14:48:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 6E3253C1CFB
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 16:41:02 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30133.outbound.protection.outlook.com [40.107.3.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7EA18600949
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 16:39:33 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/fBxnSkadFN7BlwQp0YLwNSg56tKyz94yLkR9QWQMT9zCUjAl1lQ1neBDDN48FyH88nkP+g67kgVLkA0fVf2eM0o4wM652eZszRNM8GrDFFAIPF+Ja/cqcxsU4WAwPVWIKTAOxeAin81dWOjz9wy9Td+WCFcum3r0vAgfJ+575g4qjHP7ko7Pfqxd/nVolGW+K523heh/BuSvNA9WfKUzRQziPREHv6qn2Fk38kK8369wNvuGIsS7CtcrioHKw5E6e7hO2g9/f4vzAERWv/vXrHrecSp1CKrs8sekeuBtpUFgXTXXDbkGSYeiA+F2szzmiBdKspKq9htCwQ6vPQgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xttpSplLd2YeYTqrpmGKxS4rtxdGJUT/BIf4wMDQFJo=;
 b=ilArMaezhB4f2kthZASY5JFph1tERSQNa8o8B4dIfOhy5OOOQaKnf/urTRkBJu1xzvASCxDMnse27Aq9EWIDyJ12NoQEme2v88QAsLwezeyUVYu7O+qsE8XuJHajYvBsVJahKZ9R58WI3u3rDRpZS9Bsnmh7oA9HKba6Ko+nafJGSnQMLVa8eujphJEyOT8h1DBUI7mxGvutwa95P7UJwYsugDOGDv7aFT4vy3jBUmyk9GGQbqvfXyUHQapwbQMqXpPiwDMDY2MlRCibueijyzz3FYa9My3Jo/n4TrUTGyTJqyoZX3qNY2CpaZaFO+niPeSkabBweJRq8CCRgqhQ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xttpSplLd2YeYTqrpmGKxS4rtxdGJUT/BIf4wMDQFJo=;
 b=k2bnc4/scXhjZdDnG/++aINKWHIP2wbuHa0V3cMKSKLu8KahbEFu6nj7dp7IIbHndxhiXhYV0CaUn0w2H2cbs10K+kD4LVxKES839qmj+GhsX16O8VH5gjeq/LafMM7H0DvnVOTJgzOLfUdIPAuZWO8OvFI/dIF3ZyZzBZ5kXIo=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=syrmia.com;
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com (2603:10a6:20b:d1::19)
 by AM7PR03MB6673.eurprd03.prod.outlook.com (2603:10a6:20b:1b9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Tue, 4 Aug
 2020 14:40:59 +0000
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::98f0:b948:78a8:f618]) by AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::98f0:b948:78a8:f618%7]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 14:40:59 +0000
From: Filip Bozuta <Filip.Bozuta@syrmia.com>
To: ltp@lists.linux.it
Date: Tue,  4 Aug 2020 16:40:42 +0200
Message-Id: <20200804144045.18875-1-Filip.Bozuta@syrmia.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: LO2P265CA0048.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::36) To AM6PR03MB5233.eurprd03.prod.outlook.com
 (2603:10a6:20b:d1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (147.91.217.237) by
 LO2P265CA0048.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:61::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.22 via Frontend Transport; Tue, 4 Aug 2020 14:40:58 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [147.91.217.237]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bc76530-2623-4cbc-6fe4-08d838846757
X-MS-TrafficTypeDiagnostic: AM7PR03MB6673:
X-Microsoft-Antispam-PRVS: <AM7PR03MB667376C6D0D3E4135B7D603DEB4A0@AM7PR03MB6673.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Bc56p14JgWlDPRVbJt9iJ1dFuQKAzr40RJySVoY/hcSdFcHGSBjPUQ1bTsprEMn4jKi3yqn7Bh+NdrP0nRwxq+KsJwltb9SZvlMOQWA0/lU1LY61lzdIswT+gK48Jg2swqd87oJLJQ3o1cBMEoNKcHFMMp0v8IQG6oi4dh2TL+18G+Vxs0crlLQDaH5L27muBoVMtUJzIHlf2l8yVZsOJHlJWJ4CDLlO3RLLwPrZ+7uZ8Q5cVfu5xOkdCZWPEs/oGns1oWlHoEBbORdOWZvSn8GpYUe1D5ZAuNcGtzPhw7a+9MGEhuVMGbrGXfXfWstFUnAbwCbNkvcRSSDZIXD4i9JzD/lEPLN7VOwdY5DIEWZPa7Z2hQIIU7v/3x1lHqB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB5233.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(376002)(396003)(366004)(39830400003)(346002)(508600001)(36756003)(16526019)(26005)(186003)(6512007)(316002)(52116002)(5660300002)(86362001)(6506007)(1076003)(6486002)(8936002)(66476007)(66556008)(956004)(2616005)(6666004)(83380400001)(66946007)(2906002)(6916009)(69590400007)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 1/QaCYV1EGi0jh7wj9fUOk3436/dNskm6JPwGnY5LwE0HoFM3mAJaGRt5N76cufsHCRevJASTnM/ndyiyiRPGN8U/t7OBqG7IJzWOJtcVzHI8DVrBoosPa/HDQ4l2+mwMbBQENpgIVz099ubHPdhSK0CbJ3rVWS+CkUiojnYjcY4pWBoFtttHLp8xT7Oox4MMJJtx7Z1byxuh8hHjkTuGDAHZj++EK1wPgAdds8mK/ngMoGaIWJZRNRlWWx5gb4wVGpN6Fn2ekWhaL4WNzxbvQaxEtDz063fXRqnJe3JATEK8yF6ff5uSO4oIAnNCW8Gs70Ns8sD6LGr56PhRGzGRR1WAvVM8IlDIv1kNSHu2UJUvXy9eafEBmn26xEpf6sjUtC8okAdPGfQoOZ1bj52dSfgnjIce2oHlbzmldOOxCiQ1a2H1kFXcY8fhZnM7U14hQV+uTae2ugRn+25/attLNLaH/aX2jYwTyRleKVEzbCoXbhYy58d1to1JvWi6OcQ4MMECvNSqgZtHwyGKbVV9hMjxR3Wz51FR9c80RMVZQHQ6MyeG4qCL6VASLQvzDGIW20LwdrUwP1YNwtW+hg4fkO/b7331Annsww2/yCDtPx2dBQ2U62Tg104U+EqEsOpRoVg8wx4RNOsJ0JeMQOobQ==
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc76530-2623-4cbc-6fe4-08d838846757
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB5233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 14:40:59.5526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRAqtxEao47425/Brp2S7x30zatGRn3amtWmeuf2ZmC42gtoNrXVavjanv7gKUrNmu9C+7VTB4+whx+dqiOgiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6673
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 05 Aug 2020 14:47:31 +0200
Subject: [LTP] [PATCH 0/3] testcases/kernel/syscalls: Adding new testcases
 for existing tests
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

This series introduces new test cases for existing tests for syscalls

    * mq_timedsend()        * sendmmsg()
    * mq_timedreceive()     * recvmmsg()
    * clock_nanosleep()

* First patch in the series introduces bad address test cases for
  'mq_timedsend()' and 'mq_timedreceive()'

* Second patch in the series introduces bad timespec address cases
  for 'clock_nanosleep()'

* Third patch in the series introduces a timeout case and an errno
  test for 'sendmmsg()' and 'recvmmsg()'

More detailed descriptions of these newly added test cases and the
implementation details can be found in this series patch commit
messages.

These new test cases are part of my work of implementation for 2038
safe variants of the above mentioned syscalls in QEMU:

    * mq_timedsend_time64()
    * mq_timedreceive_time64()
    * clock_nanosleep_time64()
    * recvmmsg_time64()

These test cases are needed to make sure that QEMU implementations of
the above mentioned time64 syscalls work properly.

These test cases are also used to fix some minor issues with already
existing implementations of regular variants of these syscalls.

Filip Bozuta (3):
  syscalls/mq_timed{send|receive}: Add test cases for bad address
  syscalls/clock_nanosleep: add a test case for bad timespec address
  syscalls/{send|recv}mmsg: add a test case for timeout and errno test

 runtest/syscalls                              |   1 +
 .../clock_nanosleep/clock_nanosleep01.c       |  27 ++-
 .../mq_timedreceive/mq_timedreceive01.c       |  12 +-
 .../syscalls/mq_timedsend/mq_timedsend01.c    |  23 +-
 testcases/kernel/syscalls/sendmmsg/.gitignore |   1 +
 .../kernel/syscalls/sendmmsg/sendmmsg01.c     |  69 ++++--
 .../kernel/syscalls/sendmmsg/sendmmsg02.c     | 223 ++++++++++++++++++
 testcases/kernel/syscalls/utils/mq_timed.h    |   2 +
 8 files changed, 338 insertions(+), 20 deletions(-)
 create mode 100644 testcases/kernel/syscalls/sendmmsg/sendmmsg02.c

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
