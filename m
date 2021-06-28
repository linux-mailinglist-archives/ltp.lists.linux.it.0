Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA583B6967
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 22:00:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B4AB03C6E4A
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 22:00:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CFDCD3C19DA
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 22:00:14 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D92FC1A00914
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 22:00:13 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0C43621AA3;
 Mon, 28 Jun 2021 20:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624910413;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K2n1a06iOylzsQxPACnS7PuTzJraGAG4n86Fkf7Qvlc=;
 b=fYJD3B7hvJ4tFgsPxVqYBj1X/8GIGu4twJLSm5Y4bhJwQuefrEiDD3xootyIuWeklcRAGw
 pX6MAzngJ1jqJgOQRMl5/gOcVTDutCU4KEco3fnfLzjfEsjvu90AdhkbCGU6HRBufmZnkX
 vG7p7cvpWAGWnMTjk0/SZ8i5s8gji18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624910413;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K2n1a06iOylzsQxPACnS7PuTzJraGAG4n86Fkf7Qvlc=;
 b=QrdDAkmBv+FdplvXqo6hsijMBy4optT1PMSjVp7Xfsc/+jcMHzjY6UH1f4PvxHXeeO5pQ8
 1EhkXLMQ4jWOW7Cw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 9658A11906;
 Mon, 28 Jun 2021 20:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624910413;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K2n1a06iOylzsQxPACnS7PuTzJraGAG4n86Fkf7Qvlc=;
 b=fYJD3B7hvJ4tFgsPxVqYBj1X/8GIGu4twJLSm5Y4bhJwQuefrEiDD3xootyIuWeklcRAGw
 pX6MAzngJ1jqJgOQRMl5/gOcVTDutCU4KEco3fnfLzjfEsjvu90AdhkbCGU6HRBufmZnkX
 vG7p7cvpWAGWnMTjk0/SZ8i5s8gji18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624910413;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K2n1a06iOylzsQxPACnS7PuTzJraGAG4n86Fkf7Qvlc=;
 b=QrdDAkmBv+FdplvXqo6hsijMBy4optT1PMSjVp7Xfsc/+jcMHzjY6UH1f4PvxHXeeO5pQ8
 1EhkXLMQ4jWOW7Cw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id yDNLI0wq2mCoKgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 28 Jun 2021 20:00:12 +0000
Date: Mon, 28 Jun 2021 22:00:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YNoqSmsDcb2Czlfc@pevik>
References: <20210618130536.54806-1-krzysztof.kozlowski@canonical.com>
 <8753cbfb-01ac-34f9-57d6-afa33629ac78@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8753cbfb-01ac-34f9-57d6-afa33629ac78@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] tpci: fix NULL pointer dereference on wrong
 test invocation
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Krzysztof,

> On 18/06/2021 15:05, Krzysztof Kozlowski wrote:
> > Fix NULL pointer dereference when a ltp_tpci test case is started before
> > choosing the device:

> >     ltp_tpci: test-case 12
> >     ltp_tpci: assign resources
> >     ltp_tpci: assign resource #0
> >     BUG: kernel NULL pointer dereference, address: 00000000000003b8
> >     ...
> >      Call Trace:
> >       dev_attr_store+0x17/0x30
> >       sysfs_kf_write+0x3e/0x50
> >       kernfs_fop_write_iter+0x13c/0x1d0
> >       new_sync_write+0x113/0x1a0
> >       vfs_write+0x1c5/0x200
> >       ksys_write+0x67/0xe0
> >       __x64_sys_write+0x1a/0x20
> >       do_syscall_64+0x49/0xc0
> >       entry_SYSCALL_64_after_hwframe+0x44/0xa9

Merged this one, thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
