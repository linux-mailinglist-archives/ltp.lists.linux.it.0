Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EC2368156
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Apr 2021 15:19:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5982B3C6B18
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Apr 2021 15:19:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CC31D3C6AD8
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 15:18:56 +0200 (CEST)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B294F601583
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 15:18:55 +0200 (CEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13MD4wch097014
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 13:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=V8Tgm4g25kM2WCCCnT2r1OrCWjWdLItyYzQ4n/zj1I0=;
 b=lPQ+IiXG5D//aNfBI+stHXFZofpGxx6NHG6DytsXmTj5Un7Uyz++NZLgCAXNA8S5Kk4O
 N5ltsXFeBfuOoHpWu/opPG/RedR0h+d/YU85ZVE9ndAREw1ZM1LsQjPFpgprZqyJzuaL
 0wj6nkm7Yr9T/t6s6K5I4zaqMX9EbYTBQmViRsbdSJQy3GohvtyBsnEi+NXtTZ8DgkC+
 1xRp+JgXn3N3mA4y+hv5HX1L7Xok0sL6oFa/2LJnxAYOK2fXHOgSx2uh/q1I9EI5bcsO
 8NIvD4DKN0z6w79V7DN8fZy4Nsbkg8PZv6yFb8YIIhxlhkVfEYN/Qisl1HEmPSWAOG8m AQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 37yvean04c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 13:17:00 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13MDEvUg185391
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 13:16:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3030.oracle.com with ESMTP id 3809m28fv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 13:16:59 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13MDGxwZ002875
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 13:16:59 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 3809m28fu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Apr 2021 13:16:59 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13MDGuP3002239;
 Thu, 22 Apr 2021 13:16:56 GMT
Received: from gyrotron.nl.oracle.com (/10.175.36.197)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 22 Apr 2021 06:16:56 -0700
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Thu, 22 Apr 2021 16:16:27 +0300
Message-Id: <20210422131630.28565-1-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Proofpoint-GUID: Sp9eO-m6ml6WgZbl8B0NH405kNgumMv4
X-Proofpoint-ORIG-GUID: Sp9eO-m6ml6WgZbl8B0NH405kNgumMv4
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9961
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 phishscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=872 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104220106
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] network/virt: new FOU and GUE tests
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

The first patch adds IPv6 flag '-6' to the library, which
will be used by the two new tests in this patch series too.

The rest are adding two similar tests for UDP tunneling.

Alexey Kodanev (3):
  lib/tst_test.sh: add TST_IPV6_FLAG ('-6')
  network/virt: new test for generic udp encapsulation (gue)
  network/virt: new foo over udp (fou) tunneling test

 runtest/net.features                        |  6 +++
 testcases/lib/tst_net.sh                    |  4 +-
 testcases/lib/tst_test.sh                   |  2 +-
 testcases/network/stress/route/route-lib.sh | 15 +++----
 testcases/network/virt/fou01.sh             | 48 +++++++++++++++++++++
 testcases/network/virt/gue01.sh             | 45 +++++++++++++++++++
 testcases/network/virt/virt_lib.sh          | 24 ++++++++++-
 7 files changed, 132 insertions(+), 12 deletions(-)
 create mode 100755 testcases/network/virt/fou01.sh
 create mode 100755 testcases/network/virt/gue01.sh

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
