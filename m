Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 939AE200604
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 12:07:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5CA743C2C47
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 12:07:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id D99963C0887
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 12:07:40 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1C80D1A01193
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 12:07:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9AE8FB048;
 Fri, 19 Jun 2020 10:07:38 +0000 (UTC)
Date: Fri, 19 Jun 2020 12:07:37 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <20200619100737.GB18704@dell5510>
References: <20200527071434.28574-1-pvorel@suse.cz>
 <1590601280.16219.1.camel@linux.ibm.com>
 <20200528140747.GA8401@dell5510>
 <1590679145.4457.39.camel@linux.ibm.com>
 <20200528160527.GA27243@dell5510> <20200615194134.GF129694@glitch>
 <1592252491.11061.181.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592252491.11061.181.camel@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Vitaly Chikunov <vt@altlinux.org>,
 Maurizio Drocco <maurizio.drocco@ibm.com>, linux-integrity@vger.kernel.org,
 Mimi Zohar <zohar@linux.vnet.ibm.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> On Mon, 2020-06-15 at 16:41 -0300, Bruno Meneguele wrote:
> > On Thu, May 28, 2020 at 06:05:27PM +0200, Petr Vorel wrote:
> > > Hi Mimi,
...
> > > To sum that: my patch is required for any system without physical TPM=
 with with
> > > kernel with b59fda449cf0 + it also works for TPM 1.2 (regardless kern=
el
> > > version), because TPM 1.2 supports sha1 only boot aggregate.

> > > But testing on kernel with b59fda449cf0 with TPM 2.0 is not only brok=
en with
> > > this patch, but also on current version in master, right? As you have
> > > sha256:3fd5dc717f886ff7182526efc5edc3abb179a5aac1ab589c8ec888398233ae=
5 anyway.
> > > So this patch would help at least testing on VM without vTPM.


> > If we consider to delay this change until we have the ima-evm-utils
> > released with the ima_boot_aggregate + make this test dependent on
> > both ima-evm-utils and tsspcrread, would it be worth to SKIP the test in
> > case a TPM2.0 sha256 bank is detected instead of FAIL? Thus we could
> > have the test fixed for TPM1.2 && no-TPM cases until we get the full
> > support for multiple banks?
+1

> As long as we're dealing with the "boot_aggregate", Maurizio just
> posted a kernel patch for including PCR 8 & 9 in the boot_aggregate.
> =A0The existing IMA LTP "boot_aggregate" test is going to need to
> support this change.
I'm not sure if I did something wrong, but it looks to me that 'evmctl
ima_boot_aggregate' does not provide backward compatibility with TPM 1.2.
Or am I wrong?

And given the fact that new evmctl is not released, I'd adapt the test just=
 for
TPM 1.2 && no-TPM as Bruno suggested (TCONF if
/sys/class/tpm/tpm0/tpm_version_major presented and not 1, print info about=
 TPM
2.0 not yet supported otherwise).

BTW what is the correct way for systems with more TPM (is there any? It loo=
ks
it's possible [1]). Which of them is used? Should I loop over
/sys/class/tpm/tpm*/tpm_version_major or just use
/sys/class/tpm/tpm0/tpm_version_major?

Kind regards,
Petr

[1] https://letstrust.de/archives/29-New-fun-fact!.html

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
