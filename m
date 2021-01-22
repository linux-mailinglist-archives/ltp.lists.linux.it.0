Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E40DC2FFD3A
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Jan 2021 08:17:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A9E5E3C6354
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Jan 2021 08:17:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 05ED13C3025
 for <ltp@lists.linux.it>; Fri, 22 Jan 2021 08:16:57 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0B571600735
 for <ltp@lists.linux.it>; Fri, 22 Jan 2021 08:16:56 +0100 (CET)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10M72WIk168410; Fri, 22 Jan 2021 02:16:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : message-id : from
 : to : cc : cc : subject : in-reply-to : in-reply-to : mime-version :
 content-type : references; s=pp1;
 bh=tjfjvmt4ZJImuwCJtuTCGoEGRfCtN3YLFX9+XEagags=;
 b=U2LpJ9gsJg9T9MWMQcBjVOqdDHJS+sidSLERaHHzEYHeFezUiYTZk0Puo+R38J8/sjRm
 tOkyIJ0IzjuNpBlnS5Fvqm6j8Wb5mKiQ9RBVYWhA6uAeE2yCO9oQERlBoFKfzNKb+C3D
 AZdJRx8PToKa1xeNPyJ/WmxLyYJh0El0Syk7W+RVLMRcE9ZOvH2KQdQULOiVF4l0ZtSv
 Yb6et7RTDGPb3sqvhQYm4IQe57CfYsw96txPXKBwqvtHVdhBfCkI/xuwFk9jP+566yA3
 rj+AAPSC0f1RhKT9OeAzv/CDAuXGV/anJO5Z37D2h9+FcVgSjEZmVGfiugeu2CEskCpc uQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 367rmpjbqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 02:16:53 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10M72qYR173547;
 Fri, 22 Jan 2021 02:16:53 -0500
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 367rmpjbpm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 02:16:53 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10M73X3w021666;
 Fri, 22 Jan 2021 07:16:51 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 367k0v05ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 07:16:50 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10M7GmZY30015814
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 07:16:48 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92EAD11C058;
 Fri, 22 Jan 2021 07:16:48 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FADB11C050;
 Fri, 22 Jan 2021 07:16:48 +0000 (GMT)
Received: from oc8242746057.ibm.com (unknown [9.171.79.240])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 22 Jan 2021 07:16:48 +0000 (GMT)
Date: Fri, 22 Jan 2021 08:16:47 +0100
Message-Id: <8735ytzbj4.fsf@oc8242746057.ibm.com>
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: Petr Vorel <pvorel@suse.cz>
In-Reply-To: <YAgmPjaf8iRn20x2@pevik>
In-Reply-To: 
MIME-Version: 1.0
References: <20210115143246.369676-1-egorenar@linux.ibm.com>
 <CAEemH2fDzPp3D6KZ_G0UDbS=eh2tWDAcy7CTt_4Yw7FUT4zGxg@mail.gmail.com>
 <87zh14rrxm.fsf@oc8242746057.ibm.com> <YAgmPjaf8iRn20x2@pevik>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-22_02:2021-01-21,
 2021-01-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 clxscore=1011 bulkscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101220034
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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

Hi Petr,
Date: Fri, 22 Jan 2021 08:16:41 +0100
Message-ID: <874kj9zbja.fsf@oc8242746057.ibm.com>
X-Trend-IP-HD: ip=[9.171.79.240]sender=(egorenar@linux.ibm.com)recipient=<ltp@lists.linux.it;liwang@redhat.com;pvorel@suse.cz>

Petr Vorel <pvorel@suse.cz> writes:

> Hi Alexander, Li,
>
> First I found quite hard to have correct setup to avoid TCONF "Not enough swap
> space to test". It often requires to add additional swap file via mkswap && swapon
> and use some RAM with:
>
> dd if=/dev/zero of=/dev/shm/fill bs=1k count=14024k
>
> It'd be great if test could do required setup itself.
> And it'd also help at least to print swap_free_init and mem_over_max in that TCONF:
>
>         if (swap_free_init < mem_over_max)
> -               tst_brk(TCONF, "Not enough swap space to test.");
> +               tst_brk(TCONF, "Not enough swap space to test (%ld < %ld)", swap_free_init, mem_over_max);
>

yeah, that was a problem for me too when i was new to this test :/


>
> I tried to debug swapping01 on s390x (without this patch) with using additional
> swap and eat RAM with dd. and got bus error (core dumped). Is that due too
> aggressive memory eating? I'm not able to crash it on intel arch.
>

that's something new for me. If possible please run it in gdb with debug symbols
to find out where exactly this signal is raised.

Regards
Alex

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
