Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E4142255ECF
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 18:32:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 87CA03C136A
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 18:32:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 7195A3C136A
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 18:32:47 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9444960090F
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 18:32:46 +0200 (CEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07SG41Rj051117; Fri, 28 Aug 2020 12:32:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=eJvX8FkjBX1qWT2SLgwzDW+VozE9SArA1jZdMdzgDGs=;
 b=drlFedvFmezUjZ9qioS8KGkuAlSMFQvXg9ZVd6uq7H5v+xuuVtbDM89LeTMm8NUIqGDN
 KrpiJOJQh81y3NU+R58EkD9QtclcU1hkmwQRMVA78KP8KDdQXk1MF0BieSGAkGpgHveY
 SZkfCWbi8rdl88r9U9ekSlhzqq3jFDLKgiEB2EengJ1PDSncjDgRuqEg6bEix3QagKyB
 7o2HwlbtzpSVxGnAap8bg/ktJMagEYrV+iK+Dw//qyF2002QlmRD+E+IszDPdn5El5mh
 5jbQfjycJsgDFQFFKXOZVqoDeYJ3s+yzRGTO/6EgNQ2eNaJA7O1g4SzYTu1T5oYmIcjR jA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3374xqs09c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Aug 2020 12:32:35 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07SG4CiD052895;
 Fri, 28 Aug 2020 12:32:35 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3374xqs084-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Aug 2020 12:32:34 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07SGRFGU026962;
 Fri, 28 Aug 2020 16:32:32 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 336124sxj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Aug 2020 16:32:32 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07SGWU3Y31195416
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Aug 2020 16:32:30 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3ABE0A404D;
 Fri, 28 Aug 2020 16:32:30 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D30DA4040;
 Fri, 28 Aug 2020 16:32:28 +0000 (GMT)
Received: from sig-9-65-214-13.ibm.com (unknown [9.65.214.13])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 28 Aug 2020 16:32:28 +0000 (GMT)
Message-ID: <67e8920833abf5f1b77fa59e90bdee3d4eb9262d.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it, Cyril Hrubis
 <chrubis@suse.cz>, Li Wang <liwang@redhat.com>, Jan Stancek
 <jstancek@redhat.com>, Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Date: Fri, 28 Aug 2020 12:32:27 -0400
In-Reply-To: <20200828132825.GA12601@x230>
References: <20200820090824.3033-1-pvorel@suse.cz>
 <20200820090824.3033-4-pvorel@suse.cz> <20200828131856.GA29915@dell5510>
 <20200828132825.GA12601@x230>
X-Mailer: Evolution 3.28.5 (3.28.5-12.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-28_11:2020-08-28,
 2020-08-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1011 spamscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008280118
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [LTP v4 3/5] IMA: Refactor datafiles directory
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
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Mimi Zohar <zohar@linux.vnet.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, 2020-08-28 at 15:28 +0200, Petr Vorel wrote:
> Hi,
> 
> > > +SUBDIRS	:= ima_*
> I guess this could fix it:
> SUBDIRS	:= $(shell ls ima_*) 

Other LTP makefiles are using "wildcard".  Like this - $(wildcard
ima_*/)?

Mimi
> 
> I'm surprised that glob does not work on SUBDIRS.
> 
> > It looks this broke build on out-of-tree build:
> > https://travis-ci.org/github/linux-test-project/ltp/builds/722003659
> > https://travis-ci.org/github/linux-test-project/ltp/jobs/722003661
> > https://travis-ci.org/github/linux-test-project/ltp/jobs/722003662
> > https://travis-ci.org/github/linux-test-project/ltp/jobs/722003663
> > ...
> 
> Kind regards,
> Petr



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
