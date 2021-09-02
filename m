Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4DA3FF1C2
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 18:45:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D28A3C9921
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 18:45:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1365E3C299A
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 18:45:36 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7332F60091A
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 18:45:36 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A0A281FFED;
 Thu,  2 Sep 2021 16:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630601135;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OxIGWc9JsH1hhC5zsEC0V1YMrfIs0aikOcEFZmJpEss=;
 b=x+aQ+r8sjIPigtNivbPpfB3UmBjujTjr8AV8/hSLx3GDqcceoaSsJgYOEGKw9/n1tV6Itp
 Gu3ZX6VFpFcuG1UfIajWnm/Jml2XHboHi3sMiJvcFS2DrK4WPXuR76urYfQt98BUJYVcP6
 nr1FguY9oNz8nqPjJ0fAWhxcSs9+Ktk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630601135;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OxIGWc9JsH1hhC5zsEC0V1YMrfIs0aikOcEFZmJpEss=;
 b=Dl4a+nWauKHqwPe2LHsY5KXomv2lP0VumPCCg3+Up3/Dd9nrfj/8Qj0+KxHuTl9bM1f0N0
 VBxt6OGLOXX/tjAw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 6758813AC7;
 Thu,  2 Sep 2021 16:45:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id s1esF6//MGGuSgAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 02 Sep 2021 16:45:35 +0000
Date: Thu, 2 Sep 2021 18:45:33 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YTD/rU/ohgp8p5Zc@pevik>
References: <20201116220325.413764-1-pvorel@suse.cz>
 <689bea29-9717-1b2a-a53f-4b3a7f9f4e9b@oracle.com>
 <YS9u/k/b7lM/l1ki@pevik>
 <a07de84c-5251-9e46-afac-84544247534b@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a07de84c-5251-9e46-afac-84544247534b@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] net/route: Rewrite route-rmmod to new API
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
Cc: Alexey Kodanev <alexey.kodanev@oracle.com>, ltp@lists.linux.it,
 Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alexey,

<snip>
> >> BTW, why not using add_macvlan() in route_lib.sh (or gre, vxlan, etc.)
> >> and remove that driver, so that this test can be run with custom setup, and
> >> with remote host setup?

> > Looking into this old patch, it looked to me quite bad approach to move
> > add_macvlan() into tst_net.sh to be reused (you didn't suggested that, that's
> > what I'd do to prevent the duplicity).

> Why not move add_macvlan() to the virt_lib.sh, I think this lib is better
> suited for creating macvlan?
Well, route-change-if.sh and route-change-netlink-if.sh depends on helpers from
route-lib.sh. Using both libraries would require little changes, but sure it's
possible (+ add obviously add $virt_type).

It's just a bit strange to add this special purpose function when there is
virt_add() and virt_add_rhost(). Best will be probably to add macvlan to these
functions and migrate router tests which needs macvlan to use virt_lib.sh before
route-rmmod.sh using it.

In the long term I'd really prefer to add some TST_NET* variable (due doc
generation via docparse), but that can be postponed as another effort after the
release (I thought it'd have to be in tst_net.sh so that tests does not care
about including virt_lib.sh when declaring it, but variable could also have
prefix TST_NET_VIRT_ to make it obvious, that virt_lib.sh must be loaded. But I
still prefer moving to tst_net.sh when implementing this approach).

BTW you consider ok to use macvlan for testing this? I suppose this test was
intended to be used on the real hardware not on virtualization. But I don't have
proper setup and give up on this approach.

Kind regards,
Petr

> > But much better approach would be IMHO to move virt_add() and virt_add_rhost()
> > from virt_lib.sh to tst_net.sh and adjust it not to be too tight to virt_lib.sh.
> > I suppose $virt_type should became $2 (second parameter).

> > Also there could be moved from virt_lib.sh to tst_net.sh: e.g. add flag
> > TST_NET_ADD_VIRT_TYPE (e.g. macvlan, gre, ...) and doing setup and cleanup
> > there. We could reduce code and document which virt drivers are used.

> > route-change-netlink-if is the only test which needs to call tst_init_iface()
> > (to add routes), virt_lib.sh does not need it.

> > Kind regards,
> > Petr



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
