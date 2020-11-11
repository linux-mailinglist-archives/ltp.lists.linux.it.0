Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF392AF453
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 16:02:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 357F33C535B
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 16:02:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 9E40E3C2F2E
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 16:02:11 +0100 (CET)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DB2C5200B07
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 16:02:10 +0100 (CET)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ABEtLL5015762;
 Wed, 11 Nov 2020 15:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=bN0vRV/QQpLbHJNtji7Fzgpl3cL1F6NcBXKxxm7Xf/M=;
 b=vbI0b0+Sg53bZ8QImgv+MQV8c1hcdNYEN0gLMTXINcOKYuuZo8Gr3tV/1MKuA7sK8LEm
 kVzQhXqs3Eh8rTSgyjAfM5UL1W9shHWZL25PP2D8azAjxQTjRsJPghfokuObKBw/ReAm
 HVXYAellifJ+vczAgpcXxRJbC/EHU8x2nMw3+cLLSdc14mp+2Koy4QLgOG6ffVJkIqeh
 J+5ipREg+hefYi+p5/5FnRNOO4o3eJDmLk+y/r00je4sGcefp610DJIBczJ1ew2va5+L
 14IlSgNLZEJ3S58cSrlIio4gaeTU+Tcx132ZfVJLxwOciMjZgLVV1jzGPUSViUsRp1aD 1A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 34p72eqf3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 11 Nov 2020 15:02:03 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ABEstMX170903;
 Wed, 11 Nov 2020 15:02:02 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 34p5g1tv06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Nov 2020 15:02:02 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0ABF1tpO012511;
 Wed, 11 Nov 2020 15:02:00 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 11 Nov 2020 07:01:55 -0800
To: Petr Vorel <pvorel@suse.cz>, Kory Maincent <kory.maincent@bootlin.com>
References: <20201110180533.28595-1-kory.maincent@bootlin.com>
 <20201111144005.GA3358@pevik>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <5fab0669-9597-8e20-4f6b-3c21da0e125c@oracle.com>
Date: Wed, 11 Nov 2020 18:01:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111144005.GA3358@pevik>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9801
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011110090
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9801
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011110090
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] tcp_cmds/ping/ping02: Make it compatible with
 Busybox
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

On 11.11.2020 17:40, Petr Vorel wrote:
> Hi Kory, Alexey,
> 
>> The ping from busybox does not have -f parameter, use -i parameter instead.
>> BusyBox does not accept pattern longer than 2 bytes.
>> BusyBox support -i option since version 1.30
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> Tested-by: Petr Vorel <pvorel@suse.cz>
> 
> LGTM.
> 
> I suggest to merge with few changes below.
> 
> * more precise message "ping from old busybox?"
> * use just $(tst_ipaddr rhost) instead of $ipaddr
> (some time ago we've started to use function calls for these simple evaluations)
> * upper case for global variable (ugly, but easily recognizable

Hi Petr,

Feel free to add the style changes, ack. I've already applied the patch.

Thanks Kory!


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
