Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B752FCB74
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 08:25:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 35C1A3C5F8F
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 08:25:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id C56CD3C30D5
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 08:25:19 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B4B4D600A55
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 08:25:18 +0100 (CET)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10K72PHH069936
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 02:25:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : cc :
 subject : in-reply-to : in-reply-to : references : date : message-id :
 mime-version : content-type; s=pp1;
 bh=HrTAD7inBr6ZDYY1fpdFDL5tshXxlHVX/UnocuKhuLU=;
 b=E/gpla5Hyp0nXQvwQfhSD71X5xiPDE8TGjquG2q6IJEMtVYZ3Qyi4FuP1ocgKM2iOOEW
 KMnoJzZBfSl3lOYMdawDXwTPNy0FDkesvAdzXPqr8S+i6b5fJCTrj+dD15E7j4f7a4O2
 y9HOA5/qDbKstBXf1qngyU7TfjJyAfMrVJ+4IRXpl4SBmzjNoNGfjj2m5GrUO/E4G+ds
 60VoRo1TpEVdPtIA8HFDFWE7L+2nlNcYBUS+DNnWBJ192wWOuYf4FOv8TMcvW+QCvTu6
 71/HKpX23eyx6UhXqIQa36Dx7KcpxR17VXwQyp/b5wPFcL8vrHEMt6gkkW5AMUy3+DXB Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 366dfq41fb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 02:25:15 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10K72bgP070966
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 02:25:15 -0500
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 366dfq41e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 02:25:15 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10K77v5A016129;
 Wed, 20 Jan 2021 07:25:12 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 3668p785b8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 07:25:12 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 10K7P4pF20513152
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 07:25:04 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74707AE045;
 Wed, 20 Jan 2021 07:25:10 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37415AE056;
 Wed, 20 Jan 2021 07:25:10 +0000 (GMT)
Received: from oc8242746057.ibm.com (unknown [9.171.62.77])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 20 Jan 2021 07:25:10 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: Li Wang <liwang@redhat.com>
In-Reply-To: <CAEemH2fDzPp3D6KZ_G0UDbS=eh2tWDAcy7CTt_4Yw7FUT4zGxg@mail.gmail.com>
In-Reply-To: 
References: <20210115143246.369676-1-egorenar@linux.ibm.com>
 <CAEemH2fDzPp3D6KZ_G0UDbS=eh2tWDAcy7CTt_4Yw7FUT4zGxg@mail.gmail.com>
Date: Wed, 20 Jan 2021 08:25:09 +0100
Message-ID: <87zh14rrxm.fsf@oc8242746057.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-20_02:2021-01-18,
 2021-01-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101200038
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

> Hi Alexander,
>
> Alexander Egorenkov <egorenar@linux.ibm.com> wrote:
>
>> ...
>> swapping01.c:106: TINFO: available physical memory:* 7348 MB*
>> swapping01.c:109: TINFO: try to allocate: 9552 MB
>> swapping01.c:112: TINFO: memory allocated: 9552 MB
>> swapping01.c:140: TINFO: swap free init: 25019 MB
>> swapping01.c:141: TINFO: swap free now: 20484 MB
>> swapping01.c:149: TPASS: no heavy swapping detected, *4534 MB swapped.*
>> ...
>> swapping01.c:106: TINFO: available physical memory:* 7318 MB*
>> swapping01.c:109: TINFO: try to allocate: 9514 MB
>> swapping01.c:112: TINFO: memory allocated: 9514 MB
>> swapping01.c:140: TINFO: swap free init: 25019 MB
>> swapping01.c:141: TINFO: swap free now: 17697 MB
>> swapping01.c:145: TFAIL: heavy swapping detected:* 7322 MB swapped.*
>>
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
> -- 
> Regards,
> Li Wang
>
>     This Message Is From an External Sender         
>     This message came from outside your organization.         
> Hi Alexander,
>
> Alexander Egorenkov <egorenar@linux.ibm.com> wrote:
>
>  ...
>  swapping01.c:106: TINFO: available physical memory: 7348 MB
>  swapping01.c:109: TINFO: try to allocate: 9552 MB
>  swapping01.c:112: TINFO: memory allocated: 9552 MB
>  swapping01.c:140: TINFO: swap free init: 25019 MB
>  swapping01.c:141: TINFO: swap free now: 20484 MB
>  swapping01.c:149: TPASS: no heavy swapping detected, 4534 MB swapped.
>  ...
>  swapping01.c:106: TINFO: available physical memory: 7318 MB
>  swapping01.c:109: TINFO: try to allocate: 9514 MB
>  swapping01.c:112: TINFO: memory allocated: 9514 MB
>  swapping01.c:140: TINFO: swap free init: 25019 MB
>  swapping01.c:141: TINFO: swap free now: 17697 MB
>  swapping01.c:145: TFAIL: heavy swapping detected: 7322 MB swapped.
>
> Looking at the memory status from the output, it only detects available
> memory 7318MB in the fourth time (< 7348MB, second/third time).
> But memory heavy swapped in the third and fourth time(7323MB, 7322MB swapped).
>
> Obviously, the last two tests influenced by the first-three running. 
>
> How reproducible of this FAIL? And, Could you help verify whether the following cleanup works?
> (Also, provide /proc/meminfo or kernel version will help to locate the issues).
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
> -- 
> Regards,
> Li Wang


Hi,

i did more tests as promised.
Your patch didn't help :( Still seeing failures.

With your patch:
----------------
swapping01.c:148: TPASS: no heavy swapping detected, 7282 MB swapped.
swapping01.c:107: TINFO: available physical memory: 7303 MB
swapping01.c:110: TINFO: try to allocate: 9494 MB
swapping01.c:113: TINFO: memory allocated: 9494 MB
swapping01.c:148: TPASS: no heavy swapping detected, 6204 MB swapped.
swapping01.c:107: TINFO: available physical memory: 7299 MB
swapping01.c:110: TINFO: try to allocate: 9488 MB
swapping01.c:113: TINFO: memory allocated: 9488 MB
swapping01.c:144: TFAIL: heavy swapping detected: 9490 MB swapped.

Summary:
passed   27
failed   1
skipped  0
warnings 0


W/O your patch:
---------------
swapping01.c:147: TPASS: no heavy swapping detected, 2229 MB swapped.
swapping01.c:106: TINFO: available physical memory: 7311 MB
swapping01.c:109: TINFO: try to allocate: 9504 MB
swapping01.c:112: TINFO: memory allocated: 9504 MB
swapping01.c:147: TPASS: no heavy swapping detected, 2249 MB swapped.
swapping01.c:106: TINFO: available physical memory: 7306 MB
swapping01.c:109: TINFO: try to allocate: 9498 MB
swapping01.c:112: TINFO: memory allocated: 9498 MB
swapping01.c:143: TFAIL: heavy swapping detected: 9496 MB swapped.

Summary:
passed   23
failed   1
skipped  0
warnings 0



I can easily reproduce the problem inside an LPAR with 8GB RAM and 20GB
swap. But could *NOT* reproduce it inside a zVM w/o any patches, might be
fluke or some other unknown factors probably.

My patch seems to work very well, couldn't reproduce the problem with it
applied :/ 




cat /proc/meminfo
MemTotal:        8167132 kB
MemFree:         7379376 kB
MemAvailable:    7396252 kB
Buffers:           14952 kB
Cached:            55280 kB
SwapCached:         3772 kB
Active:            42584 kB
Inactive:          58776 kB
Active(anon):       2872 kB
Inactive(anon):    36224 kB
Active(file):      39712 kB
Inactive(file):    22552 kB
Unevictable:       19248 kB
Mlocked:           19248 kB
SwapTotal:      25053176 kB
SwapFree:       24916556 kB
Dirty:                16 kB
Writeback:             0 kB
AnonPages:         48352 kB
Mapped:            33416 kB
Shmem:                16 kB
KReclaimable:      78404 kB
Slab:             195456 kB
SReclaimable:      78404 kB
SUnreclaim:       117052 kB
KernelStack:       12576 kB
PageTables:         4612 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:    29136740 kB
Committed_AS:    1004504 kB
VmallocTotal:   534773760 kB
VmallocUsed:      171464 kB
VmallocChunk:          0 kB
Percpu:           167200 kB
AnonHugePages:     11264 kB
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
DirectMap4k:        5120 kB
DirectMap1M:     4189184 kB
DirectMap2G:     4194304 kB


uname -a
Fedora 33, 5.11.0-20210118.rc3.git0.0bf60767445f.300.fc33.s390x

Regards
Alex

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
