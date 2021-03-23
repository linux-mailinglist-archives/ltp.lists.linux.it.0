Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A713459A5
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 09:26:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE56C3C32F8
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 09:26:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 0FA143C283D
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 08:19:10 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1414E1000A40
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 08:19:09 +0100 (CET)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12N746L1081321; Tue, 23 Mar 2021 03:19:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=KSYnCQdS6q7O7N4/z4Kwi4bzj+K3/4Rl2riPX4w+PSQ=;
 b=SsHkqlTHqHg7Xr4TNDwE7TWCzmR78bRXUwr0+TsqIOzY5PfJYuyfmUHlJnFhBo2YqNJL
 rCz0X7rkDspLbW2afi5RSKyIwfuLN0OaqwspghOlkW3gHSzTAo9lTO0sHA72R2aMwbi0
 xLIBv/n78BS2L4OgW/zuVGqnVafW5ml5PqA2Wk3JKLnvv0YlOhgT5sBvBV+zH4710rrl
 P9QurG8FgyeFJHDoMJpp70lP8UAb4Jbncw/nYSFEfQr01vXUHKKFCfbDQaVEnm29NGAY
 vv6QyvfgjeppdBmS1HJq0e9tSsiP564lCmgau4+yy0d4VonnwMBKnt32dkMtoUr5C1tc Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37e03fqck5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 03:19:06 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12N73ngJ079663;
 Tue, 23 Mar 2021 03:19:05 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37e03fqcj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 03:19:05 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12N72uPl032311;
 Tue, 23 Mar 2021 07:11:45 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 37d99rb2tj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 07:11:45 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12N7BOtv35258708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 07:11:24 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9325B42045;
 Tue, 23 Mar 2021 07:11:42 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D0714203F;
 Tue, 23 Mar 2021 07:11:42 +0000 (GMT)
Received: from osiris (unknown [9.171.52.23])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 23 Mar 2021 07:11:42 +0000 (GMT)
Date: Tue, 23 Mar 2021 08:11:41 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <YFmUrVOyX4q+8Dy9@osiris>
References: <CAEemH2cELFSMzEYM-Gd1LxNuFzVE2PcG1chzyaVhW2YCJjjzdw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cELFSMzEYM-Gd1LxNuFzVE2PcG1chzyaVhW2YCJjjzdw@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-23_02:2021-03-22,
 2021-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=818 malwarescore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103230044
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 23 Mar 2021 09:26:17 +0100
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

On Tue, Mar 23, 2021 at 02:21:52PM +0800, Li Wang wrote:
> Hi linux-s390 experts,
> 
> We observed that LTP/clock_gettime04 always FAIL on s390x with
> kernel-v5.12-rc3.
> To simply show the problem, I rewrite the LTP reproducer as a simple C
> below.
> Maybe it's a new bug introduced from the kernel-5.12 series branch?
> 
> PASS:
> ------------
> # uname -r
> 5.11.0-*.s390x
> 
> # grep TIME_NS /boot/config-5.11.0-*.s390x
> no TIME_NS enabled
> 
> ## ./test-timer
> vdso_ts_nsec = 898169901815, vdso_ts.tv_sec = 898, vdso_ts.tv_nsec =
> 169901815
> sys_ts_nsec  = 898169904269, sys_ts.tv_sec  = 898, sys_ts.tv_nsec  =
> 169904269
> ===> PASS
> 
> FAIL:
> ----------
> # uname -r
> 5.12.0-0.rc3.*.s390x
> 
> # grep TIME_NS /boot/config-5.12.0-0.rc3.s390x
> CONFIG_TIME_NS=y
> CONFIG_GENERIC_VDSO_TIME_NS=y
> 
> # ./test-timer
> vdso_ts_nsec = 4484351380985507, vdso_ts.tv_sec = 4484351, vdso_ts.tv_nsec
> = 380985507
> sys_ts_nsec  = 1446923235377, sys_ts.tv_sec  = 1446, sys_ts.tv_nsec  =
> 923235377
> ===> FAIL

Thanks for reporting!

I'll look later today into this. I would nearly bet that I broke it
with commit f8d8977a3d97 ("s390/time: convert tod_clock_base to
union")

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
