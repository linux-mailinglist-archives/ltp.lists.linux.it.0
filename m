Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA61E1D9037
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 08:43:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 640103C4E64
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 08:43:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 7AA303C1ABA
 for <ltp@lists.linux.it>; Tue, 19 May 2020 08:43:17 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B7A0760344D
 for <ltp@lists.linux.it>; Tue, 19 May 2020 08:42:53 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3429FAC5B;
 Tue, 19 May 2020 06:43:19 +0000 (UTC)
Date: Tue, 19 May 2020 08:43:14 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20200519064314.GA16972@dell5510>
References: <20200518130132.19312-1-pvorel@suse.cz>
 <20200518130132.19312-2-pvorel@suse.cz>
 <033366de-ed10-f494-600a-51aed8639613@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <033366de-ed10-f494-600a-51aed8639613@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] tst_test.sh: Warn about setup/cleanup
 function not loaded
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi J=F6rg,

> this looks good, just one small typo. And I guess I would raise this to
> TBROK, but that
> is just my personal preference :)
Yes, it could be. I thought TBROK would be for setup (tests results are pro=
bably
invalid without setup) and TWARN for cleanup (well, cleanup is important, b=
ut
results are valid, see other TWARN in tst_test.sh). But I want to be consis=
tent
=3D> use TBROK.

> Am 18.05.2020 um 15:01 schrieb Petr Vorel:
> > +		if type "$TST_CLEANUP" >/dev/null 2>&1; then
> > +			$TST_CLEANUP
> > +		else
> > +			tst_res TWARN "cleanup function set (TST_SETUP=3D'$TST_CLEANUP'), b=
ut not found (test bug)"
> This should probably be TST_CLEANUP=3D....
Thanks!

Kind regards,
Petr

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
