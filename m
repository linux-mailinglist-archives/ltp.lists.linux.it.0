Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE4859C498
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Aug 2022 19:06:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D61E3CA2D4
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Aug 2022 19:06:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 495EC3C8A99
 for <ltp@lists.linux.it>; Mon, 22 Aug 2022 19:06:52 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3B40E600942
 for <ltp@lists.linux.it>; Mon, 22 Aug 2022 19:06:51 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2462A3522F;
 Mon, 22 Aug 2022 17:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1661188011;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o2rPHbiljmQGqoZJrXo7Xc7g863tTHzcV4TE+pbBqec=;
 b=sfMmZ9p+TdqzWf80+soiKuZ1voHWQjIPUGx3JFbUON9YH/5pIZ7B5YSb3iBCTzBfExxDZK
 TcLl1xlVttRyNcu89XJSknzB0Wbd7uquU8LBi6EKM8dA2qnOxpv7Iq0NYa4KJaBl7bNwrg
 ucVP/b4HTIBFgMXrZxCruAEo5mS8K1U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1661188011;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o2rPHbiljmQGqoZJrXo7Xc7g863tTHzcV4TE+pbBqec=;
 b=EQgdRVucmjDr7kw8+KkK3jAWDgecsetWMTzDoZ4ZANSpGYaWuQcaAuT+b/J5DWqqgt1T4F
 x2mUIR/WQZ5ys6BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C830013523;
 Mon, 22 Aug 2022 17:06:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Dq07Lqq3A2PCPgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 22 Aug 2022 17:06:50 +0000
Date: Mon, 22 Aug 2022 19:06:49 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YwO3qbIO32hvryjw@pevik>
References: <20220822155413.24814-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220822155413.24814-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/1] mount03: Convert to new API
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

when running in loop, I sometimes still get error:

i=0; while true; do i=$((i+1)); echo "== $i =="; ./mount03  || break; done
...
=== 100 ===
...
tst_device.c:434: TINFO: No device is mounted at mntpoint
tst_test.c:1599: TINFO: Testing on ext4
tst_test.c:1065: TINFO: Formatting /dev/loop0 with ext4 opts='' extra opts=''
mke2fs 1.46.5 (30-Dec-2021)
mount03.c:150: TINFO: Testing flag MS_RDONLY
mount03.c:48: TPASS: otfd = open(file, O_CREAT | O_RDWR, 0700) : EROFS (30)
mount03.c:150: TINFO: Testing flag MS_NODEV
mount03.c:153: TFAIL: mount(tst_device->dev, MNTPOINT, tst_device->fs_type, tc->flag, NULL) failed: EINVAL (22)
mount03.c:150: TINFO: Testing flag MS_NOEXEC
mount03.c:153: TFAIL: mount(tst_device->dev, MNTPOINT, tst_device->fs_type, tc->flag, NULL) failed: EINVAL (22)
mount03.c:150: TINFO: Testing flag MS_RDONLY
mount03.c:153: TFAIL: mount(tst_device->dev, MNTPOINT, tst_device->fs_type, tc->flag, NULL) failed: EINVAL (22)
mount03.c:150: TINFO: Testing flag MS_NOSUID
mount03.c:153: TFAIL: mount(tst_device->dev, MNTPOINT, tst_device->fs_type, tc->flag, NULL) failed: EINVAL (22)
mount03.c:150: TINFO: Testing flag MS_NOATIME
mount03.c:111: TPASS: st.st_atime == atime (1661183501)
...
Summary:
passed   32
failed   4
broken   0
skipped  0
warnings 0

Any idea what can be wrong?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
