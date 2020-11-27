Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D612C616B
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Nov 2020 10:15:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B448D3C5DD8
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Nov 2020 10:15:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id F37653C2439
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 10:15:16 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 51AB8200FEB
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 10:15:16 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AR9F4x3114016;
 Fri, 27 Nov 2020 09:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=O59lwLfvHqYG+9Xjp39guuvWDApl2ocNEt4ONZnDSVY=;
 b=sxCcTTSojvd436eeZZbgzBTu9OMikSLeD71JhU7VPPUSGhFWZPT30fWw9+803nizoKCd
 CUBE+iW3CuXam+1OBpcddfLAGNgTa6Tl2KgMqavQT7qZd6OT7Th0g9pDm7gMTosivifk
 RH9qjrImwHjrFipsPJVDUeu7unraNNuyh1uBGDEtcLj6Ko11jJ+sbvtytlvNaVqFvudx
 wKShvdmahdSpVOg8Ic0fzD+AGf3Zw3rSGE0pvpgIAqSGHqjpLWRXa5DBeWLWFmxr/xj3
 lhFh8rNx6ASqA2PbOq2EMtqDvU/2wj5ORr8ky8NlUI2LVwUrAeCPVZqpttyQdX8BeEZg ag== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 351kwhgfcq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 27 Nov 2020 09:15:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AR9A8OC188944;
 Fri, 27 Nov 2020 09:15:07 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 351n2m3vdq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Nov 2020 09:15:06 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AR9F5WJ021085;
 Fri, 27 Nov 2020 09:15:05 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 27 Nov 2020 01:15:05 -0800
To: Cyril Hrubis <chrubis@suse.cz>, j.nixdorf@avm.de
References: <edf96c93-8f16-6545-629a-be727d4c8eb2@oracle.com>
 <OFCE604BCE.4F62924B-ONC125862B.004801C0-C125862B.0048027B@avm.de>
 <OF47EE0279.8BED1D35-ONC125862C.0051B56D-C125862C.0051B570@avm.de>
 <20201126150349.GB4646@yuki.lan>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <e971647d-6cac-fa39-9dad-7e993375fd21@oracle.com>
Date: Fri, 27 Nov 2020 12:15:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201126150349.GB4646@yuki.lan>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9817
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011270057
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9815
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011270057
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] netstress: explicitly set a thread stack size
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 26.11.2020 18:03, Cyril Hrubis wrote:
> Hi!
>> I'm reluctant to use a static value here as max_msg_len may be modified
>> by command line arguments.
> 
> Wouldn't it be easier to use malloc() instead of putting large data
> structures on the stack and working around that by increasing the
> limits?

In the current server implementation it would hurt performance, so
I assume it would also require to make a memory/thread-pool...

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
