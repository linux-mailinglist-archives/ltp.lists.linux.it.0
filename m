Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C34194DD540
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Mar 2022 08:31:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E91F3C9477
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Mar 2022 08:31:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 044DE3C8C94
 for <ltp@lists.linux.it>; Fri, 18 Mar 2022 08:31:39 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 776B1601622
 for <ltp@lists.linux.it>; Fri, 18 Mar 2022 08:31:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7071C1F38E;
 Fri, 18 Mar 2022 07:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1647588698;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fg2NfRsJWT5gfxMaUIFiAhzG5JVJM4Df5K0bmVaavtw=;
 b=ihmPHKvDBcAaFZvcplFnMNbT2tSuXeRiGGTBu3fljKiYggAcLQnxmZ7EtrsWbEW2/dPyXw
 pTujf4xqQHEA7FouDTfuOusGbMAVz7N+ZSWdCpcBVxzHSxrEDG6Nk6QHTtQqJ9OeFM+Ksd
 716p0aUvSWll8fANfNYHp5Lmv9KdSB4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1647588698;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fg2NfRsJWT5gfxMaUIFiAhzG5JVJM4Df5K0bmVaavtw=;
 b=bRDfD9YRuF/f4aTiWtnPyZ5Hm8O0gpaJyZZPEDNjQQSV8OxnurBrUY5Wn3s4LZyPiBDFRc
 WfNN0IluzmpaUjCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 37AC012FC5;
 Fri, 18 Mar 2022 07:31:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id t+PtClo1NGLKEQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 18 Mar 2022 07:31:38 +0000
Date: Fri, 18 Mar 2022 08:31:36 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YjQ1WKtV0amHh4Aq@pevik>
References: <20220316150429.2873-1-pvorel@suse.cz> <YjH9dDef3w7Iu3vG@pevik>
 <CAEemH2cB+k+dbS_N=S0jGs9H3ct1wBUYhuaR-+V7wRVtydVN_g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cB+k+dbS_N=S0jGs9H3ct1wBUYhuaR-+V7wRVtydVN_g@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC][PATCH 1/1] ci: Ubuntu xenial -> bionic
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li, Cyril,

> Hi Petr,

> On Wed, Mar 16, 2022 at 11:08 PM Petr Vorel <pvorel@suse.cz> wrote:

> > Tested

> > * bionic
> > https://github.com/pevik/ltp/actions/runs/1993375270

> > * focal
> > https://github.com/pevik/ltp/actions/runs/1993443143

> > And as I noted xenial still works. I wanted to avoid false positives when
> > repos
> > get down, but obviously we have 4 years time (ends in 01 Apr 2026).


> +1 for bionic. (we can do an upgrade to focal when bionic reach EOL)

> According to the release cycle page[1] of ubuntu ORG, the
> Xenial (16.04) version is being deprecated, which means
> no hardware and maintenance updates anymore. But we (LTP)
> still merging new features and regression testcases, I'm afraid
> that will bring some known failures in Xenial then to cost energy
> for debugging.

So you'd keep Xenial until the end of it's Extended Security Maintenance (ESM)
support in 2026? I'm not sure myself if it's a good idea to drop Xenial now and
solve these problems. Maybe we should hold this change for some time.
And if we upgrade to bionic, it would be good to finish a docs of supported
kernel/(g)libc/distro versions.

Kind regards,
Petr

> [1]https://ubuntu.com/about/release-cycle

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
