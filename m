Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEA13A43D0
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 16:09:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8105A3C8E9F
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 16:09:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3A81E3C3089
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 16:09:07 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 74A176023AE
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 16:09:07 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D91E421A47;
 Fri, 11 Jun 2021 14:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623420546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q8c1snunxfGn1T7/TUy85M692lRBYYbKfHpb3Zm8ogE=;
 b=o5pT23EV49diA9yj7bD1pz8vp00BL52yMcwBTzQm7vFvPutba2awCTVWZE0Y5t2cKJVcb6
 dnOy49lNSF7OiRbRJ5d1VAWgRlUJA9xpfqce+JawFU4wxOKMk5m37czTaZ+v8+S2NX0jQb
 8ubQ9sdGcXdYweZXAPE0xPsRNupRPz8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623420546;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q8c1snunxfGn1T7/TUy85M692lRBYYbKfHpb3Zm8ogE=;
 b=RSe/OhyGTVuSYa4ymBJHtvECmjOTtmv0OvjQP27G2QKlcuAaGcJGqcbmujytc20raSoEiB
 Qad21tS775VZBaAg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C6578118DD;
 Fri, 11 Jun 2021 14:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623420546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q8c1snunxfGn1T7/TUy85M692lRBYYbKfHpb3Zm8ogE=;
 b=o5pT23EV49diA9yj7bD1pz8vp00BL52yMcwBTzQm7vFvPutba2awCTVWZE0Y5t2cKJVcb6
 dnOy49lNSF7OiRbRJ5d1VAWgRlUJA9xpfqce+JawFU4wxOKMk5m37czTaZ+v8+S2NX0jQb
 8ubQ9sdGcXdYweZXAPE0xPsRNupRPz8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623420546;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q8c1snunxfGn1T7/TUy85M692lRBYYbKfHpb3Zm8ogE=;
 b=RSe/OhyGTVuSYa4ymBJHtvECmjOTtmv0OvjQP27G2QKlcuAaGcJGqcbmujytc20raSoEiB
 Qad21tS775VZBaAg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 1l4XL4Juw2DSbQAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 11 Jun 2021 14:09:06 +0000
Date: Fri, 11 Jun 2021 15:43:20 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Vinay Kumar <vinay.m.engg@gmail.com>
Message-ID: <YMNoeLR3J9Ah1eAZ@yuki>
References: <YL/Wf51Y6V5lRnkM@pevik>
 <20210609173601.29352-1-vinay.m.engg@gmail.com>
 <20210609173601.29352-2-vinay.m.engg@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609173601.29352-2-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 02/10] getitimer02: Skipped EFAULT tests for
 libc variant.
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
Cc: umesh.kalappa0@gmail.com, metan@ucw.cz, rwmacleod@gmail.com,
 vinay.kumar@blackfigtech.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
What is the point of adding test variants when the test does only EFAULT
test that ends up being skipped on the libc variant?

Can't we simply just switch to the syscall here instead?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
