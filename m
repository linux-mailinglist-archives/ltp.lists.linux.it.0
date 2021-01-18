Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBC12FA273
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 15:05:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9254D3C30BD
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 15:05:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E65713C0737
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 15:05:09 +0100 (CET)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C38036008A9
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 15:05:08 +0100 (CET)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10IE2nd3154424
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 09:05:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : cc :
 subject : in-reply-to : in-reply-to : references : date : message-id :
 mime-version : content-type; s=pp1;
 bh=wShYcz93O6A8MJ3T0tJmBHZqpU8H5i4nYzIzM7xyyEg=;
 b=dUBe0Lksigd1Oy0mSJ3/6dW5kHCt5oYGUzIsd9Ympr7iIP3pE1fPb+bVIUVPCSpEXEqC
 +9BjCyVp4A07fUt1L/MI2h0CKWkqvdWiVtAcU5rgr/6WH4YXuWrlpd5XNMtx8aDJXoGp
 WnPE7inHLLBW7bA2EpzF6cMciP5tl+MPi8J6/w0HhALg5Lem5y67qdrqwvPj3Ap/9Mox
 ACji8Veo+DyhaAFiMlmdYZyVF2YGMXJBGe3xVIWUBcqT2/y0iymV8QBcb8Z78GKIgJG9
 7J8NyUY/CmaMYa0oQeN8QkqHZdhFdT5pRzfMzNOCJjeyKZ4VzjzhYWE+ooAwQB7vYSat 1g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 365asphr5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 09:05:06 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10IE2pH8154516
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 09:05:03 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 365asphqu9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jan 2021 09:04:59 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10IE4IAn013188;
 Mon, 18 Jan 2021 14:04:37 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 363qs7j47j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jan 2021 14:04:37 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10IE4ZWb41091526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Jan 2021 14:04:35 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12C8911C050;
 Mon, 18 Jan 2021 14:04:35 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBD7111C04C;
 Mon, 18 Jan 2021 14:04:34 +0000 (GMT)
Received: from oc8242746057.ibm.com (unknown [9.171.47.54])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 18 Jan 2021 14:04:34 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: Li Wang <liwang@redhat.com>
In-Reply-To: <CAEemH2fDzPp3D6KZ_G0UDbS=eh2tWDAcy7CTt_4Yw7FUT4zGxg@mail.gmail.com>
In-Reply-To: 
References: <20210115143246.369676-1-egorenar@linux.ibm.com>
 <CAEemH2fDzPp3D6KZ_G0UDbS=eh2tWDAcy7CTt_4Yw7FUT4zGxg@mail.gmail.com>
Date: Mon, 18 Jan 2021 15:04:34 +0100
Message-ID: <87lfcqjq8d.fsf@oc8242746057.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-18_11:2021-01-18,
 2021-01-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 phishscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101180085
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] swapping01: make test more robust
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
Cc: , LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Li Wang <liwang@redhat.com> writes:

>
> Looking at the memory status from the output, it only detects available
> memory 7318MB in the fourth time (< 7348MB, second/third time).
> But memory heavy swapped in the third and fourth time(7323MB, 7322MB
> swapped).
>
> Obviously, the last two tests influenced by the first-three running.
>
> How reproducible of this FAIL? And, Could you help verify whether the
> following cleanup works?
> (Also, provide /proc/meminfo or kernel version will help to locate the
> issues).
>
> --- a/testcases/kernel/mem/swapping/swapping01.c
> +++ b/testcases/kernel/mem/swapping/swapping01.c
> @@ -81,6 +81,7 @@ static void test_swapping(void)
>
>  static void init_meminfo(void)
>  {
> +       SAFE_FILE_PRINTF("/proc/sys/vm/drop_caches", "3");
>         swap_free_init = SAFE_READ_MEMINFO("SwapFree:");
>         if (FILE_LINES_SCANF("/proc/meminfo", "MemAvailable: %ld",
>                 &mem_available_init)) {
>

Thanks for looking into it.
I usually need no more than 100 iterations to reproduce a FAIL, but on
our CI system it frequently fails immediately, that's why i started
tweaking the test.

Output from today's CI:
      tst_test.c:1248: TINFO: Timeout per run is 0h 05m 00s
      swapping01.c:106: TINFO: available physical memory: 5472 MB
      swapping01.c:109: TINFO: try to allocate: 7114 MB
      swapping01.c:112: TINFO: memory allocated: 7114 MB
      swapping01.c:143: TFAIL: heavy swapping detected: 5502 MB swapped.

      Summary:
      passed   0
      failed   1
      skipped  0
      warnings 0


With my "fix"" i couldn't reproduce the problem even with more than 1000
iterations but i admit my "fix"" was a lucky shot :(


cat /proc/meminfo

MemTotal:        8172412 kB
MemFree:           87304 kB
MemAvailable:      95244 kB
Buffers:            1392 kB
Cached:            31792 kB
SwapCached:         2052 kB
Active:            21244 kB
Inactive:        6587284 kB
Active(anon):       2956 kB
Inactive(anon):  6581060 kB
Active(file):      18288 kB
Inactive(file):     6224 kB
Unevictable:       19624 kB
Mlocked:           19624 kB
SwapTotal:      25720840 kB
SwapFree:       25531728 kB
Dirty:               136 kB
Writeback:             0 kB
AnonPages:       6596012 kB
Mapped:            31976 kB
Shmem:                16 kB
KReclaimable:     117076 kB
Slab:             284640 kB
SReclaimable:     117076 kB
SUnreclaim:       167564 kB
KernelStack:       10160 kB
PageTables:        17900 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:    29807044 kB
Committed_AS:    9102816 kB
VmallocTotal:   534773760 kB
VmallocUsed:      171424 kB
VmallocChunk:          0 kB
Percpu:           261120 kB
AnonHugePages:   3451904 kB
ShmemHugePages:        0 kB
ShmemPmdMapped:        0 kB
FileHugePages:         0 kB
FilePmdMapped:         0 kB
CmaTotal:              0 kB
CmaFree:               0 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       1024 kB
Hugetlb:               0 kB
DirectMap4k:        6144 kB
DirectMap1M:     2091008 kB
DirectMap2G:     6291456 kB

kernel version:
5.11.0-20210118.rc3.git0.b3a3cbdec55b


I'm going to test your patch today extensively and then report back.

Regards
Alex

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
