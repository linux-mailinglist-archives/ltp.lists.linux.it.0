Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1881FEFD9
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 12:46:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7B9743C2C8A
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 12:46:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id BAAF13C1C9A
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 00:21:45 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E433D601241
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 00:21:44 +0200 (CEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05HM3JlH034319; Wed, 17 Jun 2020 18:21:38 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31q6j5mavf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jun 2020 18:21:37 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05HMLbSH087570;
 Wed, 17 Jun 2020 18:21:37 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31q6j5ma3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jun 2020 18:20:07 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05HMFeDA020268;
 Wed, 17 Jun 2020 22:19:07 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 31q8rye3mf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jun 2020 22:19:07 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05HMJ40x24969576
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Jun 2020 22:19:04 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5D1C13604F;
 Wed, 17 Jun 2020 22:19:06 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FEA213605D;
 Wed, 17 Jun 2020 22:19:05 +0000 (GMT)
Received: from [9.65.216.166] (unknown [9.65.216.166])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 17 Jun 2020 22:19:05 +0000 (GMT)
To: Bruno Meneguele <bmeneg@redhat.com>, Jerry Snitselaar <jsnitsel@redhat.com>
References: <20200527071434.28574-1-pvorel@suse.cz>
 <1590601280.16219.1.camel@linux.ibm.com> <20200528140747.GA8401@dell5510>
 <1590679145.4457.39.camel@linux.ibm.com> <20200528160527.GA27243@dell5510>
 <20200615194134.GF129694@glitch> <1592252491.11061.181.camel@linux.ibm.com>
 <20200617012148.hhpvxqov2py7fvvc@cantor> <20200617204500.GB40831@glitch>
From: Maurizio Drocco <mdrocco@linux.vnet.ibm.com>
Message-ID: <8b9bfe78-86ce-77aa-c84e-821ea69b4c86@linux.vnet.ibm.com>
Date: Wed, 17 Jun 2020 18:19:05 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200617204500.GB40831@glitch>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-17_12:2020-06-17,
 2020-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 adultscore=0 mlxscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 cotscore=-2147483648 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006170164
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 18 Jun 2020 12:46:52 +0200
Subject: Re: [LTP] [LTP v2 1/1] ima_tpm.sh: Fix for calculating boot
 aggregate
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
Cc: Vitaly Chikunov <vt@altlinux.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Maurizio Drocco <maurizio.drocco@ibm.com>, linux-integrity@vger.kernel.org,
 Mimi Zohar <zohar@linux.vnet.ibm.com>, ltp@lists.linux.it
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


On 6/17/2020 4:45 PM, Bruno Meneguele wrote:
> On Tue, Jun 16, 2020 at 06:21:48PM -0700, Jerry Snitselaar wrote:
>> On Mon Jun 15 20, Mimi Zohar wrote:
>>> On Mon, 2020-06-15 at 16:41 -0300, Bruno Meneguele wrote:
>>>> On Thu, May 28, 2020 at 06:05:27PM +0200, Petr Vorel wrote:
>>>>> Hi Mimi,
>>>>> ...
>>>>>>>> With just this change, the ima_tpm.sh test is failing. =A0I assume=
 it is
>>>>>>>> failing because it is reading the SHA1 TPM bank, not the SHA256 ba=
nk
>>>>>>>> to calculate the boot_aggregate hash.
>>>>>>> First question: is it correct to take sha256? Because on my test be=
low it's
>>>>>>> reading sha1, because that's the content of /sys/kernel/security/im=
a/ascii_runtime_measurements
>>>>>>> I thought just kernel commit: 6f1a1d103b48 ima: ("Switch to ima_has=
h_algo for
>>>>>>> boot aggregate") from current linux-integrity tree is needed, but I=
 tested it on
>>>>>>> b59fda449cf0 ("ima: Set again build_ima_appraise variable") (i.e. h=
aving all
>>>>>>> Robeto's ima patches,  missing just last 2 commits from next-integr=
ity head).
>>>>>>> What is needed to get your setup?
>>>>>> This isn't a configuration problem, but an issue of reading PCRs and
>>>>>> calculating the TPM bank appropriate boot_aggregate. =A0If you're
>>>>>> calculating a sha256 boot_aggregate, then the test needs to read and
>>>>>> calculate the boot_aggregate by reading the SHA256 TPM bank.
>>>>> OK, I tested it on TPM 1.2 (no TPM 2.0 available atm).
>>>>> I guess you have TPM 2.0, that's why I didn't spot this issue.
>>>>>
>>>>> To sum that: my patch is required for any system without physical TPM=
 with with
>>>>> kernel with b59fda449cf0 + it also works for TPM 1.2 (regardless kern=
el
>>>>> version), because TPM 1.2 supports sha1 only boot aggregate.
>>>>>
>>>>> But testing on kernel with b59fda449cf0 with TPM 2.0 is not only brok=
en with
>>>>> this patch, but also on current version in master, right? As you have
>>>>> sha256:3fd5dc717f886ff7182526efc5edc3abb179a5aac1ab589c8ec888398233ae=
5 anyway.
>>>>> So this patch would help at least testing on VM without vTPM.
>>>>>
>>>> If we consider to delay this change until we have the ima-evm-utils
>>>> released with the ima_boot_aggregate + make this test dependent on
>>>> both ima-evm-utils and tsspcrread, would it be worth to SKIP the test =
in
>>>> case a TPM2.0 sha256 bank is detected instead of FAIL? Thus we could
>>>> have the test fixed for TPM1.2 && no-TPM cases until we get the full
>>>> support for multiple banks?
>>> As long as we're dealing with the "boot_aggregate", Maurizio just
>>> posted a kernel patch for including PCR 8 & 9 in the boot_aggregate.
>>>  =A0The existing IMA LTP "boot_aggregate" test is going to need to
>>> support this change.
>>>
>>> I'd appreciate if someone could send me a TPM event log, the PCRs, and
>>> the associated IMA ascii_runtime_measurements "boot_aggregate" from a
>>> system with a discrete TPM 2.0 with PCRs 8 & 9 events.
>>>
> Maybe Maurizio already have it at hand?
> I can try to setup a system with grub2+tpm to get the log with pcr 8 and
> 9 filled.

Hi Bruno, I confirm I have a couple of systems on where 8 & 9 and the =

IMA list are filled at boot (already shared with Mimi), now I am =

figuring out how to produce TPM event logs as well.


-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
