Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 916E5346017
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 14:48:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5231C3C685D
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 14:48:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id AF63E3C2CE9
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 14:48:42 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C8B2B600219
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 14:48:41 +0100 (CET)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12NDXlxp103559; Tue, 23 Mar 2021 09:48:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=xGsb52ZcTBJ7qanx8S8CEfUtuLSMQ6g5bWEbVc8NDJQ=;
 b=Q1fTnkOe2irl9Q7prTv5vz0THKPtjOdHmgQeUW9xS19dFoh8Pu65omW7G1nxXTxhq9D3
 Msm0QiKxBXSfK+uDd8VfrQefXxOlSnfoyeZVKjHktwtk3Y0ScQ1yEi1BMX5cxBxKRp7c
 8y7vWqk9DObzdBdqFLo2OEsoif7K4l6WpxBMBuncWe+EZXn/oYWW97qGf9TrpawhwqG/
 HizB+w0Tnmj2xPOfG2LxGp+tk1tnY7kqg6Vs+2dylGxAc/SNCU0O+X3NKDW4fAZHYeHt
 63XQRW5Et9syEp3udgy6F0EsMxtscn2tpEOQRxTHhz1vnIXIeXYK5WK/NtzrlUCng25U AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37dx4b2ent-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 09:48:38 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12NDY1vP104602;
 Tue, 23 Mar 2021 09:48:38 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37dx4b2emv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 09:48:38 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12NDlJUM019724;
 Tue, 23 Mar 2021 13:48:35 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 37d9bmkd98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 13:48:35 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12NDmFbM36110830
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 13:48:15 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDAB9A4040;
 Tue, 23 Mar 2021 13:48:32 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8642BA405E;
 Tue, 23 Mar 2021 13:48:32 +0000 (GMT)
Received: from osiris (unknown [9.171.54.53])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 23 Mar 2021 13:48:32 +0000 (GMT)
Date: Tue, 23 Mar 2021 14:48:31 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Heiko Carstens <hca@linux.ibm.com>
Message-ID: <YFnxr1ZlMIOIqjfq@osiris>
References: <CAEemH2cELFSMzEYM-Gd1LxNuFzVE2PcG1chzyaVhW2YCJjjzdw@mail.gmail.com>
 <YFmUrVOyX4q+8Dy9@osiris>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFmUrVOyX4q+8Dy9@osiris>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-23_06:2021-03-22,
 2021-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103230100
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [s390x vDSO Bug?] clock_gettime(CLOCK_MONOTONIC_RAW,
 ...) gets abnormal ts value
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Sven Schnelle <svens@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Mar 23, 2021 at 08:11:41AM +0100, Heiko Carstens wrote:
> On Tue, Mar 23, 2021 at 02:21:52PM +0800, Li Wang wrote:
> > Hi linux-s390 experts,
> > 
> > We observed that LTP/clock_gettime04 always FAIL on s390x with
> > kernel-v5.12-rc3.
> > To simply show the problem, I rewrite the LTP reproducer as a simple C
> > below.
> > Maybe it's a new bug introduced from the kernel-5.12 series branch?
> > 
> > PASS:
> > ------------
> > # uname -r
> > 5.11.0-*.s390x
> > 
> > # grep TIME_NS /boot/config-5.11.0-*.s390x
> > no TIME_NS enabled
> > 
> > ## ./test-timer
> > vdso_ts_nsec = 898169901815, vdso_ts.tv_sec = 898, vdso_ts.tv_nsec =
> > 169901815
> > sys_ts_nsec  = 898169904269, sys_ts.tv_sec  = 898, sys_ts.tv_nsec  =
> > 169904269
> > ===> PASS
> > 
> > FAIL:
> > ----------
> > # uname -r
> > 5.12.0-0.rc3.*.s390x
> > 
> > # grep TIME_NS /boot/config-5.12.0-0.rc3.s390x
> > CONFIG_TIME_NS=y
> > CONFIG_GENERIC_VDSO_TIME_NS=y
> > 
> > # ./test-timer
> > vdso_ts_nsec = 4484351380985507, vdso_ts.tv_sec = 4484351, vdso_ts.tv_nsec
> > = 380985507
> > sys_ts_nsec  = 1446923235377, sys_ts.tv_sec  = 1446, sys_ts.tv_nsec  =
> > 923235377
> > ===> FAIL
> 
> Thanks for reporting!
> 
> I'll look later today into this. I would nearly bet that I broke it
> with commit f8d8977a3d97 ("s390/time: convert tod_clock_base to
> union")

So, I broke it with commit 1ba2d6c0fd4e ("s390/vdso: simplify
__arch_get_hw_counter()"). Reverting that patch will fix it for non
time namespace processes only.

The problem is that the vdso data page contains an array of struct
vdso_data's for each clock source. However only the first member of
that array contains a/the valid struct arch_vdso_data, which is
required for __arch_get_hw_counter(). Which alone is a bit odd...

However for a process which is within a time namespace there is no
(easy) way to access that page (the time namespace specific vdso data
page does not contain valid arch_vdso_data). I guess the real fix is
to simply map yet another page into the vvar mapping and put the
arch_data there. What a mess... :/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
