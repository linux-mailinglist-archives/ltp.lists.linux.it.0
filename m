Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7543B14F4
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 09:40:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F0093C6FF0
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 09:40:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 400D03C202C
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 09:40:51 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CDE711A0079C
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 09:40:50 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 10D592195F;
 Wed, 23 Jun 2021 07:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624434050;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rpNMlSZ3n8YhdmjD2JjRgYipHdV8d9TlOkloQaezePQ=;
 b=K9iZfBR2IzF1tQUJ6LWX5XhQaz9wTg1ugDa8vNVS/XjznjfxvrNFpsSnJWPwHU18AqygO6
 HnZpjAbFrnBkm1b+0N1Iu2+QDsjC71d4y3voNHei5xjiqUKt/VbjwERsyLJEZccBdE1sKB
 rrBue+1k4tmqP7gAcY5SNje93B0HuhU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624434050;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rpNMlSZ3n8YhdmjD2JjRgYipHdV8d9TlOkloQaezePQ=;
 b=ImXVoPLFS+g6FrNsmjxOC2YR0ywmmMupmNPJHxNbCYberhL0syvuLD4RMK8+ES0bK2qXzc
 4QhwQzbF7t2ob1DQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id DF66E11A97;
 Wed, 23 Jun 2021 07:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624434050;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rpNMlSZ3n8YhdmjD2JjRgYipHdV8d9TlOkloQaezePQ=;
 b=K9iZfBR2IzF1tQUJ6LWX5XhQaz9wTg1ugDa8vNVS/XjznjfxvrNFpsSnJWPwHU18AqygO6
 HnZpjAbFrnBkm1b+0N1Iu2+QDsjC71d4y3voNHei5xjiqUKt/VbjwERsyLJEZccBdE1sKB
 rrBue+1k4tmqP7gAcY5SNje93B0HuhU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624434050;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rpNMlSZ3n8YhdmjD2JjRgYipHdV8d9TlOkloQaezePQ=;
 b=ImXVoPLFS+g6FrNsmjxOC2YR0ywmmMupmNPJHxNbCYberhL0syvuLD4RMK8+ES0bK2qXzc
 4QhwQzbF7t2ob1DQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id ESDpNIHl0mCyBAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 23 Jun 2021 07:40:49 +0000
Date: Wed, 23 Jun 2021 09:40:48 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YNLlgMC40Zq0GA6d@pevik>
References: <20210623062456.430406-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210623062456.430406-1-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/3] mem: child alloc memory should larger than
 memory.max + memory.swap.max if lite==1
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

Hi,

LGTM
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
