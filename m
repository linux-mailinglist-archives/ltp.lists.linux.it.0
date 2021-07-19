Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCFE3CCDB1
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Jul 2021 07:58:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F0B53C8208
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Jul 2021 07:58:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 670A13C0926
 for <ltp@lists.linux.it>; Mon, 19 Jul 2021 07:58:03 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8D5276024B2
 for <ltp@lists.linux.it>; Mon, 19 Jul 2021 07:58:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CA5F2201CC;
 Mon, 19 Jul 2021 05:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626674282;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1dZjHEWhIhxRZI8EQoSif8pyl9TNUiRWR7OgXYPtIcQ=;
 b=EN48OqWA/wOcfNPBq069Fr3nIEk605r+mYQ37HOvC3f++nSPvA/BBzWU69bZN3ZaQvFuFQ
 XO4yTHADovHwFZsoV7RYRF93rAQXnhgttXd4fSA0CFwlE9GK8y+gxGF2ERU/Jv7BCWY/fj
 SfVZLt5ukJkMABLXIBWbwcX8VDvu63w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626674282;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1dZjHEWhIhxRZI8EQoSif8pyl9TNUiRWR7OgXYPtIcQ=;
 b=0OHRVrG8O+DGo7we0c/t5+Ab0FUvg8Zie5vgr4p/fNEkqyJqtuZvzpYGCeGdR0NiR0vawS
 XNMkXmTBW7uhN6Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6F1B013C8C;
 Mon, 19 Jul 2021 05:58:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kJOFGGoU9WDgcAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 19 Jul 2021 05:58:02 +0000
Date: Mon, 19 Jul 2021 07:58:00 +0200
From: Petr Vorel <pvorel@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>,
 Leo Liang <ycliang@andestech.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>,
 "chrubis@suse.cz" <chrubis@suse.cz>, "lkml@jv-coder.de" <lkml@jv-coder.de>,
 "metan@ucw.cz" <metan@ucw.cz>, "richiejp@f-m.fm" <richiejp@f-m.fm>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "ycliang@cs.nctu.edu.tw" <ycliang@cs.nctu.edu.tw>
Message-ID: <YPUUaOMUjRMy43ZH@pevik>
References: <20210716140142.GA7113@andestech.com>
 <60F50B67.4000807@fujitsu.com> <YPUS+/YZgAxUAlDn@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPUS+/YZgAxUAlDn@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> > Hi Leo

> > > /proc/mounts shows the mount point without trailing slashes, e.g.
> > > ~ $ cat /proc/mounts
> > > xxx /root/cgroup cgroup rw,relatime,cpu 0 0

> > > So current tst_umount would not work with argument that has trailing slash, e.g.
> > > tst_umount cgroup/ would give "The device is not mounted".

> > > Fix this by filtering out the trailing slash before grepping /proc/mounts.

> > > Signed-off-by: Leo Yu-Chi Liang<ycliang@andestech.com>
> > > ---
> > >   testcases/lib/tst_test.sh | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)

> > > diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> > > index c6aa2c487..f132512e7 100644
> > > --- a/testcases/lib/tst_test.sh
> > > +++ b/testcases/lib/tst_test.sh
> > > @@ -282,13 +282,14 @@ tst_umount()

> > >   	[ -z "$device" ]&&  return

> > > +	device=${device%/}
> > >   	if ! grep -q "$device" /proc/mounts; then
> > >   		tst_res TINFO "The $device is not mounted, skipping umount"
> > >   		return
> > >   	fi

> > >   	while [ "$i" -lt 50 ]; do
> > > -		if umount "$device">  /dev/null; then
> > > +		if umount "$device"/>  /dev/null; then
> > With removing this(we don't need add "/" here), this patch looks good to me
> +1
Actually we need to keep / for next patch, right? (cgroup/)

Thus why not just changing argument for grep?
-       if ! grep -q "$device" /proc/mounts; then
+       if ! grep -q "${device%/}" /proc/mounts; then

Kind regards,
Petr

> Reviewed-by: Petr Vorel <pvorel@suse.cz>

> Kind regards,
> Petr

> > Reviewed-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> > >   			return
> > >   		fi


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
