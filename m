Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EB87D3F716A
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 11:05:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9CB703C3015
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 11:05:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BB6993C2F5A
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 11:05:00 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 378A91A00782
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 11:04:59 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7A1BF220F8;
 Wed, 25 Aug 2021 09:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629882299;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ogsy0d5AWo6+brv8UX1/iBc7Nz1vImkWY1l8fEOgQz8=;
 b=1I51FRkvq0zhCczpD5wYlK/dMal9TMDQIC34YG52oJgyvYIoqbW5pdYzLrGfcSd/0VWcHT
 SIcAc7B0pOYMLyk/i8al3dJKb1OUXK3oeYRHuGH8R/CyHHUChEIOYB2+b3QXv13ctLeZ6t
 p9ovWOKvtWZNger0G7JvXvlaU4LUkuk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629882299;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ogsy0d5AWo6+brv8UX1/iBc7Nz1vImkWY1l8fEOgQz8=;
 b=3oU0ua9Ufo0a5bFXIkcldcPZefRO93B3kbLeEFbSEmQN5Kt+GfwXJwPptxegHtQQsRGHXz
 aSbjfP6LYe9HYKAQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 4EE9813887;
 Wed, 25 Aug 2021 09:04:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id t8+iEbsHJmHufQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 25 Aug 2021 09:04:59 +0000
Date: Wed, 25 Aug 2021 11:04:57 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YSYHuczVmaLlVG3D@pevik>
References: <20210825080933.12949-1-pvorel@suse.cz>
 <20210825080933.12949-4-pvorel@suse.cz>
 <8d74045f-3ebc-526d-f875-6ca121475a4d@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8d74045f-3ebc-526d-f875-6ca121475a4d@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] shell API: Rename LTP_IPC_PATH -> TST_IPC_PATH
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> > Keep the old name in the legacy API.
> That doesn't make sense. If you update the variable name in the c api, you
> also have to update the old shell api (i.e. test.sh).
Ah, shell API implementation obviously depends on C API. Thanks for info.

> Or maybe even remove the code from the old shell api completely. As far as I
> see there are no users of the checkpoint api anymore.
> Both tests (cn_pec and memcfg/functional) were rewritten. It is probably
> safe to just drop the old api?
I'll check it, if it's really not used in the legacy API, I'd be also for removing it.


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
