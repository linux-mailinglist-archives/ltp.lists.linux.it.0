Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 50837349227
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 13:38:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 16D2B3C5F34
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 13:38:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 186DA3C2863
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 13:38:26 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B293920099B
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 13:38:24 +0100 (CET)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12PCXXpx028949; Thu, 25 Mar 2021 08:38:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=znxeZ+KHsoOXlMx9IYGqvKSW2L0sty8CU/iSheoaFzg=;
 b=HkLl9adxDnbR5Uo4Od8zWWZO7XI8nA9u+kR0mnDNvpZ0wgWBzNdH7gcrn+MGFsRS18Ya
 2HCfMQ66SA+ZJ/AtYR3MAGDziu9MbKUdi/ey708uWYfWzfkuTs81lWyY1KI0nlb+FaHJ
 o2eZsloX1a9bGCcBsViw0o4yMIPfIUAJzD4WYPueSBxe6dbqaTMGxm3RT1QlUXInKA3W
 mYNJ9ZoI43BffdwFoT+cGf1Mv4LrGsiLCYF/Y+jlVGfVmFQHjK4yRG/8uMggbuBIAxHa
 qz+Cqzca8b1tH5z1XDL84ZGEmBAIvDooffFc6tCCmPzGASrJI+M5QOALuaIv/8BXHwBi uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37ghp0wrxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 08:38:12 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12PCYeJl034342;
 Thu, 25 Mar 2021 08:38:12 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37ghp0wrx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 08:38:12 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12PCRUkM008720;
 Thu, 25 Mar 2021 12:33:10 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 37d9bmnbky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 12:33:10 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12PCX7o846858504
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 12:33:07 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A9EA11C04C;
 Thu, 25 Mar 2021 12:33:07 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A43E11C04A;
 Thu, 25 Mar 2021 12:33:07 +0000 (GMT)
Received: from osiris (unknown [9.171.42.197])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 25 Mar 2021 12:33:06 +0000 (GMT)
Date: Thu, 25 Mar 2021 13:33:05 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <YFyDARFZZUCG5LGc@osiris>
References: <YFmUrVOyX4q+8Dy9@osiris>
 <20210323215819.4161164-1-hca@linux.ibm.com>
 <CAEemH2cSk=doHL51uD5Qu6uCRRTCgYd0EN0iij=X+538J53XsQ@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAEemH2cSk=doHL51uD5Qu6uCRRTCgYd0EN0iij=X+538J53XsQ@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_03:2021-03-24,
 2021-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=962
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103250093
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] s390 vdso fixes
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
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Mar 25, 2021 at 04:56:18PM +0800, Li Wang wrote:
> Hi Heiko,
> 
> On Wed, Mar 24, 2021 at 5:58 AM Heiko Carstens <hca@linux.ibm.com> wrote:
> 
> > Li Wang reported that clock_gettime(CLOCK_MONOTONIC_RAW, ...) does not
> > work correctly on s390 via vdso. Debugging this also revealed an
> > unrelated bug (first patch).
> >
> > The second patch fixes the problem: the tod clock steering parameters
> > required by __arch_get_hw_counter() are only present within the first
> > element of the _vdso_data array and not at all within the _timens_data
> > array.
> >
> > Instead of working around this simply provide an s390 specific vdso
> > data page which contains the tod clock steering parameters.
> >
> > This allows also to remove ARCH_HAS_VDSO_DATA again.
> >
> > Heiko Carstens (3):
> >   s390/vdso: fix tod clock steering
> >   s390/vdso: fix arch_data access for __arch_get_hw_counter()
> >   lib/vdso: remove struct arch_vdso_data from vdso data struct
> >
> 
> Thanks for the quick fix! I confirmed these patches work for me.
> (tested with latest mainline kernel v5.12-rc4)
> 
> Tested-by: Li Wang <liwang@redhat.com>

Thanks a lot for confirming! However I decided to go with the simple variant:
https://lore.kernel.org/linux-s390/YFnxr1ZlMIOIqjfq@osiris/T/#m26f94fd8ac048421a4a8870e7259a09f97840a3e

May I add your Tested-by there as well?

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
