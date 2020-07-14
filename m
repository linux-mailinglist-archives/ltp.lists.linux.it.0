Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ABC21F019
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jul 2020 14:10:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 92DF73C4F83
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jul 2020 14:10:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 576DE3C28F5
 for <ltp@lists.linux.it>; Tue, 14 Jul 2020 14:10:38 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DFAA51A01462
 for <ltp@lists.linux.it>; Tue, 14 Jul 2020 14:10:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9BC07B021;
 Tue, 14 Jul 2020 12:10:39 +0000 (UTC)
Date: Tue, 14 Jul 2020 14:10:34 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <20200714121034.GA8020@dell5510>
References: <20200617234957.10611-1-t-josne@linux.microsoft.com>
 <20200617234957.10611-3-t-josne@linux.microsoft.com>
 <1593016868.27152.88.camel@linux.ibm.com>
 <20418d14-d464-ec09-e1f2-c1b96e9df5f6@linux.microsoft.com>
 <1593028963.27152.153.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1593028963.27152.153.camel@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/2] IMA: Add a test to verify importing a
 certificate into keyring
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
Cc: nramas@linux.microsoft.com, balajib@linux.microsoft.com, ltp@lists.linux.it,
 linux-integrity@vger.kernel.com
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Mimi, Lachlan,

> > >> +`ima_keys.sh` requires an x509 key to be generated and placed
> > >> +at `/etc/keys/x509_ima.der`.
> > > The filename "/etc/keys/x509_ima.der" is configurable. =A0It's based =
on
> > > CONFIG_IMA_X509_PATH Kconfig option. =A0Perhaps extract it from the
> > > running kernel's Kconfig?
> > I didn't think pulling it from the kernel config. Will try this. I =

> > assume `grep "..." /boot/config-$(uname -r)` is the right way to grab a =

> > line from the config?

> Try using scripts/extract-ikconfig.
For now I'd just try to grep /boot/config-$(uname -r), but allow to run the=
 test
with the default value if kconfig not presented / readable (when running wi=
thout
root).

I'm not sure if extract-ikconfig as external dependency would be suitable f=
or
LTP (understand it's great for kselftest as it's already presented).

BTW there is a ticket for adding kernel config related helpers into the LTP
shell API [1], I'll also note extract-ikconfig there.

LTP refused for long time working with kernel config, because it it's
requirement meant that SUT without it could not be tested. Always try to not
make kernel config as hard dependency (various embedded or old android will=
 be
disabled; some linux distros require root for reading the config).
Design in [1] also suggest to have possibility to run the test even without=
 config.

[1] https://github.com/linux-test-project/ltp/issues/700

> Mimi

Kind regards,
Petr

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
