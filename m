Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A3CB0F25
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 14:53:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B78023C20B5
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 14:53:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id C3C303C0051
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 14:53:24 +0200 (CEST)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1F1031A04320
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 14:53:23 +0200 (CEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8CCnCwi121469;
 Thu, 12 Sep 2019 12:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=3y3g0iZ4kNQ96/FbMtM533daB/szUvpNfTBr7H3bdk4=;
 b=kkmnhCxFZt3auBsfMEJn42zgiXAwVqyPzRJN/i2wcJtaZR6DCWZalnTRqnu1xzWmkBL6
 hY43gdCRX+cewUdV0c8+4hezTVgQx8gwTdnWdd+AWYYgGbVttZAL7B6pU++RuOecEP5L
 tmOPDkpw9kFsuV0041VmOuo+VdM4fC9dlnKEoVaDEMgrbe91kUUnWTa13waCVgaKIDBK
 vPzHP1xmE1CTzzU6IdUA2KJfepZaDnFy4l5F5ThhRkKOYm7yuYAK8jVsdAidP6z0aUd1
 OiGanQKud6jzj27CiR4pkJkfXzJGc0SRH1gKS7S3PddKIoBtz4lIfF2Yi/cPTO+Evckw NQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2uw1m989dk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Sep 2019 12:53:22 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8CCqmtp108852;
 Thu, 12 Sep 2019 12:53:21 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2uxk0ub862-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Sep 2019 12:53:21 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8CCrKgg003061;
 Thu, 12 Sep 2019 12:53:20 GMT
Received: from ak.ru.oracle.com (/10.162.80.29)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 12 Sep 2019 05:53:20 -0700
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20190903141610.28887-1-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Organization: Oracle Corporation
Message-ID: <df197557-8f95-52d5-813e-a5abc73a1af6@oracle.com>
Date: Thu, 12 Sep 2019 15:56:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190903141610.28887-1-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9377
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909120137
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9377
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909120137
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 0/7] net/route: rewrite route-change-{dst, gw,
 if} into new API
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

On 9/3/19 5:16 PM, Petr Vorel wrote:
> Hi Alexey,
> 
> this version address functionality problems you pointed out.
> But yet there might need to be another version as I'm not sure about
> tst_ipaddr_un() API changes.
> 
> Changes v3-v4:
> * enhanced tst_ipaddr_un() with -b, -h -l, -m, -n and -p options (-p was
> previous -m)
> * use tst_ipaddr_un() options to fix address clash on host_id, net_id clash fix
> by adjusting $1 in test (this is really inconsistent, see note at 3/7).
> * added tests for tst_ipaddr_un()
> * quiet EXPECT_PASS ping$TST_IPV6
> 

The patch-set looks good, the only concerns are:

* complicated tst_ipaddr_un(), may be add another high-level function
  to use raw tst_ipadd_un(), if -b, -f, -n options are really needed?

* if NS_TIMES is large, there are a lot of messages in a test output
  (it seems NS_TIMES * 4), could we minimize the number of them?

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
