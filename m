Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 553905B698B
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Sep 2022 10:29:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B1AB3CAAEA
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Sep 2022 10:29:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 16F823CA900
 for <ltp@lists.linux.it>; Tue, 13 Sep 2022 10:29:23 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 75FD41A00F32
 for <ltp@lists.linux.it>; Tue, 13 Sep 2022 10:29:22 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 73EFD5BFED;
 Tue, 13 Sep 2022 08:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663057762;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WQKE6VatuS/gQxhAq7naOC2hIqjwNKuL9WjlPkBOpQI=;
 b=ofkaPU4WvSmP3bY4XkjigU49ImDLFSY+7TeqmViDrBpw47HWltSTMV0z9fFlKTH/nsmCxp
 IfFsw9A7+3hkgW2IVlocQqFFcxTVzhRIk/c4jaAFrFslMSTfTFgpN018yPZ1Rq0bB+j7Yp
 Aw4GjNCjDB4Nx0pz2has4tmEaVfo+pw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663057762;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WQKE6VatuS/gQxhAq7naOC2hIqjwNKuL9WjlPkBOpQI=;
 b=5jbmQATLXvSGD7m9lS6+T8OLnypEFwuh4DgHOcyAUrtZRjj662fqcRjm9sq862kwIaJNcQ
 ijwPkPXjNAiOveAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4B3F0139B3;
 Tue, 13 Sep 2022 08:29:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S64gEWI/IGMOGQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 13 Sep 2022 08:29:22 +0000
Date: Tue, 13 Sep 2022 10:29:20 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YyA/YJqivJ+UmT8l@pevik>
References: <20220905061425.22852-1-luoxiaoyu9@huawei.com>
 <YyAmPYZ2iaraxraN@pevik>
 <CAEemH2cZ2gkYxiTyPzmzaDmbqcnvxy3uQzunAzj0jRR7CjqAtg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cZ2gkYxiTyPzmzaDmbqcnvxy3uQzunAzj0jRR7CjqAtg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] pty04.c/pidfd_send_signal03.c: Drop redundant
 tst_reap_children()
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

> On Tue, Sep 13, 2022 at 2:42 PM Petr Vorel <pvorel@suse.cz> wrote:

> > Hi Luo,

> > > Drop redundant calling of tst_reap_children() in cleanup() since
> > > it has been called in the API (run_tests()).

> > LGTM, I suppose that was a mistake.


> Hmm, I slightly think that reflact a cautious thought from the author,
> in case of test hit tst_brk unexpectly with invoke cleanup it can also
> do reap children.

> So, it's probably no harmful to keep tst_reap_children there.
Ah, thx for info. I set status rejected in patchwork.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
