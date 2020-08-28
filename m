Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86704255DAE
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 17:21:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D6333C55ED
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 17:21:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 6D7F23C25A9
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 17:21:30 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 975ED1000A18
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 17:21:29 +0200 (CEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07SFGXxX087777; Fri, 28 Aug 2020 11:21:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=yicidRyoJZ1fhRB5cX7JDTm2M+VljN1Fr8mAUNnnRRU=;
 b=HCsGMJXCA8HyN6HRw1QGLKGwnFanAsLoZuAa0OHqXwJpt3tOC81qC5V8C7SgCm5ssUrg
 K0tTZ6oit+QSjZHwy+e2oTUgaStw/L2Xab2OGeRkG4agIvdAhE5V+xeVOdqbazutS6eJ
 yXFkCiLOSBTvKERfNaWzFREE/vgLH5T5I3ZTjOjF4ZWVC9FY062KwhNHIyW4z+pS9t6G
 SJ1JIKOFQ3c0yYSZVrDoYRHUzRZZDRvhSMf5JsbyaYAKhIY3Unxt7jCZXjkFenTwn1+p
 NEvOUYRLwycclUTPJxRhzUSMb58jzq5UPYf4XNw5BsR7Z/GUMefIXowmLBVk4R73DstD PA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3374e3g2hu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Aug 2020 11:21:26 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07SFDNnA005750;
 Fri, 28 Aug 2020 15:21:24 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 336buh19wh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Aug 2020 15:21:24 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07SFLLnE28705154
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Aug 2020 15:21:22 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCD0C42045;
 Fri, 28 Aug 2020 15:21:21 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41DA84203F;
 Fri, 28 Aug 2020 15:21:20 +0000 (GMT)
Received: from sig-9-65-214-13.ibm.com (unknown [9.65.214.13])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 28 Aug 2020 15:21:20 +0000 (GMT)
Message-ID: <889c90c2777e2683749ab6d339e25aa85b192407.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Fri, 28 Aug 2020 11:21:19 -0400
In-Reply-To: <20200828124924.GB15355@dell5510>
References: <20200820090824.3033-1-pvorel@suse.cz>
 <20200820090824.3033-5-pvorel@suse.cz>
 <b58057275ecdc06bb512d39ea46118197f33c33f.camel@linux.ibm.com>
 <20200827132354.GA20439@dell5510> <20200827135503.GA11990@dell5510>
 <b72657042d13f9b8f30d5bdea7e2d06835e4a1d1.camel@linux.ibm.com>
 <20200827225417.GA29921@dell5510>
 <d6087ee43d18605ee6cdc6b80450b0024af14fb6.camel@linux.ibm.com>
 <20200828060554.GB15251@dell5510>
 <3c720a7060a846088f8e60ce8b5c032467e97f23.camel@linux.ibm.com>
 <20200828124924.GB15355@dell5510>
X-Mailer: Evolution 3.28.5 (3.28.5-12.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-28_09:2020-08-28,
 2020-08-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 mlxlogscore=600 suspectscore=4 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008280112
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [LTP v4 4/5] IMA: Add a test to verify measurement of
 certificate imported into a keyring
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
 Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, 2020-08-28 at 14:49 +0200, Petr Vorel wrote:
> > On Fri, 2020-08-28 at 08:05 +0200, Petr Vorel wrote:
> > > BTW there are also plans for reboot support [1] [2], that could be used as
> > > workaround for configuration without CONFIG_IMA_READ_POLICY=y and
> > > CONFIG_IMA_WRITE_POLICY=y.
> > The reboot support could also be used for carrying the IMA measurement
> > list across kexec and verifying the TPM PCRs.

> Adding into my TODO list. I'd just run whole test ima_kexec.sh twice and reboot
> in between.

The ima_kexec.sh tests measures the kexec boot cmdline and kernel
image.   What's needed is walking the measurement list re-calculating
the PCRs and then verifying them against the actual TPM PCRs.  Maybe
running the ima_tpm.sh test twice.

Mimi


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
