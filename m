Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D32D82BA219
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Nov 2020 06:59:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 93A923C2E02
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Nov 2020 06:59:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id D33023C2DE6
 for <ltp@lists.linux.it>; Fri, 20 Nov 2020 06:59:24 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C66B010009FA
 for <ltp@lists.linux.it>; Fri, 20 Nov 2020 06:59:23 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AK5sjmk173639;
 Fri, 20 Nov 2020 05:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=jUrZ+UZ4FMNxIoy4aZzwI2MPw7Wng6PYnE3jGJmTxvU=;
 b=EH0MZQVIQJTvBk6IrA/elKeZHUFPD8HvWR3H6L+swf6hOd34ZfH7sHd2LyzYtRFG17Kf
 TfewtDJ2Rf+A7Tnvak8yuhNzY1qXM6YcAolExaU/VtLrvxJmPeDYbAFl98u1oRgXL6ZF
 O5kcCQSWGX1feuKnXc+IXmFhi1rKwtJvq7w7zR9Md8mfGKS8LlOxPMxgDHkcqzw+7zir
 MlcCF7PVKbfSS99wJTrUu8VptaUBMMalIxOWNK8LseEmzWIT7Vxg7U2+jxCeifJ4/Wdm
 hSSNy23ecsRG+wkqMiCdl26f4LvKXgCpaPQTV/lhpNX1QNy5A82E0oQy+WCF9SRuHJPZ xQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 34t76m9180-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 20 Nov 2020 05:59:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AK5pPj2188731;
 Fri, 20 Nov 2020 05:59:15 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 34umd30tyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 05:59:15 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AK5x6O2019176;
 Fri, 20 Nov 2020 05:59:08 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 19 Nov 2020 21:59:06 -0800
To: Petr Vorel <pvorel@suse.cz>
References: <20201112173609.4123-1-petr.vorel@suse.com>
 <20201119152300.05ef03b0@kmaincent-XPS-13-7390>
 <20201119154132.GA16438@pevik>
 <cf76949d-32a7-7b2d-4d5b-6117676ecea6@oracle.com>
 <20201119195618.GA3181@pevik>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <1d451c4a-6599-ac95-2b51-509fdd4c277a@oracle.com>
Date: Fri, 20 Nov 2020 08:59:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119195618.GA3181@pevik>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9810
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011200039
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9810
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011200039
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] net/traceroute01: Check also -T flag
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

On 19.11.2020 22:56, Petr Vorel wrote:
> Hi Alexey,
> 
>> On 19.11.2020 18:41, Petr Vorel wrote:
>>> Hi Kory, Alexey,
> 
>>>> Hello Petr,
> 
>>>> Just find out you didn't merge your patch which makes the code cleaner. :)
>>> Waiting for Alexey's review.
>>> Also hesitate about tracepath6 symlink to traceroute being always installed
> I meant here traceroute6 symlink to traceroute.
>>> on all distros (hopefully yes).
> 
>> Hi Petr,
> 
>> From the subject it seems you are adding a new check for -T flag
>> but it is actually for -I option?
> Good catch, thanks!
> 
>> I think it's ok using symlink or -4/-6,
> If nobody complains I'd keep symlink version as it can check
> traceroute from iputils. -4/-6 is more portable. If anybody complains and we
> revert it back, I'd also put back iputils related warning.
> 
>> it is also adding an extra
>> check for ipv6 that $(tst_ipaddr rhost) is indeed ipv6.
> Sorry, I didn't get this.
> 

Hi Petr,

traceroute6 127.0.0.1
traceroute6: 127.0.0.1: Address family for hostname not supported

And both ::1 and 127.0.0.1 are ok for traceroute without the address
family option.

> BTW ack this change?
> 

Acked-by: Alexey Kodanev <alexey.kodanev@oracle.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
