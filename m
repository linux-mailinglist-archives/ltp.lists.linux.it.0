Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 868CD7B74C
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 02:44:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 41B783C1D02
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 02:44:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 4AE963C18FE
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 02:44:47 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9A5666008D0
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 02:44:48 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6V0iVaN108615;
 Wed, 31 Jul 2019 00:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=k6ekATruC6j87E/vcYZ9wuBsE4DGKdcSaK/xyWq6FlE=;
 b=pQJ+lKldoKlG2Ffa3L3CgrQXTumrWsyML3443xlQeqdOsuy5EjXKWXsHzGfuU2C3baZt
 tzKmj/2mzu1LqvhJ+CahWFznmTkyQi1WJnyIQvlfdIp+VsFZaIvBUkIT7Bc1c5Qwg2Lw
 R9R8mC4kwAQOU5iMO6zJI/51zhq2bFEQgqkFpduLxxU8xcGVzw49mtqj5GLZRPVOaPfB
 eAx55LwLYI9GbsZYhFHDTCqgwgIHlSB6HGA2+UTagKwXXhhI0CdZD8izayQqW9QyY/mi
 tWF6Y+40P+HDqBt/H+A7s+RwMYdN5EGX31AJclz4vWr40nUsoX56R1tyWqBr1VEGdhlx sg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2u0ejphpmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Jul 2019 00:44:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6V0gaPY095554;
 Wed, 31 Jul 2019 00:44:30 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2u2jp4hj1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Jul 2019 00:44:30 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x6V0iNAI000800;
 Wed, 31 Jul 2019 00:44:23 GMT
Received: from [192.168.1.222] (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 30 Jul 2019 17:44:23 -0700
To: Li Wang <liwang@redhat.com>
References: <CAEemH2dMW6oh6Bbm=yqUADF+mDhuQgFTTGYftB+xAhqqdYV3Ng@mail.gmail.com>
 <47999e20-ccbe-deda-c960-473db5b56ea0@oracle.com>
 <CAEemH2d=vEfppCbCgVoGdHed2kuY3GWnZGhymYT1rnxjoWNdcQ@mail.gmail.com>
From: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <a65e748b-7297-8547-c18d-9fb07202d5a0@oracle.com>
Date: Tue, 30 Jul 2019 17:44:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2d=vEfppCbCgVoGdHed2kuY3GWnZGhymYT1rnxjoWNdcQ@mail.gmail.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9334
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1907310005
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9334
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1907310005
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
Cc: xishi.qiuxishi@alibaba-inc.com, mhocko@kernel.org,
 Linux-MM <linux-mm@kvack.org>, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 7/29/19 11:29 PM, Li Wang wrote:
> It's not 100% reproducible, I tried ten times only hit 4~6 times fail.
> 
> Did you try the test case with patch V3(in my branch)?
> https://github.com/wangli5665/ltp/commit/198fca89870c1b807a01b27bb1d2ec6e2af1c7b6
> 

My bad!  I was using an old version of the test without the soft offline
testing.

> # git clone https://github.com/wangli5665/ltp ltp.wangli --depth=1
> # cd ltp.wangli/; make autotools;
> # ./configure ; make -j24
> # cd testcases/kernel/syscalls/move_pages/
> # ./move_pages12 
> tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
> move_pages12.c:249: INFO: Free RAM 64386300 kB
> move_pages12.c:267: INFO: Increasing 2048kB hugepages pool on node 0 to 4
> move_pages12.c:277: INFO: Increasing 2048kB hugepages pool on node 1 to 4
> move_pages12.c:193: INFO: Allocating and freeing 4 hugepages on node 0
> move_pages12.c:193: INFO: Allocating and freeing 4 hugepages on node 1
> move_pages12.c:183: PASS: Bug not reproduced
> tst_test.c:1145: BROK: Test killed by SIGBUS!
> move_pages12.c:117: FAIL: move_pages failed: ESRCH

Yes, I can recreate.

When I see this failure, the SIGBUS is the result of a huge page allocation
failure.  The allocation was in response to a page fault.

Note that running the test will deplete memory of the system as huge pages
are marked 'poisoned' and can not be reused.  So, each run of the test will
take additional memory offline.

A SIGBUS is the normal behavior for a hugetlb page fault failure due to
lack of huge pages.  Ugly, but that is the design.  I do not believe this
test should not be experiencing this due to reservations taken at mmap
time.  However, the test is combining faults, soft offline and page
migrations, so the there are lots of moving parts.

I'll continue to investigate.

Naoya may have more context as he contributed to both the kernel code and
the testcase.
-- 
Mike Kravetz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
