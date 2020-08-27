Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C742551AB
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 01:37:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD8513C561E
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 01:37:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id CB0353C011E
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 01:37:45 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A3CBD2000D2
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 01:37:44 +0200 (CEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07RNXGme026778; Thu, 27 Aug 2020 19:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=/esw1OBUoAAsmyecsp8a5tpVRNQW36GPOaFvXAjBPEo=;
 b=LpyTsyfMKFSKjYRd7xNEPjzhO1/0X4TM7QSl0A5x6bKw6f+AJKaoz3NRUMHLjgtI0pWm
 D1puCNki0jxdlOGcaeqGTLXaQJsgh+GaLLnI+QQj8mGa7roPHNReQxrIh/4fW+uhFuiy
 oIh4y/+n3DWrCoPIR0SpaDnXP5Lx/gSU5N4AwL305XJoXW8PkOSCNRsvfXjJAfvdjWYv
 NqgopgK7nlCgpn6BNV56Hq3vTGLy2HXhfbgUjBxCzz2qWi0RYa+B1ZoHde5FvZl+AYl7
 nOXg9bqRNat/kmNoMFJdYZpfUp4kYrsCQGaVrTIR1dusYJxv+6DVavJcV8px7ZkQECOF /w== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 336n1aj8kt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 19:37:40 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07RNSQTr010599;
 Thu, 27 Aug 2020 23:37:38 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 336n7g81ba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 23:37:38 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07RNbaVV26607882
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Aug 2020 23:37:36 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 315D4A4051;
 Thu, 27 Aug 2020 23:37:36 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89607A4040;
 Thu, 27 Aug 2020 23:37:34 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
 [9.160.6.101]) by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Aug 2020 23:37:34 +0000 (GMT)
Message-ID: <d6087ee43d18605ee6cdc6b80450b0024af14fb6.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Thu, 27 Aug 2020 19:37:33 -0400
In-Reply-To: <20200827225417.GA29921@dell5510>
References: <20200820090824.3033-1-pvorel@suse.cz>
 <20200820090824.3033-5-pvorel@suse.cz>
 <b58057275ecdc06bb512d39ea46118197f33c33f.camel@linux.ibm.com>
 <20200827132354.GA20439@dell5510> <20200827135503.GA11990@dell5510>
 <b72657042d13f9b8f30d5bdea7e2d06835e4a1d1.camel@linux.ibm.com>
 <20200827225417.GA29921@dell5510>
X-Mailer: Evolution 3.28.5 (3.28.5-12.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-27_14:2020-08-27,
 2020-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008270179
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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

On Fri, 2020-08-28 at 00:54 +0200, Petr Vorel wrote:
> Hi Mimi,
> 
> ...
> > > > > Instead of using TST_DATAROOT, which is defined as
> > > > > "$LTPROOT/datafiles", use LTPROOT directly to define the path to the
> > > > > cert.  Adding the following will allow the test to run from the build
> > > > > directory.
> > > > >       if [ ! -f $cert_file ]; then
> > > > >               cert_file="$LTPROOT/../datafiles/ima_keys/x509_ima.der"
> > > > >       fi
> > > > Yes, this will work if you set LTPROOT to <ltp git>/testcases/kernel/security/integrity/ima/tests/:
> > When running any of the tests from build tree test directory -
> > ltp/testcases/kernel/security/integrity/ima/tests, supplying LTPROOT
> > isn't necessary. "IMA: Refactor datafiles directory" broke running the
> > other tests directly from the build tree as well.
> Correct, I overlooked $LTPROOT does not have to be set.
> You're right, there is export LTPROOT="$PWD" in tst_test.sh.
> 
> The only broken tests are ima_policy.sh and ima_keys.sh. I fixed that workaround
> in the commit "IMA: Refactor datafiles directory":
> 
> +++ testcases/kernel/security/integrity/ima/tests/ima_setup.sh
> @@ -160,6 +160,11 @@ ima_setup()
>  	BINARY_MEASUREMENTS="$IMA_DIR/binary_runtime_measurements"
>  	IMA_POLICY="$IMA_DIR/policy"
>  
> +	# hack when running tests locally from tests directory
> +	if [ ! -d "$TST_DATAROOT" ]; then
> +		TST_DATAROOT="$LTPROOT/../datafiles/$TST_ID/"
> +	fi
> +

Thanks, Petr.  This works properly.  To remove the "hack", would
require running the test from "ima", not "ima/tests", but that would
require fixing how ima_setup.sh is called.   It also would still
require setting TST_DATAROOT to TST_DATAROOT/$TST_ID.

Mimi

>  	print_ima_config
>  
>  	if [ "$TST_NEEDS_DEVICE" = 1 ]; then
> ---
> 
> Again, pushed to:
> https://github.com/pevik/ltp/tree/Lachlan_Sneff/ima_keys.sh-second-test.v4.fixes
> 
> Kind regards,
> Petr



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
