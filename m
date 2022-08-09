Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5742458D377
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Aug 2022 08:00:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF2C03C9539
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Aug 2022 08:00:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 328433C1B37
 for <ltp@lists.linux.it>; Tue,  9 Aug 2022 08:00:17 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1A4FA1A0080C
 for <ltp@lists.linux.it>; Tue,  9 Aug 2022 08:00:16 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6264033CD4;
 Tue,  9 Aug 2022 06:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1660024816;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yNgHyJZG3r0n7GqOPwwXi/fLSQ8OnicxYnCk9IrZSLY=;
 b=iqr8c7g77KZ+Iw1h0NFMvwso3IleoCd8lP/4PElCHzSUgxigC+UpFU7eam7fG7MpvxYLM4
 W4ZWZ0qGEWJrIQXp7Ilx4SVRcBhFzqXLvb1vkipXDxdqCLGKCrPmxdaiMWA+YiZvb1Yvir
 onaP6c6PAZgC5zf9S9jcz9xMkdVVuFY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1660024816;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yNgHyJZG3r0n7GqOPwwXi/fLSQ8OnicxYnCk9IrZSLY=;
 b=Gq+XxkV+VRVtWVGR3rWCVNhJ1zutij3cj+t2AcPHPTA42lEbYjRvQ26EMugsGMGcNsf67L
 FwndoCVnruiDB+DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3278C13AA1;
 Tue,  9 Aug 2022 06:00:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1kuiCvD38WIUUwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 09 Aug 2022 06:00:16 +0000
Date: Tue, 9 Aug 2022 08:00:14 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Luke Nowakowski-Krijger <luke.nowakowskikrijger@canonical.com>
Message-ID: <YvH37lGsfy1a8KRT@pevik>
References: <20220701213749.3744031-1-edliaw@google.com>
 <CAEemH2cQBinVjFP27NkRQJpEVCvfA08=gxdb5tk1nDRo0eN_nA@mail.gmail.com>
 <CADS1e3eAZ13nKP4Yq2MX0Xz5dOFR3ZuzF+HVJF7CsptSUgmbkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADS1e3eAZ13nKP4Yq2MX0Xz5dOFR3ZuzF+HVJF7CsptSUgmbkQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] controllers.memcg_regression: add trap to
 clean up directories
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
Cc: kernel-team <kernel-team@android.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> Hey,

> On Tue, Jul 5, 2022 at 11:00 PM Li Wang <liwang@redhat.com> wrote:

> > Hi Edward,

> > Thanks for your patch and I believe it makes sense.
> > But the whole memcg test has been re-written by Luke's patchset which is
> > still reviewing.
> > https://lists.linux.it/pipermail/ltp/2022-April/028777.html

> > @Luke Nowakowski-Krijger <luke.nowakowskikrijger@canonical.com>
> > Luke, I guess V3 should be the final version (if you take the time to do
> > rebase/modification) and we'll happy to help merge those patches next:).


> Let me finally get around to putting up the (hopefully) final revision so
> that people don't start doing things I already did :)

Thanks Luke!

Edward, FYI Luke fixed this in his big cleanup
https://patchwork.ozlabs.org/project/ltp/list/?series=311414&state=*

Therefore closing this in patchwork as "Not Applicable".

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
