Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B28522FCF4A
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 13:11:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01F1E3C63EC
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 13:11:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id B27513C2863
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 13:11:38 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7A9DD200B3F
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 13:11:37 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A7E69B74C;
 Wed, 20 Jan 2021 12:11:36 +0000 (UTC)
Date: Wed, 20 Jan 2021 13:11:35 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YAgd95cI0527bXa8@pevik>
References: <20210118161308.30771-1-pvorel@suse.cz> <YAaNR0PzZt5A1Fjm@pevik>
 <a60fb78b-4441-4f17-d0c2-db50292cfde6@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a60fb78b-4441-4f17-d0c2-db50292cfde6@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] lib: Fix kernel module detection on BusyBox
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
Cc: Steve Muckle <smuckle@google.com>, Sandeep Patil <sspatil@google.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi J=F6rg,

> Hi,

> On 1/19/2021 8:41 AM, Petr Vorel wrote:
> > Hi,

> > > diff --git a/lib/tst_kernel.c b/lib/tst_kernel.c
> > ...
> > > -int tst_check_driver(const char *name)
> > > +#ifndef __ANDROID__
> > > +# define MODULES_DIR "/lib/modules"
> > > +#else
> > > +# define MODULES_DIR "/system/lib/modules"
> > > +#endif
> > OK, MODULES_DIR is not needed now as I kept Android skipped (unless som=
ebody
> > contributes code or share algorithm for Android).
> I don't get this comment. MODULES_DIR is used in both code paths in
> tst_search_driver.
Please have look at v3, where I removed MODULES_DIR
https://patchwork.ozlabs.org/project/ltp/patch/20210119160316.4776-2-pvorel=
@suse.cz/

> But you don't call it from tst_check_driver only if it is not android.
> If tst_search_driver is supposed to be a new public interface, it should =
be
> added to the header,
> otherwise it should be marked static.
+1 I'll make it static.

Kind regards,
Petr

> J=F6rg

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
