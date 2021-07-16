Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DD83CB3DA
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 10:12:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 880703C71CD
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 10:12:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C13BD3C1B5C
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 10:12:36 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D471D6002E4
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 10:12:35 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DE08E1FE81;
 Fri, 16 Jul 2021 08:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626423154;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=721KIQMLBf3Ucbt2BE0yU3IT/o7ZzgeXpmnkt05stA0=;
 b=eaCeaPIKur6ieRgL5Hgc1A9tRmRu1eOU51/olliJR43mAT9fV+TC7eEnsz8su6MiPZgsFv
 KWK/EHfPJxDTK4ciFHgHA3Of1vIepAtl4pnOd0KJ19+TrLVl7uYH+a3KxEpILqaYJGvQp5
 jCdIcdniUiuXrfBQ1tNbBPayz5oOFuE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626423154;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=721KIQMLBf3Ucbt2BE0yU3IT/o7ZzgeXpmnkt05stA0=;
 b=IBMh4LPOXVLfw1F9tJCFXjuQOIJhVmg9BuYK0rqQKSKjzoIctCJdWa0Cbv7RsJWG70JrG7
 UNZSVxwW8Ra5W6Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8624413C56;
 Fri, 16 Jul 2021 08:12:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 13W3HnI/8WDrXQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 16 Jul 2021 08:12:34 +0000
Date: Fri, 16 Jul 2021 10:12:32 +0200
From: Petr Vorel <pvorel@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <YPE/cJ0551pTYlSZ@pevik>
References: <20210715142448.GA30641@atcfdc88>
 <60F0DF88.9020603@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60F0DF88.9020603@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2,
 1/2] lib/tst_test.sh: Make tst_umount work with argument that
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
Cc: "richiejp@f-m.fm" <richiejp@f-m.fm>,
 "alankao@andestech.com" <alankao@andestech.com>, "metan@ucw.cz" <metan@ucw.cz>,
 "ycliang@cs.nctu.edu.tw" <ycliang@cs.nctu.edu.tw>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> Hi Leo
> > /proc/mounts shows the mount point without terminating slashes, e.g.
> > ~ $ cat /proc/mounts
> > xxx /root/cgroup cgroup rw,relatime,cpu 0 0

> > So current tst_umount would not work with argument that has terminating slash, e.g.
> > tst_umount cgroup/ would give "The device is not mounted".

> > Fix this by using mountpoint command instead of grepping /proc/mounts.

> > Signed-off-by: Leo Yu-Chi Liang<ycliang@andestech.com>
> > ---
> >   testcases/lib/tst_test.sh | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)

> > diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> > index c6aa2c487..7e77711f1 100644
> > --- a/testcases/lib/tst_test.sh
> > +++ b/testcases/lib/tst_test.sh
> > @@ -282,7 +282,7 @@ tst_umount()

> >   	[ -z "$device" ]&&  return

> > -	if ! grep -q "$device" /proc/mounts; then
> > +	if ! mountpoint -q "$device"; then
> Honestly speaking, I don't want to introduce mountpoint command.
> we can just filter the last "/" string for $device.
+1, please no any unnecessary dependency.

Kind regards,
Petr

> Best Regards
> Yang Xu

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
