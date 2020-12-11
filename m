Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E2C2D747E
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Dec 2020 12:10:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 975BF3C61AA
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Dec 2020 12:10:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 466A63C2A82
 for <ltp@lists.linux.it>; Fri, 11 Dec 2020 12:10:10 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5031E200DAC
 for <ltp@lists.linux.it>; Fri, 11 Dec 2020 12:10:09 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BBB5RMf056792;
 Fri, 11 Dec 2020 11:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=CbqXuyF4KS0AwlY/V3HEKrGnuKny3wD5R8er0t9YewU=;
 b=K2LOXVi5IE7p9J6xpRTaLabyFNP4fEv8ZSEAiXULGQfVkAzoZzF2rNH+s+xDzwORghFD
 4SIvAltFDZ6vZ8Nip1Xs/gOk2TtRgoIOuiwBUt5dAf9H1srj+DoxI4OxacbiNzSLyqiu
 mrYhGUsYnMt7UWF4EzUcbQke1UAzdCt66uCAnPjhagJWJT71P2QF1Vwtf9B7LI3ZQPmX
 Fy49FqfqnEr47t80267UU4m4t4+8GYNhWbF1AwOBcBp2gY+HxUo9MTiUmyqQffBB4jSG
 wD8kiHOep/AjqD4dOQq9T6qe4tKRE3Bgn89cZ6e9TQJkHsM9j2VIM8VLT3XtolzcuExQ XQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 35825mj3uw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Dec 2020 11:10:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BBB4o3M099450;
 Fri, 11 Dec 2020 11:10:04 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 358kyxv6tv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Dec 2020 11:10:04 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BBB9xn1024710;
 Fri, 11 Dec 2020 11:10:02 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 11 Dec 2020 03:09:59 -0800
To: Petr Vorel <pvorel@suse.cz>
References: <20201208162440.14538-1-alexey.kodanev@oracle.com>
 <X9M4ol3AqYU8YtZQ@pevik>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <4b2f0cc7-2caf-34a5-12c2-6d0c33bfcbf0@oracle.com>
Date: Fri, 11 Dec 2020 14:09:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X9M4ol3AqYU8YtZQ@pevik>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012110070
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012110070
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib/tst_net.sh: add getopts to tst_ping()
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

On 11.12.2020 12:15, Petr Vorel wrote:
> Hi Alexey,
> 
> BTW -f does not require root (but effectively it's required by netns setup).

Hi Petr,

Are sure -f doesn't require root?

> 
>> * Replace '-i 0' with '-f'
> Out of curiosity, why flood ping is better than -i 0?
> More effective stressing?

I think it's better to use the option that is specially made
for this, isn't it? AFAIK, -f won't do verbose printing, though
we could add -q too along with -i 0...

> 
> Ad Busybox ping fallback -i 0.01, interesting -i 0 keeps blocked in
> recvfrom():
> 
> $ strace busybox ping -i 0 localhost
> setsockopt(0, SOL_SOCKET, SO_BROADCAST, [1], 4) = 0
> setsockopt(0, SOL_SOCKET, SO_RCVBUF, [7280], 4) = 0
> rt_sigaction(SIGINT, {sa_handler=0x55935b81f3a0, sa_mask=[INT], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f82be570af0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
> sendto(0, "\10\0H\25*k\0\0T\2200\357\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 64, 0, {sa_family=AF_INET, sin_port=htons(0), sin_addr=inet_addr("127.0.0.1")}, 28) = 64
> rt_sigaction(SIGALRM, {sa_handler=0x55935b81f4d0, sa_mask=[ALRM], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f82be570af0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
> setitimer(ITIMER_REAL, {it_interval={tv_sec=0, tv_usec=0}, it_value={tv_sec=0, tv_usec=0}}, NULL) = 0
> recvfrom(0, "E\0\0Tf\25@\0@\1\326\221\177\0\0\1\177\0\0\1\10\0H\25*k\0\0T\2200\357"..., 192, 0, {sa_family=AF_INET, sin_port=htons(0), sin_addr=inet_addr("127.0.0.1")}, [16]) = 84
> recvfrom(0, "E\0\0Tf\26\0\0@\1\26\221\177\0\0\1\177\0\0\1\0\0P\25*k\0\0T\2200\357"..., 192, 0, {sa_family=AF_INET, sin_port=htons(0), sin_addr=inet_addr("127.0.0.1")}, [16]) = 84
> write(1, "64 bytes from 127.0.0.1: seq=0 t"..., 5264 bytes from 127.0.0.1: seq=0 ttl=64 time=0.634 ms
> ) = 52
> recvfrom(0,
> 
> Is that a bug?
> 

Looks like a bug.

> Kind regards,
> Petr
> 
>> * Add similar checks for the flood and interval options as
>>   in ping02 test


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
