Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E3D625C34
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Nov 2022 15:02:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 588F53CD5E1
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Nov 2022 15:02:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 721993CD574
 for <ltp@lists.linux.it>; Fri, 11 Nov 2022 15:02:37 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 860E614011A2
 for <ltp@lists.linux.it>; Fri, 11 Nov 2022 15:02:36 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 281A521CB1;
 Fri, 11 Nov 2022 14:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1668175355;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Rkj0TeITLEmxUyxxofB76uf5xNHbrHjWmlq5viIXvA=;
 b=HJRLJU3aFrpBpqhStAHvZ3DQ+tZyt1uCpD213T5yrnSl32p3Qtjmpxkd+FQi9ynzpvCrwO
 8Mra31mjt+L15cAASIEdwntbnhz/AmJ/xxuYOhEtf3zg4gitfzAzfxBbLcAiUEZnYRPIBJ
 MIm4slrdYF/HZtJuuEwFzJYadck2MUg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1668175355;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Rkj0TeITLEmxUyxxofB76uf5xNHbrHjWmlq5viIXvA=;
 b=Ras6tPfHCkZGDtfPZYE+5SnJvO8asWr9FyOm/uumygWmiElWWNpzeMPuwk4/c0DpMXs0EC
 1uk/GdY0X4TVBdDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DEA5213273;
 Fri, 11 Nov 2022 14:02:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LU60MvpVbmP6fwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 11 Nov 2022 14:02:34 +0000
Date: Fri, 11 Nov 2022 15:02:32 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <Y25V+CGv2GVd/LXW@pevik>
References: <20221110135442.14501-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221110135442.14501-1-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Allow graceful subtest cleanup in shell tests
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

Hi Martin,

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Thanks!

> The new shell test timeout code sends SIGTERM to any subprocesses when
> the main script hits timeout. SIGTERM isn't handled by the LTP library
> which means that tools like netstress will be instantly killed without
> performing any cleanup. Handle SIGTERM like SIGINT in LTP library
> to allow graceful cleanup.

Besides this, Cyril some time ago suggested to define TST_NO_DEFAULT_MAIN in
nfs05_make_tree.c [1], which is also helper like netstress.c.

Looking what this would be required for netstress.c: implement function it's own
tst_brk(), which would call cleanup() function before calling library's
tst_brk(), parsing getopt parameters, calling setup() in main() etc.
The only thing which works is tst_res() and tst_brk() printing.
I'm not sure if this is worth just to avoid problematic timeout.

Kind regards,
Petr

[1] https://lore.kernel.org/ltp/YqxFo1iFzHatNRIl@yuki/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
