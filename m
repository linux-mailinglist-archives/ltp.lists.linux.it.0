Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B39C5B6810
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Sep 2022 08:42:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D0B1F3CAAE6
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Sep 2022 08:42:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B854A3CA306
 for <ltp@lists.linux.it>; Tue, 13 Sep 2022 08:42:09 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A2BAD200B96
 for <ltp@lists.linux.it>; Tue, 13 Sep 2022 08:42:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B541B21E81;
 Tue, 13 Sep 2022 06:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663051327;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nEC1VYNtvWAGAGMjPq4JqF4kpmH4nlYiQ5cUj013FXg=;
 b=oc7UdqtUk0BjnjNa3gurVZD6mjMF0UoMYSN9GrC7YUICzUvOnBytAd2XkQxpPcStK4j4Pm
 74Hijcan1No70ZQihStP+qRoJS4B5IUZvBQHJNA+Z33o7pZZN//k2dQw+Tov2S3KirxViX
 u2L9uf8RuRXR1T1qOVDC4mU9WAq4NYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663051327;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nEC1VYNtvWAGAGMjPq4JqF4kpmH4nlYiQ5cUj013FXg=;
 b=APcSh0lh2tcgK3n2T+AvjxVIQlkkYGkdtNYSoHu19Fif9oVRoArVpSCkvdKFEfKdzQRGSm
 rOJXvMNESRk+JuCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 96FF4139B3;
 Tue, 13 Sep 2022 06:42:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 93BZIz8mIGMFbgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 13 Sep 2022 06:42:07 +0000
Date: Tue, 13 Sep 2022 08:42:05 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Luo xiaoyu <luoxiaoyu9@huawei.com>
Message-ID: <YyAmPYZ2iaraxraN@pevik>
References: <20220905061425.22852-1-luoxiaoyu9@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220905061425.22852-1-luoxiaoyu9@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Luo,

> Drop redundant calling of tst_reap_children() in cleanup() since
> it has been called in the API (run_tests()).

LGTM, I suppose that was a mistake.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

NOTE: this patch is broken:
patch: **** malformed patch at line 100: 

Please be careful next time.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
