Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C214592F24
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Aug 2022 14:45:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 08D3C3C97B2
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Aug 2022 14:45:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9DDD13C1FED
 for <ltp@lists.linux.it>; Mon, 15 Aug 2022 14:44:56 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0FF321400183
 for <ltp@lists.linux.it>; Mon, 15 Aug 2022 14:44:55 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 26C65372BA;
 Mon, 15 Aug 2022 12:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1660567495;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LXf6r32wj1p2GHLn0u62xN2Gd5AiwdzyzA2rjC57cu8=;
 b=Iu+GMgwz6o2eTlFevdhiyUjAQVbH3A4hOK/+a/5I8xpCXiMaDVHK8fdGYHNqpaEYEY86Xn
 Hp5y5u9LylY1sxObP/Q29MLP4drEJ3ufB1JoD74EmCXosdVNLTAjf4ye7S+lW9Zm0a0Y1Q
 8ZjWyhHirsfHcbqGk3iTJP60hhNYwi4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1660567495;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LXf6r32wj1p2GHLn0u62xN2Gd5AiwdzyzA2rjC57cu8=;
 b=RpjG6HY+ViQtvf9LiQVCedRkz+fTZEG+0fvJZ0NbMEctM0lZQkv4vOARtlNX6J1VBOi+OB
 HEs4ClxwL7mGhaCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC87F13A99;
 Mon, 15 Aug 2022 12:44:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mbcIMMY/+mKJMgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 15 Aug 2022 12:44:54 +0000
Date: Mon, 15 Aug 2022 14:44:53 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <Yvo/xaNup1PJCCEv@pevik>
References: <Yvopj0gK5Dg95u+b@pevik>
 <YvowLH8GvMxMWcHH@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YvowLH8GvMxMWcHH@kroah.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] Backport d4ae9916ea29 ("mm: soft-offline: close the race
 against page allocation") to 4.14 and 4.9
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
Cc: Naoya Horiguchi <naoya.horiguchi@nec.com>, stable@vger.kernel.org,
 William Roche <william.roche@oracle.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On Mon, Aug 15, 2022 at 01:10:07PM +0200, Petr Vorel wrote:
> > Hi all,

> > I wonder if there was an attempt to backport d4ae9916ea29 ("mm: soft-offline:
> > close the race against page allocation") from 4.19 to 4.14 and 4.9 (patch does
> > not apply, haven't found anything on stable ML, nor in stable tree git,
> > therefore I assume it was left as not easily fixable).

> As it didn't apply, why not try creating a backport to test this
> yourself?  I'll gladly accept such a thing into the trees if you make
> it.

Hi Greg,

thanks for info, I might give it a try.

Kind regards,
Petr

> thanks,

> greg k-h

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
