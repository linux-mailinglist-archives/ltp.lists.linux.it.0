Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 923D76C6166
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Mar 2023 09:13:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6402E3CAF39
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Mar 2023 09:13:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4F99F3C132A
 for <ltp@lists.linux.it>; Thu, 23 Mar 2023 09:13:57 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 354A56002EC
 for <ltp@lists.linux.it>; Thu, 23 Mar 2023 09:13:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C3361339C9;
 Thu, 23 Mar 2023 08:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1679559234;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VDRSuueJkqRiY1rtIDfQLlivQNGPlBRHrYrYJqqMuqs=;
 b=ImmxenvSOeCyzCdWh3HB26FdR61xvS//B0fXnY0XeZXwE+4KGkUGznVYZfsYcMu94cYFa5
 pm2NLltGyHZ0AvA2gs7jD8eoFn7BJuVDA4qU4Y+50TVzbjAeLXadVvYtWoOqJunxP9y8dm
 g1axn/mZX9ChCnlTMY4RdJjS/WynbOM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1679559234;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VDRSuueJkqRiY1rtIDfQLlivQNGPlBRHrYrYJqqMuqs=;
 b=Im1Ijkv5Cb8aEh6GJy0gXdwCi/Kh7qvmLdmZkMgNDB01AeSvu/u61uhBIbq+zzKayPs5yt
 Nx0PdrBvgBt6U/Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 97BC7132C2;
 Thu, 23 Mar 2023 08:13:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wbiEI0IKHGTZGwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 23 Mar 2023 08:13:54 +0000
Date: Thu, 23 Mar 2023 09:13:53 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Edward Liaw <edliaw@google.com>
Message-ID: <20230323081353.GA405493@pevik>
References: <20230320235108.2058967-1-edliaw@google.com>
 <20230320235108.2058967-2-edliaw@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230320235108.2058967-2-edliaw@google.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] tst_device.c: Use PATH_MAX more
 consistently
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
Cc: kernel-team@android.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Edward,

obviously correct, merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
