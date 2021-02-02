Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EB88F30BFA0
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 14:37:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8BDDE3C7484
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 14:37:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 269543C741D
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 14:37:33 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 91663200B6B
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 14:37:32 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 112DSsug053862
 for <ltp@lists.linux.it>; Tue, 2 Feb 2021 13:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=RcydXISFUTmzta+7ep9q0hj84ZZtFX+HJD0vf2FFsPA=;
 b=rSbw5zSblT1Lr/2p9asFLFPf2gSr8tV09BrGrB7RvsdK+hUvgCYk0suh03/oPqpLMbPY
 ypFi2Dvoukeuk/+kHd0ziSc3805t3hx9c7WEdZ1GqsiKITsuGLhAeUOjr5C950Z/FotS
 50KcveXORjZg2PZX1UI0uVAsVWRVadtlrZ2qavbm3l9pNtMEBkVXLwY3pVdmEcO8RbCf
 Boz/dB5VUy1G0sjoaRYYc2bmX2jRuQ6nTZ1iVcMS3rJagJb7iwtEAiMUvNMBObvcej4f
 CNZrF3/oCYktZNqjb5groF3lJxWOZxQlu5bkML9jb0aRtq4+w7jFN4OpSBWPFl2NN7jU xg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 36cydktrcc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Tue, 02 Feb 2021 13:37:30 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 112DUARc028827;
 Tue, 2 Feb 2021 13:35:28 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 36dh7rgakv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Feb 2021 13:35:28 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 112DZOTA006959;
 Tue, 2 Feb 2021 13:35:24 GMT
Received: from gyrotron.nl.oracle.com (/10.175.12.115)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 02 Feb 2021 05:35:24 -0800
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Tue,  2 Feb 2021 16:34:51 +0300
Message-Id: <20210202133454.59224-1-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9882
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102020092
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9882
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=951 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102020092
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] lib/tst_net.sh: calc median instead of mean in
 tst_netload()
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

This series of patches is intended to improve the reliability
of results in network tests that using tst_netload().

After TST_NETLOAD_RUN_COUNT was added, we get several results (5 by
default). The first patch allows all of them to be displayed along
with the final result. It helps to debug test performance failures.

Further patches replace the mean calculation of such data set with
the median one. It allows to exclude extreme points from the final
result.

Alexey Kodanev (3):
  lib/tst_net.sh: print all netstress results in tst_netload()
  lib: add tst_get_median helper binary for use in script tests
  lib/tst_net.sh: calc median instead of mean in tst_netload()

 testcases/lib/.gitignore       |  1 +
 testcases/lib/Makefile         |  3 ++-
 testcases/lib/tst_get_median.c | 37 ++++++++++++++++++++++++++++++++++
 testcases/lib/tst_net.sh       | 10 ++++-----
 4 files changed, 45 insertions(+), 6 deletions(-)
 create mode 100644 testcases/lib/tst_get_median.c

-- 
2.25.1

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
