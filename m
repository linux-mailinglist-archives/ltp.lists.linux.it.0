Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2621A2DD715
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 19:12:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A89BE3C7077
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 19:12:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id E2FCA3C29E5
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 19:12:47 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EB4902009A2
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 19:12:46 +0100 (CET)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BHI0akt196523; Thu, 17 Dec 2020 13:12:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=I5dav5ybtm5cOlvE0z4XiFssiO7SXZwXPyzsjqd6q1o=;
 b=mPD76X+kqQ9R2YR2OoxVTflGDoaLvUQHvFM+jj1uYtSqJMv3zs3WFVT0VdlA97khSau3
 JFnM3ESgxUb74QuGHonW0jFUeDJC6b+VpZywUZRg5lFNNFetNiHrdgXb+nXkxe9K1j6T
 Kio9cfe+OUS5JUNUFTfg2+4wZ5G0Im0oEBQGemwUOqg0iou4qnsoLJFfVcaL+xkz/TBg
 6KK7LsFfguMnB5Xvssd6vR6LBaPMxrVCon57WxoOoIFMyTZD3puNFAdl09QEExex3Kvc
 lzjyVucBv5oz1bjJ/HhoNCCBBoWBAMlC+B6aHHMgS3U0TA1m01dHCW4/7qUWTKWaQLg+ Tw== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35gc6s8frc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 13:12:43 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BHI89X4020351;
 Thu, 17 Dec 2020 18:12:42 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 35fmywgkpy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 18:12:41 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BHICdCx30474654
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Dec 2020 18:12:39 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9187A42041;
 Thu, 17 Dec 2020 18:12:39 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4A8542042;
 Thu, 17 Dec 2020 18:12:37 +0000 (GMT)
Received: from sig-9-65-203-134.ibm.com (unknown [9.65.203.134])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 17 Dec 2020 18:12:37 +0000 (GMT)
Message-ID: <25e41786777f814455780915dfe1bc2c769dc99c.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
Date: Thu, 17 Dec 2020 13:12:36 -0500
In-Reply-To: <20201214221946.6340-4-pvorel@suse.cz>
References: <20201214221946.6340-1-pvorel@suse.cz>
 <20201214221946.6340-4-pvorel@suse.cz>
X-Mailer: Evolution 3.28.5 (3.28.5-12.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-17_11:2020-12-15,
 2020-12-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012170121
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 3/4] ima_tpm.sh: Fix calculating boot aggregate
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
 linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

On Mon, 2020-12-14 at 23:19 +0100, Petr Vorel wrote:
> for TPM 2.0 or kernel >= v5.8-rc1:
> 6f1a1d103b48 ima: ("Switch to ima_hash_algo for boot aggregate")
> 
> Test still fails with newer TPM 2.0 on kernel < v5.8-rc1.

The above commit was backported in stable.  Do you know if the failing
systems backported the above patch?   I've recently asked for commit
20c59ce010f8 ("ima: extend boot_aggregate with kernel measurements")
also be backported.

> 
> Test was failing, because it expect SHA1 (we ignore MD5) hash, but for TPM 2.0
> is now used IMA default hash algorithm (by default default SHA256).
> This is similar for entries in IMA measurement list so we can reuse
> already existing code.
> 
> Reading other algorithms than SHA1 or support TPM 2.0 requires evmctl
> >= 1.3.1 (1.3 would also work for test1, but will be required for test2).
> 
> Although recent evmctl is recommended, to support older kernels and TPMs
> which support only SHA1, get boot aggregate with old our legacy
> ima_boot_aggregate.c.

^ the LTP legacy ima_boot_aggregate.c still works, without the evmctl
dependency.

> 
> Also fixed cases:
> * testing with no TPM device:
> * TPM TPM 2.0 devices which does not export event log
> (/sys/kernel/security/tpm0/binary_bios_measurements).

^ firmware which does not export the TPM 2.0 binary event log

> 
> Also fixed test without TPM device (when IMA TPM-bypass is tested)
> as some TPM 2.0 devices does not export event log
> (/sys/kernel/security/tpm0/binary_bios_measurements).

This looks like a duplicate of above.  Maybe just add another bullet
*
detecting IMA TPM-bypass mode

> This does not require evmctl at all.

I assume this comment refers to TPM 2.0 calculating the
"boot_aggregate" based on the existing PCR values, as opposed to TPM
1.2 which first walks the TPM event log, calculating the PCRs.

> 
> Also try best to detect TPM major version (1, 2 or none - assume
> TPM-bypass). This fixes testing with TPM 2.0 device which does not
> export event log (/sys/kernel/security/tpm0/binary_bios_measurements):
> not wrongly assuming TPM-bypass when kernel didn't export other TPM
> 2.0 files we check in get_tpm_version() but bios boot aggregate is
> correct (i.e. not 0x00s). In that case evmctl ima_boot_aggregate can get
> boot aggregate even without TPM event log.
> 
> Co-developed-by: Mimi Zohar <zohar@linux.ibm.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>

Thanks, Petr!

Mimi


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
