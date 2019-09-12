Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC16B10CF
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 16:15:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EB9D13C20AD
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 16:15:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 022143C0428
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 16:15:38 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EF7C7141CE8C
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 16:15:37 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8CE4j7q170993;
 Thu, 12 Sep 2019 14:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=OdIPQMFoLRhGqJ7aNkcBM20AT9rbQFsHftjQ15B/tjw=;
 b=TTlfToYY4p/TCtQ9eRMEvtKyyo5yrSQ0pKNHaBlp3nmCv9/rPQN36bXi8EpLduP8/cYf
 yVrfyO8UE4q7Io3zE85/ZOuYjI6+3kFu3d2dmTdl6gPGiY8CPu/bSOE3QgNAWqpwaqzg
 QFq2D8upFcdDWWkvD+XYedKdNGyOhSkgpZtGq0wT0OHDpVt2v9ps7jnfo85jogb5gesn
 11hjlfUElAeJV81Rr18JDsgMgO5fwuuvPIoiR7BRMoW6KKX6FMgqUy7ZmjPxE6DgT9RB
 z23MJqavt74E2CGuXtkBe3If6YDaCfa0rewZ7ZXLNGHyrNfA7cSCkIDkllJ8FftdTbvy 2A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2uw1jkrqxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Sep 2019 14:15:35 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8CEFM87162363;
 Thu, 12 Sep 2019 14:15:34 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2uyew58vs9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Sep 2019 14:15:34 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8CEFNKu005970;
 Thu, 12 Sep 2019 14:15:23 GMT
Received: from ak.ru.oracle.com (/10.162.80.29)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 12 Sep 2019 07:15:23 -0700
To: Petr Vorel <pvorel@suse.cz>
References: <20190903141610.28887-1-pvorel@suse.cz>
 <df197557-8f95-52d5-813e-a5abc73a1af6@oracle.com>
 <20190912134826.GB22246@dell5510>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Organization: Oracle Corporation
Message-ID: <ed511992-8853-b7ca-9a8a-84c98f26887d@oracle.com>
Date: Thu, 12 Sep 2019 17:18:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190912134826.GB22246@dell5510>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9378
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909120149
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9377
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909120149
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 9/12/19 4:48 PM, Petr Vorel wrote:
> Hi Alexey,
> 
> first, thanks for your review.
> 
> ..
>>> this version address functionality problems you pointed out.
>>> But yet there might need to be another version as I'm not sure about
>>> tst_ipaddr_un() API changes.
> 
>>> Changes v3-v4:
>>> * enhanced tst_ipaddr_un() with -b, -h -l, -m, -n and -p options (-p was
>>> previous -m)
>>> * use tst_ipaddr_un() options to fix address clash on host_id, net_id clash fix
>>> by adjusting $1 in test (this is really inconsistent, see note at 3/7).
>>> * added tests for tst_ipaddr_un()
>>> * quiet EXPECT_PASS ping$TST_IPV6
> 
> 
>> The patch-set looks good, the only concerns are:
> 
>> * complicated tst_ipaddr_un(), may be add another high-level function
>>   to use raw tst_ipadd_un(), if -b, -f, -n options are really needed?
> Sure. I'll keep only -l and -m and drop -b, -f, -n and -h as not needed ATM.
> And add them via high-level function only if needed.
> 
> In that case I'd like to have -l and -m functionality also for NET_ID (already
> needed in route-change-dst.sh). But not sure which options would be for it
> (it'd be easy with long opts, but we don't want to depend on /usr/bin/getopt,
> nor to parse it manually although of course doable)
> 
> Another option is to have single option for adding both MAX and MIN:
> 
> -h MIN,MAX # for HOST_ID
> -n MIN,MAX # for NET_ID
> 
> (e.g. -n5,255 -h1,255)
>

It can be the best option,

 
> But it looks to me a bit uncomfortable having to always to add both min and max.

max "-n ,254" or min "-n 2"?


> 
>> * if NS_TIMES is large, there are a lot of messages in a test output
>>   (it seems NS_TIMES * 4), could we minimize the number of them?
> 
> I can add -q option to tst_add_ipaddr() which usage will make it NS_TIMES * 2. (1)
> If it's still too much I'll drop "testing route over ..." (2)
> Other option would be to print only even Nth iteration (I don't think it's a
> good idea) or even has only single TPASS/TFAIL.
> 
> BTW don't we want end testing on first failure?

Agree, why not.


> 
> 
> Kind regards,
> Petr
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
