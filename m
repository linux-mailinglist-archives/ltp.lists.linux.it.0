Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DC64D124BBB
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Dec 2019 16:30:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7B4FC3C2400
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Dec 2019 16:30:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id CB52F3C02F2
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 16:30:30 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DCC04140112D
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 16:30:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 50EB0AD09;
 Wed, 18 Dec 2019 15:30:29 +0000 (UTC)
Date: Wed, 18 Dec 2019 16:30:27 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20191218153027.GA26998@dell5510>
References: <20191209093659.31996-1-lkml@jv-coder.de>
 <20191218103927.GA26489@dell5510> <20191218105920.GB26489@dell5510>
 <3b6c187d-7e72-8d9a-ae42-189bedc3098d@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b6c187d-7e72-8d9a-ae42-189bedc3098d@jv-coder.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] isofs: Convert to new library
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
Cc: ltp@lists.linux.it, Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi J=F6rg,

> thanks for merging
> > > You correctly removed getopt options: -n just set NO_CLEANUP, which i=
s not used
> > > any more on test.sh. Both libraries support TST_NO_CLEANUP, so we sho=
uld
> > > document it (going to send a patch).
> > In the end I just merged that simple doc change.
> > I wonder if there would be use for variable keeping $TST_TMPDIR (becaus=
e it's
> > deleted even with $TST_NO_CLEANUP).
> I think that was the reason why I completely removed the flag in the first
> place.
+1.

> Also I did not see any reason to keep the tempdir. If I ever needed this =
in
> the past, I just modified the test.
Thanks for info. You're right, it's probably useless.

Kind regards,
Petr

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
