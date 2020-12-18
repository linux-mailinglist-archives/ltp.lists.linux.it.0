Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2A82DE273
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 13:12:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D2DD23C6174
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 13:12:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 4227A3C29E0
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 13:12:03 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A2B0810011D1
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 13:12:02 +0100 (CET)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BIC3QYC096885; Fri, 18 Dec 2020 07:11:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=1WhVLQxqpRhmeodQp0Sj97c2pCEt49I/2l6ZG0X9nVM=;
 b=i95/hY6/gn7MGgA6A7Z7SCzNpE1spiWvkJzl5a+FUyZWFHMYkOUz8eRzcRtKpSRgPiva
 fTQIGZTGJQUarjCUXt/fwNinMJCxIhFXagr8RW+RibJL7sKuUaEeMpi919NhqAAibHaq
 nclQyJWvdR2e63JhR7Y5rW/Ir8Z6oVk7j4pHcbve1AajXGibXkZ1sSG3uwsKEDHo/LPx
 Be+8dV4/cQ/p60BfaeTALWT/CeETAg7ByiVGR82z2b/wX3SqhsHdwiuGGF1y7fGNPSl0
 RUircIIHk9c/E7ZcR6Y0I5Qcq36jnYcInjPsZwmyBo+lR+CwbsSkdg1lVj/u+upexpMU qg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35guj7h967-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 07:11:59 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BICAEOk016869;
 Fri, 18 Dec 2020 12:11:57 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 35cng8hd30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 12:11:57 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BICAeSP46924164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Dec 2020 12:10:40 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F3CEAE051;
 Fri, 18 Dec 2020 12:10:40 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFC59AE056;
 Fri, 18 Dec 2020 12:10:38 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
 [9.160.48.118])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 18 Dec 2020 12:10:38 +0000 (GMT)
Message-ID: <aa87efd5d1b3290347af8ada73deab6b5e2beb3b.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Fri, 18 Dec 2020 07:10:37 -0500
In-Reply-To: <X9ySNMlhYIMKd+SY@pevik>
References: <20201214221946.6340-1-pvorel@suse.cz>
 <20201214221946.6340-2-pvorel@suse.cz>
 <aed2e8ee7b05772a8cc2988ae275282bec7ef504.camel@linux.ibm.com>
 <X9ySNMlhYIMKd+SY@pevik>
X-Mailer: Evolution 3.28.5 (3.28.5-12.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-18_06:2020-12-18,
 2020-12-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1011
 mlxlogscore=999 suspectscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012180085
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 1/4] IMA: Move get_algorithm_digest(),
 set_digest_index() to ima_setup.sh
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
Cc: Tushar Sugandhi <tusharsu@linux.microsoft.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

On Fri, 2020-12-18 at 12:27 +0100, Petr Vorel wrote:
> > On Mon, 2020-12-14 at 23:19 +0100, Petr Vorel wrote:
> > > To be reusable by more tests (preparation for next commit).
> 
> > > Call set_digest_index() inside get_algorithm_digest() if needed
> > > instead of expecting get_algorithm_digest() caller to call
> > > set_digest_index() before.
> 
> > For the existing builtin templates, the algorithm/digest field is
> > consistent.  With support for per policy rule template formats, there
> > isn't necessarily a single template format for the entire list.
> 
> > In the future "set_digest_index" might need to be renamed to
> > "get_digest_index" and the lookup done for each line.
> Thanks for info, noted as TODO. Policy example would speedup fixing.

The simplest way of forcing this to happen would be by specifying a
custom format on the boot command line ("ima_template_fmt=") and
measuring buffer data (ima-buf), like the kexec boot command line.

measure func=KEXEC_CMDLINE template=ima-buf

where "template=ima-buf" isn't needed on kernels with commit
dea87d0889dd ("ima: select ima-buf template for buffer measurement") .

thanks,

Mimi


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
