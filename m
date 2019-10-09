Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 708B4D08DC
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 09:53:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 305673C207C
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 09:53:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 538003C0DFD
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 09:53:14 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7EFEC600F0D
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 09:51:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9D531B009;
 Wed,  9 Oct 2019 07:53:12 +0000 (UTC)
Date: Wed, 9 Oct 2019 09:53:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20191009075309.GA641@dell5510>
References: <20191009061619.48677-1-lkml@jv-coder.de>
 <20191009061619.48677-3-lkml@jv-coder.de>
 <20191009065225.GA27854@dell5510>
 <fa4c146c-2916-2b65-449d-daf12838ce35@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fa4c146c-2916-2b65-449d-daf12838ce35@jv-coder.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] tst_test.sh: Add public tst_test_root command
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

> > You need to replace s/_tst_require_root/tst_test_root/ in other library=
 files
> > (tst_net.sh, tst_security.sh).
> Sorry, did not expect functions with _ to be used in other files.
> I'll check it next time
No problem :). Yes, they cannot be used in tests. But new shell API library=
 is spread in 3 files.
I added a patch to document library itself from developer perspective [1].

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/patch/1166786/

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
