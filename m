Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B03A343ACF5
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Oct 2021 09:13:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7A6523C6731
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Oct 2021 09:13:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 633B73C6626
 for <ltp@lists.linux.it>; Tue, 26 Oct 2021 09:13:24 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 249702010BD
 for <ltp@lists.linux.it>; Tue, 26 Oct 2021 09:13:23 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1A25C21940;
 Tue, 26 Oct 2021 07:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635232403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pdIlvWfJl13O3bJ5qWBAeqJfAIOu/FT+PstP7GOOjkQ=;
 b=hcyYswUfZ/pUgDFF4Z1fTh9P9JFpY06JtjAPorlbZg81pU1ggQL7cQ6A0kfIGjQdfSEDqN
 iHXxqTuzdFH7qmZuiYtolIHsyIug9NK0tqFRhvjhNmdtHfTt53YwZiCq+fTvacLJOl4tIQ
 mNLjUyfOGwY+3EMjc7qkIk3TEczAijA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635232403;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pdIlvWfJl13O3bJ5qWBAeqJfAIOu/FT+PstP7GOOjkQ=;
 b=n44gwElQAJ+9GNDBJeUoprgvExSj6FRTQVgPcPv7ttY4+DMnXDkY5k3tW4MA5zAAEFhLXj
 jHyxH8fF6FIrc6BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F01DA13CCA;
 Tue, 26 Oct 2021 07:13:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 16ugOZKqd2F6LwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 26 Oct 2021 07:13:22 +0000
Date: Tue, 26 Oct 2021 09:14:12 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YXeqxPwYuAVvrMdv@yuki>
References: <20211025160134.9283-1-chrubis@suse.cz>
 <20211025160134.9283-7-chrubis@suse.cz>
 <CAEemH2dQcUW5k3Rv-n3=CrznqwpFta3P28QrB0oVZPZH6PyNuw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dQcUW5k3Rv-n3=CrznqwpFta3P28QrB0oVZPZH6PyNuw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 6/6] lib: Add tst_set_runtime() & remove
 tst_set_timeout()
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Rarely there is a need to set the test runtime dynamically, the only
> > tests in LTP that does this are the timer tests that can get two
> > parameters, number of iterations and sleep time, and the test runtime is
> > close to the multiplication of these two.
> >
> > It's still cleaner to set the runtime and let the test library figure
> > out the timeout in this case.
> >
> 
> If so, should we consider to hinden the .timeout in struct tst_test
> to prevent users from changing it?

If we decide to apply this patchset that would be logical end result.
There are only a few .timeout = foo left in the codebase after this
patchset that either disable timeout for the few unpredictable cases or
shorten it to make the test timeout faster if it gets stuck. We can deal
with these by making the .max_runtime accept -1 and by shortening the
default timeout considerably.

> IIRC, we currently have ".timeout == -1" to disable test timed
> out in unsure situation, e.g some OOM tests. But in this patch,
> I saw you remove that, but not handle it in tst_set_runtime.

Ah, right, I've removed the timeout == -1 handling by mistake. I wanted
to keep it working after this patchset as well until a follow up
patchset deals with the rest of the tests that set the .timeout.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
