Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E962EA996
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 12:12:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D0C53C31F1
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 12:12:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 8CE183C0354
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 12:12:08 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3516160073C
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 12:12:07 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5A77EAF37;
 Tue,  5 Jan 2021 11:12:07 +0000 (UTC)
Date: Tue, 5 Jan 2021 12:12:05 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Radoslav Kolev <radoslav.kolev@suse.com>, ltp@lists.linux.it
Message-ID: <X/RJhbNBfja6/Snr@pevik>
References: <20201221110120.26165-1-radoslav.kolev@suse.com>
 <20201222171033.GB126602@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201222171033.GB126602@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpio_tests.sh: Fix failure with BusyBox cpio
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Radoslav,

...
> > +
> > +if cpio 2>&1 | grep -q '\-o\sCreate (requires -H newc)'; then
Thanks for your fix, merged with these changes:

* grep for BusyBox because some older versions does not contain the
hint, but actually require it.

* move things to setup function due my following commit, which cannot be
outside API functions (setup/test function):
And check for -o (which is on BusyBox optional).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
