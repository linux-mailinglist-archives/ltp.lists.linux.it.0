Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B67A8678B
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 18:58:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8855D3C1D6A
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 18:58:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 4CE633C14F7
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 18:58:02 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 421DC1A00A5D
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 18:58:01 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x78GftSI003876;
 Thu, 8 Aug 2019 16:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=CFZgNss8wrgVTqi9Pxil6jlXsp9W+Mh4dSklyqN+PqM=;
 b=O8zlqbgLE75TCxPlWeM9ocMKBlIZJG6J2V71ApEUUg6GaqdOfQVTS13GmP3rYi95oiqc
 yM3oUp0TfeyrKRo0IP2KqzIE6cMnBbduXJ0nV2KDG6PhkmlOBBkcUeAXbs6KtwplnSBY
 oWIqM/rJ85JpzmOww6CCFGAV+sRnp/0QG6pVfyqt4paiC/5cQPY8BJuCalYoc/TajzXK
 naAmpc8zat2AQObrzsQdPGPQnjdI+OEyNPhjHw/qzAf8oamanO1XAMmFHA9lNafOmJUs
 0RqQmEUQcltreVNmmT30VEAHKwBI4mOe1QgN3XDhrGfi5TPTyYrfkXSHeLPH4jMgpHUp nA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=CFZgNss8wrgVTqi9Pxil6jlXsp9W+Mh4dSklyqN+PqM=;
 b=wGPKK2I0SarbFd2Ql9+zPXqsk+CgAFBHh6V5BwTvEQtJEgdtwl+ls2IKfgrSv2geDo5k
 ueCNmpHg6AHhmv+LjFeFNVRs36ojMc5wF4YrB8L0xeZAZS/OE4YPQ+bseE9kmJogBwSo
 Q+3nrpHUlI+h4AJFO0CP+8K9IRnGmgk4Vmyv5q1ZJywBYdylhAzxbL/X8s9uVL8Qmqd/
 hUgsw3LPn9i/pZVAoeyXI6+0b6PSgriwQbkuwIvFpYu1+wG5YfZ3eJi81oT+OyljSzge
 v/R1qa22p0QySQRA3w4u/SG7jQsuqrrNHsmDI4LH3hXEHrsGUWj4KrsTQw1pKCUOTFvu tQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2u8hgp2hep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Aug 2019 16:57:52 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x78GXLnl105386;
 Thu, 8 Aug 2019 16:55:51 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2u8pj82qfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Aug 2019 16:55:51 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x78GtlxC016879;
 Thu, 8 Aug 2019 16:55:47 GMT
Received: from [192.168.1.222] (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 08 Aug 2019 09:55:47 -0700
To: Michal Hocko <mhocko@kernel.org>
References: <20190808000533.7701-1-mike.kravetz@oracle.com>
 <20190808074607.GI11812@dhcp22.suse.cz>
 <20190808074736.GJ11812@dhcp22.suse.cz>
From: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <416ee59e-9ae8-f72d-1b26-4d3d31501330@oracle.com>
Date: Thu, 8 Aug 2019 09:55:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190808074736.GJ11812@dhcp22.suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9342
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908080153
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9342
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908080153
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] hugetlbfs: fix hugetlb page migration/fault race
 causing SIGBUS
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
Cc: xishi.qiuxishi@alibaba-inc.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
 Andrew Morton <akpm@linux-foundation.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 8/8/19 12:47 AM, Michal Hocko wrote:
> On Thu 08-08-19 09:46:07, Michal Hocko wrote:
>> On Wed 07-08-19 17:05:33, Mike Kravetz wrote:
>>> Li Wang discovered that LTP/move_page12 V2 sometimes triggers SIGBUS
>>> in the kernel-v5.2.3 testing.  This is caused by a race between hugetlb
>>> page migration and page fault.
<snip>
>>> Reported-by: Li Wang <liwang@redhat.com>
>>> Fixes: 290408d4a250 ("hugetlb: hugepage migration core")
>>> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
>>> Tested-by: Li Wang <liwang@redhat.com>
>>
>> Acked-by: Michal Hocko <mhocko@suse.com>
> 
> Btw. is this worth marking for stable? I haven't seen it triggering
> anywhere but artificial tests. On the other hand the patch is quite
> straightforward so it shouldn't hurt in general.

I don't think this really is material for stable.  I added the tag as the
stable AI logic seems to pick up patches whether marked for stable or not.
For example, here is one I explicitly said did not need to go to stable.

https://lkml.org/lkml/2019/6/1/165

Ironic to find that commit message in a stable backport.

I'm happy to drop the Fixes tag.

Andrew, can you drop the tag?  Or would you like me to resend?
-- 
Mike Kravetz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
