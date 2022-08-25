Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E325A192A
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Aug 2022 20:53:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0F0DE3CA49A
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Aug 2022 20:53:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 825413C136F
 for <ltp@lists.linux.it>; Thu, 25 Aug 2022 20:53:36 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9E8871A00682
 for <ltp@lists.linux.it>; Thu, 25 Aug 2022 20:53:35 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7AC9520613;
 Thu, 25 Aug 2022 18:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1661453614;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DsXqdW4CKAv2FoKfLjjKvutXhhfTZgEudveNj5rq+zg=;
 b=phfw9+AE3WLjnrzueIaS1wgYz+1CqDwt/HljuK4YO5qnwFYGLBlgy9rxBn8h6LL8XDWU0y
 Kxwtm2sQgFGie5B56UVGed1a44mL8l8Gq4r4KJb/4C4NAsy09LdrCYk0KdsZNBFLLiSClU
 oPx6AWtR58wyez2SUg7AxBPHGHz7Mi0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1661453614;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DsXqdW4CKAv2FoKfLjjKvutXhhfTZgEudveNj5rq+zg=;
 b=vdxnkKAgyDxo/yy86sAD76d4dNwOo2EaO6BcdL8YO7gtT9Bhfy2E+bG/tItJ9TelOQqvbr
 BaftvNRzg+5fSKBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 414FA13517;
 Thu, 25 Aug 2022 18:53:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gG3KDC7FB2N0MwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 25 Aug 2022 18:53:34 +0000
Date: Thu, 25 Aug 2022 20:53:30 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Luke Nowakowski-Krijger <luke.nowakowskikrijger@canonical.com>
Message-ID: <YwfFKtxuhRG8Wunm@pevik>
References: <20220824215421.90947-1-luke.nowakowskikrijger@canonical.com>
 <YwdWKb/Imzwk5F1V@pevik> <87wnaw1ebh.fsf@suse.de>
 <CADS1e3dmMMsBQggVPBKHdYRwV0pw6277HmBPoHpkL3=b5AN5MQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADS1e3dmMMsBQggVPBKHdYRwV0pw6277HmBPoHpkL3=b5AN5MQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] API/cgroup: Add rdma controller
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

> Hi,

> On Thu, Aug 25, 2022 at 9:24 AM Richard Palethorpe <rpalethorpe@suse.de>
> wrote:

> > Hi,

> > Petr Vorel <pvorel@suse.cz> writes:

> > > Hi Luke,

> > >> There is a test reporting "TBROK: 'rdma' controller is unknown
> > >> to LTP" so lets add the controller.

> > > Out of curiosity: which test?

> > > Reviewed-by: Petr Vorel <pvorel@suse.cz>

> > > Kind regards,
> > > Petr

> > I'm not sure, I think it was one of the shell tests which tries to mount
> > all the controllers. Anyway, merged thanks!


> It looks like cgroup/cgroup_regression_test.sh test 7 was the failing test.
> Li ran into this earlier too I think.

Thanks for info!

Kind regards,
Petr

> Thanks for merging :)

> Thanks,
> - Luke

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
