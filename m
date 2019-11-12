Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4013F93B9
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 16:12:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0FCC93C26D4
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 16:12:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id B25DC3C0300
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 16:11:59 +0100 (CET)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id ED1D52016A1
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 16:11:58 +0100 (CET)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xACF4JnW081301
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 15:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2019-08-05; bh=vPLlNbyFQQg5Xra/VsvrHB7FT5M7mPF+zzO+lh0GIuY=;
 b=JsXrfYP8slNdRUx8swXSi3L5hMCXKRej9HMRyRw75XENSVbC2iTMq4tUZRFKTsWadkxM
 IK1S/k+jinEKy7rn/0IE5jK7/LjuBFJwWB1Kg7XrXE0gQWRjzLKqj0QzdfY8NqgPGmX+
 gtvXtLpRxD7luKkwkodqOZRgKU6e3WifrkwSr7w8I0ptxtfZ9RMFYtqdUGk/gP+TmlBW
 GFpwWUDz278fxBfsb4s0mEswizPR0C+MQsPu6ISD4WGMxRcdzX0ebxluWvwTnLJDED31
 oOgOHAf25ya3PBA4qRExj+Tw3zQM3ZP+3+rT1yv1GMjvslzxLQKNnLBaHDhTLq0IqPHw dw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2w5mvtnfkr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 15:11:57 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xACF4Ukb180717
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 15:11:56 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2w7khkf5a2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 15:11:55 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xACFBqGZ018848
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 15:11:55 GMT
Received: from gyrotron.nl.oracle.com (/10.175.42.219)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 12 Nov 2019 07:11:52 -0800
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Tue, 12 Nov 2019 18:11:30 +0300
Message-Id: <20191112151131.5740-1-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9438
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911120133
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9438
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911120133
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] network/netstress: fix -D option description
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

Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
---
 testcases/network/netstress/netstress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/network/netstress/netstress.c b/testcases/network/netstress/netstress.c
index 413f20a9d..a5cc9a532 100644
--- a/testcases/network/netstress/netstress.c
+++ b/testcases/network/netstress/netstress.c
@@ -999,7 +999,7 @@ static struct tst_option options[] = {
 	{"T:", &type, "-T x     tcp (default), udp, udp_lite, dccp, sctp"},
 	{"z", &zcopy, "-z       enable SO_ZEROCOPY"},
 	{"P:", &reuse_port, "-P       enable SO_REUSEPORT"},
-	{"D:", &dev, "-d x     bind to device x\n"},
+	{"D:", &dev, "-D x     bind to device x\n"},
 
 	{"H:", &server_addr, "Client:\n-H x     Server name or IP address"},
 	{"l", &client_mode, "-l       Become client, default is server"},
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
