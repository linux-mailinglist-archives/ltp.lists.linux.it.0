Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEF3200947
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 15:01:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A695B3C2C4D
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 15:01:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 5B7643C1D1C
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 15:01:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8B8FD1401177
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 15:01:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AC36EAC91;
 Fri, 19 Jun 2020 13:01:41 +0000 (UTC)
Date: Fri, 19 Jun 2020 15:01:40 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <20200619130140.GA30256@dell5510>
References: <1590601280.16219.1.camel@linux.ibm.com>
 <20200528140747.GA8401@dell5510>
 <1590679145.4457.39.camel@linux.ibm.com>
 <20200528160527.GA27243@dell5510> <20200615194134.GF129694@glitch>
 <1592252491.11061.181.camel@linux.ibm.com>
 <20200617012148.hhpvxqov2py7fvvc@cantor>
 <20200617204500.GB40831@glitch> <20200619082134.GB23036@dell5510>
 <1592570638.17802.8.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592570638.17802.8.camel@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
 Maurizio Drocco <maurizio.drocco@ibm.com>, linux-integrity@vger.kernel.org,
 Mimi Zohar <zohar@linux.vnet.ibm.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Mimi,

> > ...
> > > > > I'd appreciate if someone could send me a TPM event log, the PCRs=
, and
> > > > > the associated IMA ascii_runtime_measurements "boot_aggregate" fr=
om a
> > > > > system with a discrete TPM 2.0 with PCRs 8 & 9 events.


> > > Maybe Maurizio already have it at hand?
> > I'd appreciate to have these files as well.

> > > I can try to setup a system with grub2+tpm to get the log with pcr 8 =
and
> > > 9 filled.

> Both RHEL 8 and Ubuntu 20.04 LTS have PCRs 8 & 9. =A0I'll include one as
> another example for the tests/boot_aggregate.test.
Thank you!

Kind regards,
Petr

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
