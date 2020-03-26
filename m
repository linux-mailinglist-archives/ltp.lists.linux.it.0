Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C94619425E
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 16:08:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E61DC3C4B4E
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 16:08:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 3B8223C4AD8
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 16:08:18 +0100 (CET)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EF5B2601519
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 16:08:17 +0100 (CET)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02QF3GGN166819;
 Thu, 26 Mar 2020 15:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=Yk0ykY8cSBi0GHXG1YLJhVXqHDgzVVDdYQR5CpkrFY4=;
 b=GYZUv1l+4Z/zETfzy6rYOVMpDygKVSApOC4HvLZ2nnsDdj3XA6q90r1EDnaMbUqJhlQO
 UgXOe8+gP1sHS6Yl0aZ/IByEWEsIUbCEl2AZkfymNJ2w+0oelSHjiAItDwBt6G3/x0v7
 FbNEFY+auRLOY3XDyKQNmMbJpH9txvahjqr54w/gnZAmAubr0AiDDwPKOfCnZi3iHw7T
 eAzEtVSdwInLeiVpPr9R+VPA96Fng+6s9VOHMkfjCIXH81pL2jGDMab9g0kW0LlpvIzv
 KtdOg+IZpzUo2spWaycRgBQ0gTit6YgEHn5Wno5IV3kUqCPjmSjpjXAaOvQ+bTRGU992 OQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2ywabrgctr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Mar 2020 15:08:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02QF1xc3110192;
 Thu, 26 Mar 2020 15:08:14 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 3006r8m5df-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Mar 2020 15:08:14 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02QF8BEx003311;
 Thu, 26 Mar 2020 15:08:14 GMT
Received: from [192.168.1.34] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 26 Mar 2020 08:08:11 -0700
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20200324093622.21091-1-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <fb9ee711-f42d-3dd0-a2ef-1685aef951af@oracle.com>
Date: Thu, 26 Mar 2020 18:08:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200324093622.21091-1-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9571
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 suspectscore=0
 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003260117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9571
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003260117
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/2] xinetd rewrite
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

On 24.03.2020 12:36, Petr Vorel wrote:
> Hi Alexey,
> 
> this sounds as a bad joke to rewrite tests for xinetd, which nobody uses
> now. I was surprised, that it's still in some distros (e.g. openSUSE,
> Debian, Gentoo). I can delete the test if we don't want LTP to be a
> museum.
> 
Hi Petr,

Perhaps, it is true for inetd, not for xinetd.

The changes look good, acked.

> Kind regards,
> Petr
> 
> Petr Vorel (2):
>   xinetd: Rewrite into new API
>   xinetd: Fix pattern for NetKit telnet
> 
>  testcases/network/xinetd/xinetd_tests.sh | 99 ++++++++----------------
>  1 file changed, 33 insertions(+), 66 deletions(-)
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
