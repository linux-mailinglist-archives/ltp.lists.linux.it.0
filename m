Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF6927D659
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 21:02:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F09F23C2AA9
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 21:02:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 586213C12A0
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 21:02:34 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 119821400DB4
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 21:02:32 +0200 (CEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08TJ2MAA084305; Tue, 29 Sep 2020 15:02:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=zjlmpNd+Fsp0oDR5NKJWbx0dWfAsKNpmCBx6hydglkE=;
 b=gb1WOGW0kusOdK5FxWd80KrV/g8UF7Jw+KQ2jVamDVyILGXQs48ePhrTmnsv6oovWaxi
 kvJqOodcFh/yWwRU8FOhkZ3dywc+1M8QkCu4dEx/ZAOT6CQUcdCo9s0oTMy6Pa+nCp5M
 0mFgpqkCWvObX44HA0irhLhltscLBYYNtmq+18F5OqDimzGAFp30yP+I5YAcgoHf0mfw
 iAQwWjLbWp5blu+MyDmgyeHhNLtWEPGXxF7oJZ8YNsRl+5DFHoEKKn+TGa2lvtM0skVX
 jT1P+A5ak73FaRlg2p12ICPmE2pRvnx57ye8lcOw5DBTEbB15pBgmNDj0SMl0LRdCQnb Mg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33v9g62b3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Sep 2020 15:02:27 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08TJ1mc0003945;
 Tue, 29 Sep 2020 19:01:48 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 33v5kg05j4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Sep 2020 19:01:48 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 08TJ1kr935717626
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Sep 2020 19:01:46 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A4604204B;
 Tue, 29 Sep 2020 19:01:46 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BD7242047;
 Tue, 29 Sep 2020 19:01:44 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
 [9.160.90.38]) by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 29 Sep 2020 19:01:44 +0000 (GMT)
Message-ID: <77a75615c8ee019bcd0b0dac7946449b2e26c891.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
Date: Tue, 29 Sep 2020 15:01:43 -0400
In-Reply-To: <20200929165021.11731-5-pvorel@suse.cz>
References: <20200929165021.11731-1-pvorel@suse.cz>
 <20200929165021.11731-5-pvorel@suse.cz>
X-Mailer: Evolution 3.28.5 (3.28.5-12.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-29_11:2020-09-29,
 2020-09-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009290155
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 4/4] ima_tpm.sh: Fix calculating PCR aggregate
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
 linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

On Tue, 2020-09-29 at 18:50 +0200, Petr Vorel wrote:
> +get_pcr10_aggregate()
> +{
> +       local pcr
> +
> +       evmctl -v ima_measurement $BINARY_MEASUREMENTS > hash.txt 2>&1
> +
> +       pcr=$(grep -E "^($ALGORITHM: )*PCRAgg.*:" hash.txt \
> +               | awk '{print $NF}')
> +
> +       if [ -z "$pcr" ]; then
> +               tst_res TFAIL "evmctl failed to get aggregate PCR-10"
> +               cat hash.txt >&2
> +               return
> +       fi
> +
> +       echo "$pcr"
> +}
> +

I'm seeing the following output:

10 a528ab7a7096e0187aa5c154502f467a0f931873 ima-ng
sha1:75bf81bc120313f6aa61430fad4a47afceea3e7c
/usr/local/lib/libimaevm.so.2.0.0
Failed to match per TPM bank or SHA1 padded TPM digest(s).
errno: No such file or directory (2)
ima_tpm 2 TBROK: Test didn't report any results
ima_tpm 2 TINFO: SELinux enabled in enforcing mode, this may affect
test results
ima_tpm 2 TINFO: it can be disabled with TST_DISABLE_SELINUX=1
(requires super/root)
ima_tpm 2 TINFO: install seinfo to find used SELinux profiles
ima_tpm 2 TINFO: loaded SELinux profiles: none

SELinux is blamed enough for different things.  Let's not add verifying
the IMA measurement list.  A more likely reason for failing to validate
the measurement list is that it contains violations.  Normally this is
because the builtin "ima_policy=tcb" policy has not been replaced with
a custom policy, based on LSM labels.

Test2 should fail when the measurement list contains violations, but it
should retry validating the measurement list with the "--ignore-
violations" option to provide additional context.

thanks,

Mimi


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
