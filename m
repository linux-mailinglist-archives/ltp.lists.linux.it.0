Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F0B3CB577
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 11:51:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C3D33C71EC
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 11:51:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 818633C4CF2
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 11:51:31 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CEF3E1A0088A
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 11:51:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DC77822B82;
 Fri, 16 Jul 2021 09:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626429089;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XJnpuHmi+3v/llzI5zZcyUJ3jWfctmub93fTSJ/uze8=;
 b=LfPUukEQtuFZCdeZi5WrKIMVfj0mMOGIwwET7bGs958jxfoGnapkSPNKZqoAJDSLdUUWrc
 /o08vO9gExCIlmKLh74fCQjs+HcTbOzdDBVGBc3nHar+o47s3V8ZM8l9xi+A4ab0Bi9YxN
 l/WZXRUPrjvggk209OvZzC2Zmzu4Lag=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626429089;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XJnpuHmi+3v/llzI5zZcyUJ3jWfctmub93fTSJ/uze8=;
 b=D8CVz69paIQHvLvksvUfZJFwPoNjMwC8Tqa8m3r3foxPtt/vKP2g6buIGP7xAWzK/zC6Ni
 10uzsB+peAyEdsAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E31213BB7;
 Fri, 16 Jul 2021 09:51:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id td8rI6FW8WBLfwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 16 Jul 2021 09:51:29 +0000
Date: Fri, 16 Jul 2021 11:51:27 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YPFWn+/sbK1vlJKt@pevik>
References: <20210715102813.106843-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2cXAY8KSFNNv8_23uSs-wRaResAkTPmPyZQNN6UwcMcgA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cXAY8KSFNNv8_23uSs-wRaResAkTPmPyZQNN6UwcMcgA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] crypto/af_alg02: use pthread_tryjoin_np() instead
 of pthread_kill()
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

> Hi Alexey,

> On Thu, Jul 15, 2021 at 6:29 PM Alexey Kodanev <aleksei.kodanev@bell-sw.com>
> wrote:

> > musl doesn't return ESRCH for pthread_kill() if thread id is not found.
Maybe ask on MUSL mailing list?

> > POSIX only recommends to return ESRCH, and also says that pthread_kill()
> > produces undefined behavior if tid lifetime has ended [1].

> > [1]: https://man7.org/linux/man-pages/man3/pthread_kill.3.html

> > Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
> > ---
> >  testcases/kernel/crypto/af_alg02.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)

> > diff --git a/testcases/kernel/crypto/af_alg02.c
> > b/testcases/kernel/crypto/af_alg02.c
> > index 31d30777c..0f5793c16 100644
> > --- a/testcases/kernel/crypto/af_alg02.c
> > +++ b/testcases/kernel/crypto/af_alg02.c
> > @@ -60,7 +60,7 @@ static void run(void)

> >         TST_CHECKPOINT_WAIT(0);

> > -       while (pthread_kill(thr, 0) != ESRCH) {
> > +       while (pthread_tryjoin_np(thr, NULL) == EBUSY) {


> I'm not sure if safe enough to use because it is nonstandard GNU extensions
> and the "_np" means nonportable.
Others please double check, but pthread_tryjoin_np() seems to be in uclibc-ng
and musl (+ of course in glibc). It's only missing in bionic (it looks like
people would like to have it [1]).

> Maybe another workaround is to define a volatile flag 'thread_complete',
> initialize it to '0' when thread_B starts and reset to '1' while exit, and
> just
> do a value check in the while loop of thread_A should acquire thread_B
> status.
> Is this way a bit better?
Sounds as reasonable workaround for me.

Kind regards,
Petr

[1] https://github.com/kito-cheng/android-checkpoint/blob/master/bionic/0003-bionic-Implement-pthread_tryjoin_np.patch

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
