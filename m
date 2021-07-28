Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F34493D8E8A
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jul 2021 15:08:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 520B23C903C
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jul 2021 15:08:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 16BF83C1882
 for <ltp@lists.linux.it>; Wed, 28 Jul 2021 15:08:14 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 96EF31000F62
 for <ltp@lists.linux.it>; Wed, 28 Jul 2021 15:08:14 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1144622305;
 Wed, 28 Jul 2021 13:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627477694;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HLjvJAZcm5/HnvrBB7jb5HXQNXAAKRJbnHiVW2HYy9c=;
 b=MivaVXHNQdJiFvE9jP7A9WlspsJj9KkED8lrsOZWWwHHmu5ngSJenMT6ALyPQjTQlY4/o3
 Fvf5klVuwa2gbrQfX82Wd5bV0+exFw45AD46ZGdZ5HBs818T5flN/i8Q02ksMVXXhwibqb
 ZIZQg7sHEiCONDmZA9Q6aKfKiZLp3tc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627477694;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HLjvJAZcm5/HnvrBB7jb5HXQNXAAKRJbnHiVW2HYy9c=;
 b=ta+DayQ1HMsI6F5yJnsFpsTI8uIItiPkwORQgECpwpdnAVELwdLjb7l4Qmta9c5DOIknDF
 al42LvWLKywudoCQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id D8EBF13318;
 Wed, 28 Jul 2021 13:08:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id FKxtMr1WAWGtYwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 28 Jul 2021 13:08:13 +0000
Date: Wed, 28 Jul 2021 15:08:07 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YQFWt/NcacYfVt9R@pevik>
References: <20210714140716.1568-1-pvorel@suse.cz>
 <20210714140716.1568-3-pvorel@suse.cz>
 <57d4c109-d01a-2c7f-39c7-41013e70abf9@bell-sw.com>
 <YQBD4w2nKwY2G1l+@pevik>
 <b0638d98-88d5-76d7-78a1-631c801d88ad@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b0638d98-88d5-76d7-78a1-631c801d88ad@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] broken_ip: TCONF when test run on unsupported
 protocol
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

> Hi Petr,
> On 27.07.2021 20:35, Petr Vorel wrote:
> > Hi Alexey,

> >> On 14.07.2021 17:07, Petr Vorel wrote:
> >>> net_stress.broken_ip runtest file is correct, but some users try to run
> >>> tests manually.

> >>> Fixes: #843

> ...
> >>>  do_test()

> >> The generic version looks fine:

> >> Reviewed-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>

> > I didn't understand whether you'd prefer to add TST_IPV6=6 (or TST_IPV6=) where
> > needed or accept this patchset. Both would work.

> I think for manual runs it is better to set TST_IPV6=6 in the test
> so it will run the test rather the require passing some options.
+1.

Kind regards,
Petr


> > Kind regards,
> > Petr



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
