Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3D72B99E4
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 18:49:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C4D413C643A
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 18:49:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B8CE73C59FC
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 18:49:06 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 050781000BD6
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 18:49:05 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AJHeLB7129553;
 Thu, 19 Nov 2020 17:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=7c8utHm/tUzBA+vB3uLaAo++ITs6cvD6YMHrj0iYldg=;
 b=WVU0a/ZvYKaX9i/FhD9DMZErISIjwNnQJR0G9UA/ojIp6D79bkK3gM4H5UR+Sgw59zH3
 AjZND4gG1HYWk1o0z+D2ENNjFGkkixGwoOrg6tkyLh6KaYyDzCvgDVVu0McGPDg1qbpL
 FwstyigwLN3/k2pDRpY/CRHi2aZJLV6M+ndIZFTNAQ2i8aZf7B0jad5z3Oi820EKpHJy
 c39fekrBNsRbdShX3xkc787O1EcfeUUKjewtQu+HCXcmKvu4Snu8y0ZYTZEjN1GB+Z7c
 H8vmbzT7ppaaClvTmpJtlJ3lquZ198ZUjE0Q5EypaRwE7WGij7gXdvSd9bb+Z2E/3sUt 8A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 34t76m6t7p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 19 Nov 2020 17:49:00 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AJHdiE5118649;
 Thu, 19 Nov 2020 17:49:00 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 34uspwfj3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 17:48:59 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AJHmrHH014755;
 Thu, 19 Nov 2020 17:48:53 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 19 Nov 2020 09:48:53 -0800
To: Petr Vorel <pvorel@suse.cz>, =?UTF-8?Q?K=c3=b6ry_Maincent?=
 <kory.maincent@bootlin.com>
References: <20201112173609.4123-1-petr.vorel@suse.com>
 <20201119152300.05ef03b0@kmaincent-XPS-13-7390>
 <20201119154132.GA16438@pevik>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <cf76949d-32a7-7b2d-4d5b-6117676ecea6@oracle.com>
Date: Thu, 19 Nov 2020 20:48:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119154132.GA16438@pevik>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9810
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 mlxscore=0 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011190126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9810
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1011 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011190126
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
Cc: ltp@lists.linux.it, Petr Vorel <petr.vorel@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 19.11.2020 18:41, Petr Vorel wrote:
> Hi Kory, Alexey,
> 
>> Hello Petr,
> 
>> Just find out you didn't merge your patch which makes the code cleaner. :)
> Waiting for Alexey's review.
> Also hesitate about tracepath6 symlink to traceroute being always installed
> on all distros (hopefully yes).

Hi Petr,

From the subject it seems you are adding a new check for -T flag
but it is actually for -I option?

I think it's ok using symlink or -4/-6, it is also adding an extra
check for ipv6 that $(tst_ipaddr rhost) is indeed ipv6.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
