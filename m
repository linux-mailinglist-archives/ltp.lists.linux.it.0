Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F25EE4390E4
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Oct 2021 10:10:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 250F43C6550
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Oct 2021 10:10:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 406443C26A5
 for <ltp@lists.linux.it>; Mon, 25 Oct 2021 10:10:49 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A9B2B600F4B
 for <ltp@lists.linux.it>; Mon, 25 Oct 2021 10:10:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9301E218F6;
 Mon, 25 Oct 2021 08:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635149447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cfDabh4PrVj3BUcf4AOi9YkZY+2BAGXNriB8VSiu6hU=;
 b=hsJrUBzCkgl0w0gOq7xFVN+JuXfoC3gR8Ge7i006FqYO3g5JlbdbSAEdofu9/Y80NIwUmF
 gHQeCDsGa9+q7JJmIx3svnYfge1XFuGTzVpQloADP76oP44i6cHjLs7PcGXTziin0+hBRA
 M8m4udqZPB5Pwzrn9qiLOpmd1VbPm8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635149447;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cfDabh4PrVj3BUcf4AOi9YkZY+2BAGXNriB8VSiu6hU=;
 b=stF7GK57jeQqV7S1tfqAnozxxcfmBK5+y0jJsSpkmA9wgy26u85xRoXxskale0Tmem4+SD
 kRAkQ5f2YUZQRZBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7F76D1377E;
 Mon, 25 Oct 2021 08:10:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SY+9HYdmdmEWIAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 25 Oct 2021 08:10:47 +0000
Date: Mon, 25 Oct 2021 10:11:36 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YXZmuCPM1kdBG/eo@yuki>
References: <20211022043806.19171-1-tangmeng@uniontech.com>
 <CAEemH2dOJWGqji+2nYg8X9eKZfFeJPhn0pV2TX6UovS9M_=_Tg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dOJWGqji+2nYg8X9eKZfFeJPhn0pV2TX6UovS9M_=_Tg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] link/link02: Convert to new API
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
Cc: tangmeng <tangmeng@uniontech.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Plz stop sending the same patch again and again. It looks
> like an email bomb to the mailing list.

Partly my mistake, when I looked at the list of patches for moderation I
didn't realized that this is one patch send many times, sorry for that.

However Tang if you email to a ML is held for moderation please wait
instead of resending, I do reviewe the held emails nearly daily so the
delay shouldn't be worse than a day or two. Also if you sing up to the
ML the emails would go right through.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
