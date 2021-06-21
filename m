Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E49E3AE4A7
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 10:19:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 295743C704B
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 10:19:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 487143C3193
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 10:19:28 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 979C6600831
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 10:19:27 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CE1D721989;
 Mon, 21 Jun 2021 08:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624263566;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GZqUdg7l8zIuYrrGVek/oUkTOUHq7DmhoZHix8DzTQM=;
 b=EHtqPT8lv2HGTFvGZgLNM4Mo9sTXPWGzU6RXieV1gE/bSVFefKUD3JZ35ye3sQyfAe4BuP
 7/8QNR6LONDtI6PLtFSRWRGGC1ImzgpoFYxaZu/JwCdx1BVYD8akO8E1/mlD+Qo5nU3v5X
 SMx/ccTOfIRo2Xxuj0ug0Wu8Xm5rccE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624263566;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GZqUdg7l8zIuYrrGVek/oUkTOUHq7DmhoZHix8DzTQM=;
 b=07umfBV4LLpggZAjjRDWpMxTpWpJzgDlRO97TVxR7noRfGhzh+0pWH3uZlLA5vVtTPXUH6
 7G9/ODSC5n+4MrCQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 90B0A118DD;
 Mon, 21 Jun 2021 08:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624263566;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GZqUdg7l8zIuYrrGVek/oUkTOUHq7DmhoZHix8DzTQM=;
 b=EHtqPT8lv2HGTFvGZgLNM4Mo9sTXPWGzU6RXieV1gE/bSVFefKUD3JZ35ye3sQyfAe4BuP
 7/8QNR6LONDtI6PLtFSRWRGGC1ImzgpoFYxaZu/JwCdx1BVYD8akO8E1/mlD+Qo5nU3v5X
 SMx/ccTOfIRo2Xxuj0ug0Wu8Xm5rccE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624263566;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GZqUdg7l8zIuYrrGVek/oUkTOUHq7DmhoZHix8DzTQM=;
 b=07umfBV4LLpggZAjjRDWpMxTpWpJzgDlRO97TVxR7noRfGhzh+0pWH3uZlLA5vVtTPXUH6
 7G9/ODSC5n+4MrCQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id giTcIY5L0GB+IgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 21 Jun 2021 08:19:26 +0000
Date: Mon, 21 Jun 2021 10:19:25 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YNBLjbu7DleeTnQQ@pevik>
References: <20210519063109.224352-1-lkml@jv-coder.de>
 <20210519063109.224352-2-lkml@jv-coder.de> <YKToUgBnK6ZQ5I0Q@yuki>
 <2f8e652b-aaa8-5f98-4f9d-5b7c138c17fa@jv-coder.de>
 <YNA+6shWiWYRNi2P@pevik>
 <3fd9fb2f-3242-5268-eef3-0e5aa4faecef@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3fd9fb2f-3242-5268-eef3-0e5aa4faecef@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] shell: Extend timeout tests,
 to run on multiple shells
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

Hi Joerg,

> Hi Petr,

> On 6/21/2021 9:25 AM, Petr Vorel wrote:
> > Hi all,

> > I wonder what is the state of this patchset?
> > Do we still consider it?
> I still think this should be included, but we can drop shells if you like.
> > Apart from reducing shells (i.e. which distro has ash, which is not
> > alias to other shell in the list) I'm not against non-default shells, b=
ut I
> > don't like how whole test gets complicated by this.

> > Also we're reinventing wheel with printing results, checking whether te=
st exist
> > etc. Maybe using test API for this?
> I know that this is reimplementing a lot of stuff, but I think I tried us=
ing
> the lib (a bit strange using the object under test to test it, but would =
be
> ok for me), but failed to do so.
> I guess this was because it uses traps and the set -m stuff, but I am not
> sure anymore.
Yes, using lib for testing it's a bit strange. But test_timeout.sh is alrea=
dy
messy and patch increases it even more. I'd prefer to implement the test
coverage in a cleaner way. Probably to create some very basic testing libra=
ry,
a wrapper of actual tests.

There was some effort [1], based on my previous work, which concentrated on
having metadata of expected output. That allows to run tests which TBROK by
purpose (quite a lot of tests). I plan to get back to it, but but first I'd=
 like
to create make target for running tests [2].

Kind regards,
Petr

> J=F6rg

[1] https://patchwork.ozlabs.org/project/ltp/patch/ce675759672af52bea02c11d=
51bd7d10f0bcb5cb.1566500817.git.clanig@suse.com/
[2] https://patchwork.ozlabs.org/project/ltp/patch/20210618191252.12403-1-p=
vorel@suse.cz/

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
