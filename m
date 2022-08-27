Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5605A45E6
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Aug 2022 11:18:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7212D3CA603
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Aug 2022 11:18:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1FCE83C7CB4
 for <ltp@lists.linux.it>; Sat, 27 Aug 2022 03:55:43 +0200 (CEST)
Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com
 [162.62.57.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9408E600045
 for <ltp@lists.linux.it>; Sat, 27 Aug 2022 03:55:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1661565337;
 bh=OaFKSypAAGnUZoVfV8hpUSQO8wD7rpZb51osQqRETEw=;
 h=From:To:Cc:Subject:Date;
 b=ZLiiZunaV4dQI79mRbtAvLzazRI2Gw82sqcZ1qOrVmsk7iYrVE2B2kP3BpC/kyOET
 JtH16TGIe507iPr0+TllrafgwS4NgSai0B/pyboXbH1m49RB9qqUUKMQVsD8PQJzDI
 CIwQ59eaTRnqrLwMdZoDciAUG4P1FRVPJfamA6dQ=
Received: from localhost.localdomain ([123.52.25.162])
 by newxmesmtplogicsvrszc10.qq.com (NewEsmtp) with SMTP
 id DE39D4C7; Sat, 27 Aug 2022 09:55:35 +0800
X-QQ-mid: xmsmtpt1661565335t1hg2shsf
Message-ID: <tencent_8D749A790ABC81A17D9575610A12AD6D3D05@qq.com>
X-QQ-XMAILINFO: MVbvI5amSZ2Ya/vrJVN7DmAiPKi7csj/DWuNYn6SKzO/LjVrKG5+RX584Z1xdw
 p/JTxTLcddyRQkY0uv2/i6HU6iHGPR5A+PU4eAcUSFHq4SRdEz15FpNhkGGCTC/jMmYMbmnhWls8
 iooPEhjIO/CJjzgIyBAbVDSQmq24mXZ0y1jq4sgxl+hcnfXjDxhprY3TF6H6kg6OZ53HyAfLCtLi
 iNcnDQ/ltInWREJ0eHpr01i0plmwI0nNxhQ9LZCh2/H9j00pkx/eLDyWozMDYuuNfq6N8/o8wGXE
 YIhidoqjxC4lUJ3MRDh+KIw3RZLJ/Grb6XmJjRWisGhxJQ+HJ4mvXdMRUd2OHEWJ8UV2pEsKDFiW
 dpzFlSJh0pq5fohzUsMyJfVFPp9qcjF30qg26/Cym6H486vmCbORPmiPLOpIub9eOjH2nlUjjL45
 MPG9cV4K53XseuZgB+0AjzcKublIKFzsWKBsa3C7D/oUiDnXfRj08RTzCBcdY3w8lTBhfiaruOrQ
 29Ogk0IQUgv8j+xi2/NZyD+P70g6/VE2a8bn3MPwsrmk3oI/dCr+X0QsYxKdOcW6/PPeFmK7zmXH
 RI13Wh1dbP0IlRG/yisHvIfN2hueYSZbsm0wFSOlhLmEQxNgPSMDzRIw9O9nwQGykUciBJ8H3wCC
 7Tup5Yw4DIoN/iptt/Xl/qTTo+nvjDt9v24ssx3zzsZ23JooIV/usnxh37lwaPUdCiaXQP5snNwz
 HJNbxFdmLLlccz4mXF3/E+udTd5jX4kzHx9a4I9nv0h19Q1yLR7+d6vR8GQx76yH+GkhJS7uzeR0
 BO+QjDL06L4zwoNGH9WLT7Z3JZbjHdNg+YRH1DNd1g5mWgfZKxVCy8y21oAO38nNZXaIereXJRoI
 Rv+ezCNjKIT53DsNZowHHOje4/ku60OcmPZ74Q9YBqjXTEExUDWJCuf5hLJqe9AWs11yWPKkmH
From: huangjuniter@foxmail.com
To: ltp@lists.linux.it
Date: Sat, 27 Aug 2022 09:55:26 +0800
X-OQ-MSGID: <20220827015526.2013-1-huangjuniter@foxmail.com>
X-Mailer: git-send-email 2.37.2.windows.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HELO_DYNAMIC_IPADDR,
 RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 29 Aug 2022 11:17:28 +0200
Subject: [LTP] [PATCH] pm_include.sh: Fix no_of_sockets calculation error of
 is_multi_socket() function.
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
Cc: Jun Huang <huangjuniter@foxmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Jun Huang <huangjuniter@foxmail.com>

---
 testcases/kernel/power_management/pm_include.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/power_management/pm_include.sh b/testcases/kernel/power_management/pm_include.sh
index 35ff0f1e6..f3e160445 100755
--- a/testcases/kernel/power_management/pm_include.sh
+++ b/testcases/kernel/power_management/pm_include.sh
@@ -124,8 +124,8 @@ check_input() {
 
 is_multi_socket() {
 	no_of_sockets=`cat \
-		/sys/devices/system/cpu/cpu?/topology/physical_package_id \
-		| uniq | wc -l`
+		/sys/devices/system/cpu/cpu*/topology/physical_package_id \
+		| sort -u | wc -l`
 	[ $no_of_sockets -gt 1 ] ; echo $?
 }
 
-- 
2.37.2.windows.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
