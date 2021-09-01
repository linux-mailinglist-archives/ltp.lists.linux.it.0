Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C190F3FDD79
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 15:53:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 920453C2A01
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 15:53:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 33DB43C29D1
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 15:53:33 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 37AFC600D74
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 15:53:32 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7A6EE22522;
 Wed,  1 Sep 2021 13:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630504412;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X3nvYJIWIK4AXrlK7h9IDRZxiMT/IVlg5x2HKXtPMUc=;
 b=zU+rLcqC41vhevYD0KVKKZcMF/qIr2ZdgQHXxf8MQGSlbo7ty9SJhD7nITt7DG4q2ps+g7
 2D2D02hToY6wuTf/g1Ty0ruJ4uTTAc/JBbr5BzFeGMjpLWCDA5894VuoeH08YBHlaHZaei
 cazmHF/JazRYRV8x7qHWxT2ifMgngBQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630504412;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X3nvYJIWIK4AXrlK7h9IDRZxiMT/IVlg5x2HKXtPMUc=;
 b=iZFMU0pZW0zrN6UPwqrXH/XKFqOSoT7YJPvSlvS1KSFyd+oc4P+U1cN4OPVo9ynnFPyIlw
 b3VZ+uUrHGiy20Cg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 5184313AD1;
 Wed,  1 Sep 2021 13:53:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id Pv0FEtyFL2FYZAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 01 Sep 2021 13:53:32 +0000
Date: Wed, 1 Sep 2021 15:53:30 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Dai Shili <daisl.fnst@fujitsu.com>, ltp@lists.linux.it
Message-ID: <YS+F2vm0SVSLvyjU@pevik>
References: <1629294657-28375-1-git-send-email-daisl.fnst@fujitsu.com>
 <YS998a/fPdH5aZh8@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YS998a/fPdH5aZh8@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/pread01: Convert to new API
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

Hi Dai,

> ...
> > +static void verify_pwrite(void)
...

> your code:
> static void verify_pread(void)
> {
> 	SAFE_PREAD(1, fildes, read_buf[2], K1, K2);

> 	l_seek(fildes, 0, SEEK_CUR, K4);

> 	l_seek(fildes, 0, SEEK_SET, 0);

> 	SAFE_PREAD(1, fildes, read_buf[3], K1, K3);

> 	l_seek(fildes, 0, SEEK_CUR, 0);

> 	SAFE_READ(1, fildes, read_buf[0], K1);

> 	l_seek(fildes, 0, SEEK_CUR, K1);

> 	SAFE_PREAD(1, fildes, read_buf[1], K1, K1);

> 	l_seek(fildes, 0, SEEK_CUR, K1);

> 	compare_bufers();

> 	l_seek(fildes, K4, SEEK_SET, K4);
> }

> nit: having blank line after each line?

> how about something like:

> static void verify_pread(void)
> {
> 	SAFE_PREAD(1, fildes, read_buf[2], K1, K2);
> 	l_seek(fildes, 0, SEEK_CUR, K4);
> 	l_seek(fildes, 0, SEEK_SET, 0);

> 	SAFE_PREAD(1, fildes, read_buf[3], K1, K3);
> 	l_seek(fildes, 0, SEEK_CUR, 0);

> 	SAFE_READ(1, fildes, read_buf[0], K1);
> 	l_seek(fildes, 0, SEEK_CUR, K1);

> 	SAFE_PREAD(1, fildes, read_buf[1], K1, K1);
> 	l_seek(fildes, 0, SEEK_CUR, K1);

> 	compare_bufers();

> 	l_seek(fildes, K4, SEEK_SET, K4);
> }

I'm sorry, this was meant to be mentioned at patch, which changes pread01.c [1],
not here. I got confused by your wrong subject. But most of the code is similar,
thus can apply here.

[1] https://patchwork.ozlabs.org/project/ltp/patch/1629200697-14878-1-git-send-email-daisl.fnst@fujitsu.com/

> The rest LGTM.

> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
