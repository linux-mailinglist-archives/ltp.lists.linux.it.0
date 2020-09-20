Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D83271570
	for <lists+linux-ltp@lfdr.de>; Sun, 20 Sep 2020 17:46:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 10E863C2A5C
	for <lists+linux-ltp@lfdr.de>; Sun, 20 Sep 2020 17:46:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id EE1CA3C2A3A
 for <ltp@lists.linux.it>; Sun, 20 Sep 2020 17:46:55 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70114.outbound.protection.outlook.com [40.107.7.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5DD7B100048C
 for <ltp@lists.linux.it>; Sun, 20 Sep 2020 17:46:55 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NviCGDn5x/USlsJyW/4AkfIsXmrB6Lssel9EgBIi8t+Nk10ymfQ7gerghNpewpHkgWIPkmp2s6vlQB4j5beTsZyPzOR5wQ4T9YKmEC/uxmPvw9kKwHywyJmITlnR2kb3y7bBkyQ80FM8zCKQMiD9EtTlVf/cjVuZNg6q5TGHujzriKdf6RMChV98pFJY8CbjjwJq9/icoP3z0GiltSafhtwhAi4Vj1R18w98LK6iICNBefA+wJEYH3EzOYeYo6NMqK4IWvCR3R2Wg5M+O9e/YDt6QC8L+pZc/hq4LrSvBzgltByKXxD7F7Bw83AECfEaYMUlBrXi6PcMhhBE/qwqeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwFMhkcHpamrm1hZ538LCNrrK1a0YvS2BiwJ909gyX8=;
 b=JAeaHzQACwtXKtOGq9UUHSugyfV3HofnuytZxphz4DSMF2Z7yIJNA+lxK1RkXZueBm4/1w+WudZHECLCoTldq9j9T4+QwA0kvpkLJULKKe7PI7wy/GTthbuz6acF8V4Nd3JRFEmc24x1HyiUi7j4NLvH5DXnAWwLv5wFAN2jChuHGqnTMLDxUks2Q8TbWSmKO1IpU2SvkGbzugUYCmjc3QoNs6xdwCw+1/kSn08+64idqndsi3t63hxOjl3kwEaTnZ2q48YJqvgDCEQflNJdRtqbxdgLR/TS3HCMCiJcfO7N5zP7HJHxtIehYybKWiA6PIt0GXsLaAjc/z8Mw/WN+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwFMhkcHpamrm1hZ538LCNrrK1a0YvS2BiwJ909gyX8=;
 b=XPvrANd+feowsvIFezcOs24G7gvtLMh3j5jEjTQ5nyFhDMVk33x/gkpQi1n8JL/1t1cEC8HzK9EtpseETS6BapoTPYp4z2EkN+Zn95p3IDq0BxJty8h6rlooBRlPD3ojTzWRxtJ42xReqLRkzchfcICsb78iNjVkG3GguKwKR+E=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=syrmia.com;
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com (2603:10a6:20b:d1::19)
 by AM6PR03MB5941.eurprd03.prod.outlook.com (2603:10a6:20b:ea::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Sun, 20 Sep
 2020 15:46:54 +0000
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::7918:e8f:d41f:6e68]) by AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::7918:e8f:d41f:6e68%4]) with mapi id 15.20.3391.015; Sun, 20 Sep 2020
 15:46:54 +0000
From: Filip Bozuta <Filip.Bozuta@syrmia.com>
To: ltp@lists.linux.it
Date: Sun, 20 Sep 2020 17:46:32 +0200
Message-Id: <20200920154633.27255-1-Filip.Bozuta@syrmia.com>
X-Mailer: git-send-email 2.27.0
X-ClientProxiedBy: AM4PR0302CA0017.eurprd03.prod.outlook.com
 (2603:10a6:205:2::30) To AM6PR03MB5233.eurprd03.prod.outlook.com
 (2603:10a6:20b:d1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (109.245.227.194) by
 AM4PR0302CA0017.eurprd03.prod.outlook.com (2603:10a6:205:2::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend
 Transport; Sun, 20 Sep 2020 15:46:53 +0000
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [109.245.227.194]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd4d61e7-06f6-43d7-7bb4-08d85d7c65e3
X-MS-TrafficTypeDiagnostic: AM6PR03MB5941:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR03MB594170DDA39511B7023653D9EB3D0@AM6PR03MB5941.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x09TXmpdNIrO7+d7VLot5i/rdmWYoPAVW6srNLV9pXnjV7KjA3IXeMNaaJ74p1/A6CaL6ysPRpDKHpb6tmyi9x6RgwBB8TbsuI6dUer7Ot7YZPenQCuKo7NeY0CcASlB7XENlJOUQweuYzb6Js3jVmyxXnYA5k5Nl2dbtIwf3kCvXwXSZpETHQOFq1jkbf/Jc2XTGU4q+GnQHdch06lWL3BrWB39XZQJvkuiAWSeVxJYsjNfUqd1K8uS2U2m6SvyFxVrIcbQ2tF3pIJJVEt0FFy4Sa/5NtZXYSXy18u8TIw9RQmOQF6+GQqulkArS7u68tsn6ME0CXTkyj21R2AEL35XxzuKLo5MYG+GoGQCQ5t6ERmwVw3n9W2/UpocjNkzO5RKB2QVj0TFIN6we5newTcg7IHxqBnDWhxh5NhuETt+H6vNS1NJabo4pO+ANvDj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB5233.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(136003)(39830400003)(396003)(86362001)(956004)(8676002)(26005)(4326008)(2616005)(52116002)(6486002)(186003)(478600001)(6666004)(69590400008)(16526019)(83380400001)(6916009)(36756003)(5660300002)(6512007)(316002)(66476007)(8936002)(107886003)(66946007)(1076003)(6506007)(66556008)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 7z6C0YPEgFVKNwSLTgpZKszlpTGg6QRSF0EKkfY6kcJMb4nKeXEC4XioHvDtSCkqdz1dnH99YQXjlqvZlskZCxPLLwS7WjxanmF+D6tnFexxy3OGEk+Fjvhi/ZaZ/aYYbzd1Kn9UVMbuQEeon9BuaSFyCBCzg+TgHe17szUQL9ZSdwkpsHQ8QZd7bQrOFA8JFXoKVmDZmahYFX4GD91JHyxPNj09p8xQBlIzfT5K6SCmqJRj01yz2KH9PiZ+uW8o72yChsA+M3DAsfl9SJncRUXjtaUDRdYSc01jBmmHpMlSWX2pqQBeLXajIToqYY+mVWGMQ03nkKM6ykej8Ez71rTl6uh4F4lD3/AdxRWtm/sGM6oOzU42jxLp/zvF65NITr9ISHk1BR2SaIxu3lEjfOBcirUy4aPbj/07aB1bgszYPr/6msYYFbuRfB/UhAl+YLfqZ0tALIfW30q2CE0K2fjeyatdI+335wJh8pnizgxB8qykCsJiBypUE5sHTlbEAmKVGCL3ykvl+0FzQRM1aeXotLsUNyVH82zPwXgPj/IK0+CPMhBt10vueMaCjlvnkMe++GiyB39C0IfDq+bjEdmlbaXgbiee3tv8UEtcqWLIWHq0R3eFoXOCsyPBaDzWONRyhBs7zHZcGY+5lPtx+Q==
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4d61e7-06f6-43d7-7bb4-08d85d7c65e3
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB5233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2020 15:46:54.0879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jpx+84GlqSGR39t6twwbjWZkK0tbhZiy5613m+ZXkE//hhXzvsUnO+riu49+wnB4fyK3cgVe5njc6xJ+hFVpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5941
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v4 0/1] Adding new testcases for existing tests
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

v4:

    * Changed the timeout test to make the second message be received
      after the timeout so that it doesn't brake the test with option
      '-i n'
    * Created a separate 'recvmmsg01.c' where the errno test cases for
      'recvmmsg()' are moved
    * Create a common header 'sendmmsg.h' where all the other necessary
      headers along with the 'test_variants' array, test 'setup()' and
      'test_cleanup()' for files 'sendmmsg01.c', 'sendmmsg02.c',
      'recvmmsg01.c'

Filip Bozuta (1):
  syscalls/{send|recv}mmsg: add a test case for timeout and errno test

 runtest/syscalls                              |   3 +
 testcases/kernel/syscalls/recvmmsg/Makefile   |   7 +
 .../kernel/syscalls/recvmmsg/recvmmsg01.c     | 127 ++++++++++++++++
 testcases/kernel/syscalls/sendmmsg/.gitignore |   1 +
 testcases/kernel/syscalls/sendmmsg/sendmmsg.h |  81 ++++++++++
 .../kernel/syscalls/sendmmsg/sendmmsg01.c     | 142 +++++++-----------
 .../kernel/syscalls/sendmmsg/sendmmsg02.c     |  80 ++++++++++
 7 files changed, 356 insertions(+), 85 deletions(-)
 create mode 100644 testcases/kernel/syscalls/recvmmsg/Makefile
 create mode 100644 testcases/kernel/syscalls/recvmmsg/recvmmsg01.c
 create mode 100644 testcases/kernel/syscalls/sendmmsg/sendmmsg.h
 create mode 100644 testcases/kernel/syscalls/sendmmsg/sendmmsg02.c

-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
