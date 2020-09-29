Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 728DA27CC0C
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 14:34:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3681A3C2AA9
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 14:34:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 95CDE3C0151
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 14:34:13 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C71112009AF
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 14:34:12 +0200 (CEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08TCWxac068575; Tue, 29 Sep 2020 08:34:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=K6jjFakboNLQmh9MTMoeCLuDR31vHzgjIWuFoRZEjpM=;
 b=h7R3/IqcJq036vCi1gLNWws5hay4B+iRo0eZMADVhH/spdfhKDl02D0njMt86PY2i09n
 5o8rLi4q+HSFz2TWgIog1j36hbqgL8EemXi/PY0/uJl180MJnB0B9vMg2rWuzuSLtMR2
 4JIDzOGfuaVV+BWqfQkg2uWxvJQz9ObAg4LeMwyAfeMbb4LapD6G80LwygQWijuunV6O
 UQrzqY4JT5esWVd8hJd0FWw+NqMviA41qwtBVPJmtlDtbzmI/YBxwLJc4zIbQ3tcpx2t
 pCkc0U/qO8cwlgG7nA2oD1zX/hHb5SGDQpvU6OjVzEO0IMm/QPgmXIgO2uhSfFhUCkqJ Wg== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33v46r9qb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Sep 2020 08:34:06 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08TCS9Ie002116;
 Tue, 29 Sep 2020 12:33:57 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 33svwgsqj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Sep 2020 12:33:57 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08TCXsJD34799940
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Sep 2020 12:33:55 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD1A9AE04D;
 Tue, 29 Sep 2020 12:33:54 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2440AE053;
 Tue, 29 Sep 2020 12:33:53 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
 [9.160.84.239])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 29 Sep 2020 12:33:53 +0000 (GMT)
Message-ID: <4ce0e22ef2812a9be66b45b5ce32902810f17efd.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
Date: Tue, 29 Sep 2020 08:33:52 -0400
In-Reply-To: <20200929121735.GA11889@dell5510>
References: <20200925185034.24155-1-pvorel@suse.cz>
 <20200925185034.24155-4-pvorel@suse.cz> <20200929121735.GA11889@dell5510>
X-Mailer: Evolution 3.28.5 (3.28.5-12.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-29_04:2020-09-29,
 2020-09-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 clxscore=1011 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009290109
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/4] ima_tpm.sh: Fix calculating boot aggregate
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

On Tue, 2020-09-29 at 14:17 +0200, Petr Vorel wrote:
> Hi,
> 
> >  test1()
> >  {
> >  	tst_res TINFO "verify boot aggregate"
> 
> > -	local zero="0000000000000000000000000000000000000000"
> >  	local tpm_bios="$SECURITYFS/tpm0/binary_bios_measurements"
> > -	local ima_measurements="$ASCII_MEASUREMENTS"
> > -	local boot_aggregate boot_hash line
> > +	local cmd="evmctl ima_boot_aggregate"
> > +	local boot_aggregate cmd zero
> 
> > -	# IMA boot aggregate
> > -	read line < $ima_measurements
> > -	boot_hash=$(echo $line | awk '{print $(NF-1)}' | cut -d':' -f2)
> > +	if [ "$MISSING_EVMCTL" = 1 ]; then
> > +		if [ -f "$tpm_bios" ]; then
> I leaved this error during rebase:
> if [ ! -f "$tpm_bios" ]; then
> 
> I'm still investigating corner case issue when
> /sys/kernel/security/tpm0/binary_bios_measurements
> is not presented (mostly when no TPM device, thus IMA "TPM-bypass" code being
> used, but sometimes also for TPM 2.0 which does not export event log).

There's another case as well.  On one of my test systems with a TPM 2.0
chip, but without secure boot enabled, the binary_bios_measurements
exists, but it can't be accessed.  dmesg contains a secure boot status
line.

Mimi

> 
> I'll send shortly v3.
> 
> Kind regards,
> Petr
> 
> > +			tst_res TCONF "missing $tpm_bios, $ERRMSG_EVMCTL"
> > +			return
> > +		fi
> > +		tst_check_cmds ima_boot_aggregate || return
> > +		cmd="ima_boot_aggregate -f $tpm_bios"
> > +	fi
> > +	tst_res TINFO "using command: $cmd"



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
