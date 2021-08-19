Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3977E3F131C
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Aug 2021 08:09:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B1A13C5551
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Aug 2021 08:09:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9AA793C536F
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 08:09:09 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5D7AA1A0117A
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 08:09:09 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9CB4B2009D;
 Thu, 19 Aug 2021 06:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629353348;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nKqsCEhUxBNHDUsoY2s7wsGN0H4f7/EdBxWiK5IPbKw=;
 b=o4lkwc3dluEbi0DwXx3wfOf4SMJRwTBL2AH7iM2D8W45SJ244dZuZBH99qvhdX1xpDbeI6
 EwtO5wJfyTneCc+VhI0On+zTpPzs2N9ReHKo1wEmvqCt+/cxShxiZ8PKE7yvkzsSGTDcT/
 T+7WmClhr331eGboykEPf1yuuWQuQrU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629353348;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nKqsCEhUxBNHDUsoY2s7wsGN0H4f7/EdBxWiK5IPbKw=;
 b=HKuUjlBi9MJdDxJ2iRKPC7Nyr4IK1WNsx+e+ETLCEh6Qd9h4BpD9MdukALSa0hWHaT0Rg6
 2SJzd8JKvDv/OzCw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 551F51371C;
 Thu, 19 Aug 2021 06:09:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id j4k3EoT1HWHuHAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 19 Aug 2021 06:09:08 +0000
Date: Thu, 19 Aug 2021 08:09:06 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YR31gii1hVnYNbX5@pevik>
References: <20210818091224.27578-1-pvorel@suse.cz>
 <20210818091224.27578-2-pvorel@suse.cz>
 <7ac7a1d6-2d97-f8f5-8d60-040eb0753681@jv-coder.de>
 <YRzVpQT1zYOvxlWe@pevik>
 <CAEemH2es_CzWugkyOworVLFe+ZbtFxpYXK5HjdE_g_w4wHvzVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2es_CzWugkyOworVLFe+ZbtFxpYXK5HjdE_g_w4wHvzVQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] tst_test.sh: Simplify tst_cmd_available()
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
Cc: Elliott Hughes <enh@google.com>, LTP List <ltp@lists.linux.it>,
 Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

...
> Another reason, I guess, is `command -v ` looks to match the function name
> more:).

> But it depends on you, I'm OK with any of them.

Sure, no problem to keep "command -v".
Thanks for your review.

Kind regards,
Petr

> Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
