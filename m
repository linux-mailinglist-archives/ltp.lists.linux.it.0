Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C1A200383
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 10:21:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C09FD3C2C46
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 10:21:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 03BB73C22FE
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 10:21:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A9484600A81
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 10:20:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 652A7AC85;
 Fri, 19 Jun 2020 08:21:35 +0000 (UTC)
Date: Fri, 19 Jun 2020 10:21:34 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Bruno Meneguele <bmeneg@redhat.com>
Message-ID: <20200619082134.GB23036@dell5510>
References: <20200527071434.28574-1-pvorel@suse.cz>
 <1590601280.16219.1.camel@linux.ibm.com>
 <20200528140747.GA8401@dell5510>
 <1590679145.4457.39.camel@linux.ibm.com>
 <20200528160527.GA27243@dell5510> <20200615194134.GF129694@glitch>
 <1592252491.11061.181.camel@linux.ibm.com>
 <20200617012148.hhpvxqov2py7fvvc@cantor>
 <20200617204500.GB40831@glitch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200617204500.GB40831@glitch>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
Cc: Vitaly Chikunov <vt@altlinux.org>, Jerry Snitselaar <jsnitsel@redhat.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Maurizio Drocco <maurizio.drocco@ibm.com>,
 linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

...
> > > I'd appreciate if someone could send me a TPM event log, the PCRs, and
> > > the associated IMA ascii_runtime_measurements "boot_aggregate" from a
> > > system with a discrete TPM 2.0 with PCRs 8 & 9 events.


> Maybe Maurizio already have it at hand?
I'd appreciate to have these files as well.

> I can try to setup a system with grub2+tpm to get the log with pcr 8 and
> 9 filled.


> > > > > ...
> > > > > > > > The ima-evm-utils next-testing branch has code to calculate=
 the
> > > > > > > > boot_aggregate based on multiple banks.
> > > > > > > I see, 696bf0b ("ima-evm-utils: calculate the digests for mul=
tiple TPM banks")
> > > > > > > I wonder whether it's reasonable trying to port that to ima_b=
oot_aggregate.c or
> > > > > > > just depend on evmctl. External dependencies are sometimes co=
mplicated, but for
> > > > > > > IMA I incline to just require evmctl.

> > > > > > Unlike TPM 1.2, the TPM 2.0 device driver doesn't export the TP=
M PCRs.
> > > > > > =A0Not only would you have a dependency on ima-evm-utils, but a=
lso on a
> > > > > > userspace application(s) for reading the TPM PCRs. =A0That depe=
ndency
> > > > > > exists whether you're using evmctl to calculate the boot_aggreg=
ate or
> > > > > > doing it yourself.
> > > > > Hm, things get complicated.
> > > > > Yep I remember your patch to skip verifying TPM 2.0 PCR values
> > > > > https://patchwork.ozlabs.org/project/ltp/patch/1558041162.3971.2.=
camel@linux.ibm.com/
> > > > > At least thanks to Jerry Snitselaar since v5.6 we have
> > > > > /sys/class/tpm/tpm*/tpm_version_major. We could check this (+ try=
 also
> > > > > /sys/class/tpm/tpm0/device/description for older kernels).

> > > > > BTW on my system there is also /sys/class/tpm/tpm0/ppi/version, w=
hich has 1.2,
> > > > > not sure if it indicate TPM 1.2, but I wouldn't rely on that.


> Missed this last paragraph.. but /sys/class/tpm/tpm0/ppi/version has
> relation to the Physical Presence Interface version, which is the
> communication interface between firmware and OS afaik, and doesn't
> points to the TPM version: TPM2.0 may have PPI version 1.2 or 1.3.


Kind regards,
Petr

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
