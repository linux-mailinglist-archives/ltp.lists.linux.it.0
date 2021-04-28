Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C8D36D1DC
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 07:57:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 80DB43C625D
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 07:57:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9A7593C621D
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 07:57:47 +0200 (CEST)
Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com
 [195.245.230.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9B43E601357
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 07:57:46 +0200 (CEST)
Received: from [100.112.199.60] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-b.eu-west-1.aws.symcld.net id D7/50-46412-959F8806;
 Wed, 28 Apr 2021 05:57:45 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MRqhvxsyP
 B4PlSHosV33cwOjB67Pu9jjWAMYo1My8pvyKBNaPl/C32ghdMFbtvN7I1MK5m6mLk4hASmM8k
 saZ7GTOEs4dR4s2FTWxdjJwcbAJ6Ekv+7WEFsUUEJCQ6Gt6ydzFycDAL+Ei0zlQFCQsLWEo8P
 TyRBcRmEVCVuDnnI5jNK+Ahsex5PyOILSGgIDHl4XtmiLigxMmZT8BqmIFGHnzxghmiRlHi7N
 R1LBB2lUTnh+NsExh5ZyFpmYWkZQEj0ypG86SizPSMktzEzBxdQwMDXUNDI11DSzNdMxO9xCr
 dJL3UUt3y1OISXUO9xPJiveLK3OScFL281JJNjMDgSik44rCD8f7rD3qHGCU5mJREeefNb08Q
 4kvKT6nMSCzOiC8qzUktPsQow8GhJMGr+r0jQUiwKDU9tSItMwcY6DBpCQ4eJRHe45+A0rzFB
 Ym5xZnpEKlTjIpS4rwlIH0CIImM0jy4Nlh0XWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzL
 sOZApPZl4J3PRXQIuZgBYvO98GsrgkESEl1cBkHH2GXzZo/4NP0hettk0MfScf9Wpj5paoEqm
 TDtpxq2ZbrpbdvzM9NW157I55vLtyjnCYScpXh3ZGqE7KWZF4tnN6m+z85pn78j26v/24ITNz
 bYd3eXX7N4GZD/VNjjDMXSLtUrhTr+3p458Maktnx6erWYsuXGy4kvXcxyaJzQtbbq/6rLbcr
 0Wt85/wB3/eZ0/POGm/Ef9WaPP2cneedmb6JMnNbqfkzK4lhP/mkzgl8PjLBm45PxM5rp3bOP
 h7nXJ1dq1K2vtKMyiT8+bCKelGF632S31RDQs9d/tb+wHpS+6f2FkMH7/ZuWBV6fGDvCXHDVu
 c97x62V2xKuDiB4Fa4dKf1z08z0k6H7dWYinOSDTUYi4qTgQA/AenMykDAAA=
X-Env-Sender: huangjh.jy@fujitsu.com
X-Msg-Ref: server-6.tower-285.messagelabs.com!1619589463!2076843!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3263 invoked from network); 28 Apr 2021 05:57:44 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
 by server-6.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Apr 2021 05:57:44 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com
 [10.182.185.121])
 by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13S5vbBp004399
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 06:57:43 +0100
Received: from localhost.localdomain (10.167.220.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 28 Apr 2021 06:57:35 +0100
From: Jinhui Huang <huangjh.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 28 Apr 2021 13:56:51 +0800
Message-ID: <1619589411-3349-1-git-send-email-huangjh.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] runtest/mm: Remove mem03 from runtest/mm
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
Cc: xuyang2018.jy@cn.fujitsu.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Jinhui Huang <huangjh.jy@cn.fujitsu.com>
---
 runtest/mm | 1 -
 1 file changed, 1 deletion(-)

diff --git a/runtest/mm b/runtest/mm
index eeebd87..6537666 100644
--- a/runtest/mm
+++ b/runtest/mm
@@ -21,7 +21,6 @@ mtest06_3 mmap3 -x 0.002 -p
 #mtest-6_4 shmat1 -x 0.00005
 
 mem02 mem02
-mem03 mem03
 
 page01 page01
 page02 page02
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
