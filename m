Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C3E7937E
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 21:01:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 75E943C1D31
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 21:01:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4FC183C1D18
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 21:01:03 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F3727200346
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 21:01:02 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6TIsOTM113863;
 Mon, 29 Jul 2019 19:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=lAL03gieRWMt2NiHS28qTkY4C5xTTlo85PjStvM0KRU=;
 b=um4NIe510L2v/cjoKmnDynIkYzl4e4EI30gykJDTPQhknFlZALvoG4XLQPCL4b/D0CxI
 drQ07qYB2nYfJH5gpFo7wgUpV+XmerDqBFuWn4UyWH2y9tJVcXAtt1GS23TbVgASDhmk
 dbUfcWnFQ4rMXZemxksjR5Wg+T5dbrjJMiS6tDYvMMuHh3q7s7mIw0XxvM7s8/fxxY0I
 LQvLMQ8erYsC7xLgKHxPYxIJXIuAqKkrmMDQEIZe24STGUnisW7qgjHQJhXsjcz1xfqF
 dWPpBe/V1numGlAQs2vltGjGsCMWnPr5lTqYYhg38FVNicJ8P+sdKI0OnQL/Cg59cI30 Gg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2u0f8qsdye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Jul 2019 19:00:51 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6TIw4m4041359;
 Mon, 29 Jul 2019 19:00:50 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2u0ee4d4eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Jul 2019 19:00:50 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6TJ0g7R012209;
 Mon, 29 Jul 2019 19:00:43 GMT
Received: from [192.168.1.222] (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 29 Jul 2019 12:00:42 -0700
To: Li Wang <liwang@redhat.com>, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
References: <CAEemH2dMW6oh6Bbm=yqUADF+mDhuQgFTTGYftB+xAhqqdYV3Ng@mail.gmail.com>
From: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <47999e20-ccbe-deda-c960-473db5b56ea0@oracle.com>
Date: Mon, 29 Jul 2019 12:00:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2dMW6oh6Bbm=yqUADF+mDhuQgFTTGYftB+xAhqqdYV3Ng@mail.gmail.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9333
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1907290207
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9333
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1907290207
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=5BMM_Bug=3F=5D_mmap=28=29_triggers_SIGBUS_while?=
 =?utf-8?b?IGRvaW5nIHRoZeKAiyDigItudW1hX21vdmVfcGFnZXMoKSBmb3Igb2ZmbGlu?=
 =?utf-8?q?ed_hugepage_in_background?=
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
Cc: Linux-MM <linux-mm@kvack.org>, mhocko@kernel.org,
 LTP List <ltp@lists.linux.it>, xishi.qiuxishi@alibaba-inc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 7/28/19 10:17 PM, Li Wang wrote:
> Hi Naoya and Linux-MMers,
> 
> The LTP/move_page12 V2 triggers SIGBUS in the kernel-v5.2.3 testing.
> https://github.com/wangli5665/ltp/blob/master/testcases/kernel/syscalls/move_pages/move_pages12.c
> 
> It seems like the retry mmap() triggers SIGBUS while doing thenuma_move_pages() in background. That is very similar to the kernelbug which was mentioned by commit 6bc9b56433b76e40d(mm: fix race onsoft-offlining ): A race condition between soft offline andhugetlb_fault which causes unexpected process SIGBUS killing.
> 
> I'm not sure if that below patch is making sene to memory-failures.c, but after building a new kernel-5.2.3 with this change, the problem can NOT be reproduced. 
> 
> Any comments?

Something seems strange.  I can not reproduce with unmodified 5.2.3

[root@f23d move_pages]# uname -r
5.2.3
[root@f23d move_pages]# PATH=$PATH:$PWD ./move_pages12
tst_test.c:1096: INFO: Timeout per run is 0h 05m 00s
move_pages12.c:201: INFO: Free RAM 6725424 kB
move_pages12.c:219: INFO: Increasing 2048kB hugepages pool on node 0 to 4
move_pages12.c:229: INFO: Increasing 2048kB hugepages pool on node 1 to 4
move_pages12.c:145: INFO: Allocating and freeing 4 hugepages on node 0
move_pages12.c:145: INFO: Allocating and freeing 4 hugepages on node 1
move_pages12.c:135: PASS: Bug not reproduced

Summary:
passed   1
failed   0
skipped  0
warnings 0

Also, the soft_offline_huge_page() code should not come into play with
this specific test.
-- 
Mike Kravetz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
