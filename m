Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 92950253A2B
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Aug 2020 00:15:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5AC8C3C2EC9
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Aug 2020 00:15:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 10E9F3C0639
 for <ltp@lists.linux.it>; Thu, 27 Aug 2020 00:15:53 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D09E22002C1
 for <ltp@lists.linux.it>; Thu, 27 Aug 2020 00:15:52 +0200 (CEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07QM2Tdp009433; Wed, 26 Aug 2020 18:15:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=nNPbnCetM8DJY93wEqN5qBmsHN/Kc8f0y0wqAxveMYM=;
 b=lr8055hdX63jt8oVvHSlch3OJPsPxt+yl8uIoQHl8xKY2lMNOv9sxXRSD+Sy8lU/4cVn
 t0rV1o6MEWNviKULF4RWIl+CrxUZTE1x7t9LyQzhIAGm+oG0IWqHOFoEYJsqAnz0yyGb
 14q+H4CZzhnsi01wa49rYrV9Hs2XDU6knWtdMCS8Oen+WHm0M15Ov8iCVCbiGhGAgoyF
 2jW1yyI/Eveco8qfZnqwSFgq8fx44uXeqAULYTCf2GuDKjlXzE7sa8ibJ6YPLWDf7y2+
 PY4dRAXZVWxRVqxeSmuorwTt27IFMCKzHxNoxgGJFEU0wq90wLk7sSLI5IXYohx0yvcF Jw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 335y7rj155-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Aug 2020 18:15:48 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07QMC69O025859;
 Wed, 26 Aug 2020 22:15:47 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 332ujkw0f8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Aug 2020 22:15:47 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07QMFiq113959424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Aug 2020 22:15:45 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E23EAAE04D;
 Wed, 26 Aug 2020 22:15:44 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47387AE045;
 Wed, 26 Aug 2020 22:15:43 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
 [9.160.94.210])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 26 Aug 2020 22:15:43 +0000 (GMT)
Message-ID: <b58057275ecdc06bb512d39ea46118197f33c33f.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
Date: Wed, 26 Aug 2020 18:15:42 -0400
In-Reply-To: <20200820090824.3033-5-pvorel@suse.cz>
References: <20200820090824.3033-1-pvorel@suse.cz>
 <20200820090824.3033-5-pvorel@suse.cz>
X-Mailer: Evolution 3.28.5 (3.28.5-12.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-26_14:2020-08-26,
 2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=833 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008260165
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
 Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, 2020-08-20 at 11:08 +0200, Petr Vorel wrote:

> @@ -63,4 +73,50 @@ test1()
>  	tst_res TPASS "specified keyrings were measured correctly"
>  }
> 
> +# Create a new keyring, import a certificate into it, and verify
> +# that the certificate is measured correctly by IMA.
> +test2()
> +{
> +	tst_require_cmds evmctl keyctl openssl
> +
> +	local cert_file="$TST_DATAROOT/x509_ima.der"
> +	local keyring_name="key_import_test"
> +	local temp_file="file.txt"
> +
> +	tst_res TINFO "verify measurement of certificate imported into a keyring"
> +
> +	if ! check_ima_policy_content "^measure.*func=KEY_CHECK.*keyrings=.*$keyring_name"; then
> +		tst_brk TCONF "IMA policy does not contain $keyring_name keyring"
> +	fi
> +
> +	KEYRING_ID=$(keyctl newring $keyring_name @s) || \
> +		tst_brk TBROK "unable to create a new keyring"
> +
> +	if ! tst_is_num $KEYRING_ID; then
> +		tst_brk TBROK "unable to parse the new keyring id ('$KEYRING_ID')"
> +	fi
> +

Instead of using TST_DATAROOT, which is defined as
"$LTPROOT/datafiles", use LTPROOT directly to define the path to the
cert.  Adding the following will allow the test to run from the build
directory.
 
      if [ ! -f $cert_file ]; then
              cert_file="$LTPROOT/../datafiles/ima_keys/x509_ima.der"
      fi

Mimi

> +	evmctl import $cert_file $KEYRING_ID > /dev/null || \
> +		tst_brk TBROK "unable to import a certificate into $keyring_name keyring"
> +


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
