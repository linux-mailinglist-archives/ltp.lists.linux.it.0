Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A7C3CCDA6
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Jul 2021 07:52:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A1B1E3C66BC
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Jul 2021 07:52:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6759B3C0926
 for <ltp@lists.linux.it>; Mon, 19 Jul 2021 07:51:59 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B16DA100034B
 for <ltp@lists.linux.it>; Mon, 19 Jul 2021 07:51:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BBAD8221A0;
 Mon, 19 Jul 2021 05:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626673917;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f7ySWe3oYoMfIj+v9vu0f7L8OhzU051eFQ9LOqeVMy0=;
 b=QXx2xr/JR5ZGUvs33LygkMjIBKly5w9Sgz2UtINV5R0F+jDVPH+SjGHhqSknQq2HCVifoY
 5+YYfulAQKZQbbTz0y9IT6Q+B96MzvMNkLyMJQ8QIgrOJsW2gXGDpd49EUr23xTiTyLlve
 fgtRG0FqmO9zNL6SVwYOIDlKBEaPAbU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626673917;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f7ySWe3oYoMfIj+v9vu0f7L8OhzU051eFQ9LOqeVMy0=;
 b=e/4Zo8v1WX3f3LetUqmLo8+sVlUIjBjKPB76azEC8SOMIDsLKdyRpCC3njI/GSk5/lM913
 4ysCfVZqk72g+1AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E63D13C8C;
 Mon, 19 Jul 2021 05:51:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5VxMEf0S9WCqbwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 19 Jul 2021 05:51:57 +0000
Date: Mon, 19 Jul 2021 07:51:55 +0200
From: Petr Vorel <pvorel@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <YPUS+/YZgAxUAlDn@pevik>
References: <20210716140142.GA7113@andestech.com>
 <60F50B67.4000807@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60F50B67.4000807@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3,
 1/2] lib/tst_test.sh: Make tst_umount work with argument that has
 trailing slash
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

> Hi Leo

> > /proc/mounts shows the mount point without trailing slashes, e.g.
> > ~ $ cat /proc/mounts
> > xxx /root/cgroup cgroup rw,relatime,cpu 0 0

> > So current tst_umount would not work with argument that has trailing slash, e.g.
> > tst_umount cgroup/ would give "The device is not mounted".

> > Fix this by filtering out the trailing slash before grepping /proc/mounts.

> > Signed-off-by: Leo Yu-Chi Liang<ycliang@andestech.com>
> > ---
> >   testcases/lib/tst_test.sh | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)

> > diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> > index c6aa2c487..f132512e7 100644
> > --- a/testcases/lib/tst_test.sh
> > +++ b/testcases/lib/tst_test.sh
> > @@ -282,13 +282,14 @@ tst_umount()

> >   	[ -z "$device" ]&&  return

> > +	device=${device%/}
> >   	if ! grep -q "$device" /proc/mounts; then
> >   		tst_res TINFO "The $device is not mounted, skipping umount"
> >   		return
> >   	fi

> >   	while [ "$i" -lt 50 ]; do
> > -		if umount "$device">  /dev/null; then
> > +		if umount "$device"/>  /dev/null; then
> With removing this(we don't need add "/" here), this patch looks good to me
+1

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

> Reviewed-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> >   			return
> >   		fi


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
