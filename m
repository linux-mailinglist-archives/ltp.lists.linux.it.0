Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB0B3FFC69
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 10:55:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 60EF23C2906
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 10:55:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 82C9E3C2833
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 10:55:43 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A74751A01111
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 10:55:42 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0C3132239F;
 Fri,  3 Sep 2021 08:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630659342;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GVbwirN8pQUo6+KL7EP2eoDad5Rp/Qk9PI1iJOrCwak=;
 b=HjMRvOFom8OhSJzV4XqMoXzVBSY8EnYOX7Kz9Dx5aNLLkB+aXyYHW68F1tHR8JZjSFlQXK
 dciee/dQhj8+u6w6ITgCrYgsVvZyBSHhqkdzj/4g3XkJR/ZT0RAL541JXew3tzZ2oIyZrv
 TBLJuPkp1lz/Q6Wr4G8HUrJrrX3oN38=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630659342;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GVbwirN8pQUo6+KL7EP2eoDad5Rp/Qk9PI1iJOrCwak=;
 b=IE7JNpuEo+GoamCIApjV4wkHqO04IQiERG4eD3hvh+mMu1P03ENNVR4MMF2W7w8fz4dqUf
 HnfU/E5Dqm79NZAg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id D1DDE1374A;
 Fri,  3 Sep 2021 08:55:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id tEOlMQ3jMWG4dQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 03 Sep 2021 08:55:41 +0000
Date: Fri, 3 Sep 2021 10:55:40 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YTHjDNd3FUuaLo2S@pevik>
References: <20201116220325.413764-1-pvorel@suse.cz>
 <689bea29-9717-1b2a-a53f-4b3a7f9f4e9b@oracle.com>
 <YS9u/k/b7lM/l1ki@pevik>
 <a07de84c-5251-9e46-afac-84544247534b@bell-sw.com>
 <YTD/rU/ohgp8p5Zc@pevik>
 <a0b2df49-b8bb-6968-fed8-50ff3fd33543@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a0b2df49-b8bb-6968-fed8-50ff3fd33543@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Cc: ltp@lists.linux.it, Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alexey,

...
> >> Why not move add_macvlan() to the virt_lib.sh, I think this lib is better
> >> suited for creating macvlan?
> > Well, route-change-if.sh and route-change-netlink-if.sh depends on helpers from
> > route-lib.sh. Using both libraries would require little changes, but sure it's
> > possible (+ add obviously add $virt_type).

> > It's just a bit strange to add this special purpose function when there is
> > virt_add() and virt_add_rhost(). Best will be probably to add macvlan to these
> > functions and migrate router tests which needs macvlan to use virt_lib.sh before
> > route-rmmod.sh using it.

> Yes, it would be better to have the generic ones, moreover macvlan01/macvlan02
> tests are already calling virt_add().
+1.

> > In the long term I'd really prefer to add some TST_NET* variable (due doc
> > generation via docparse), but that can be postponed as another effort after the
> > release (I thought it'd have to be in tst_net.sh so that tests does not care
> > about including virt_lib.sh when declaring it, but variable could also have
> > prefix TST_NET_VIRT_ to make it obvious, that virt_lib.sh must be loaded. But I
> > still prefer moving to tst_net.sh when implementing this approach).

> > BTW you consider ok to use macvlan for testing this? I suppose this test was
> > intended to be used on the real hardware not on virtualization. But I don't have
> > proper setup and give up on this approach.

> I think we are not changing the purpose of this test using a virtual
> driver. Using the real drivers would complicate the test setup
> unnecessarily considering what it does with the driver...

+1

Thanks for your input!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
