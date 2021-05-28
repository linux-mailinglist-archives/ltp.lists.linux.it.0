Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C0E394090
	for <lists+linux-ltp@lfdr.de>; Fri, 28 May 2021 12:01:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 775393C912A
	for <lists+linux-ltp@lfdr.de>; Fri, 28 May 2021 12:01:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7C1DF3C2A3D
 for <ltp@lists.linux.it>; Fri, 28 May 2021 12:01:39 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id F2F0010008EF
 for <ltp@lists.linux.it>; Fri, 28 May 2021 12:01:38 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3E773218B0;
 Fri, 28 May 2021 10:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622196098;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+jVo25Ne0wntTlIwQibNSlvQMYAko1Al5KMn7yr8VW8=;
 b=uCc+gCv83OtzlIvWTWs2FPM+UXxaEZXzWKs5ZHezH/N+gilRI3r5mKrTYgYADM0QizARLr
 4W4gsFWOntSs4baDgwjOwZBfuGiAj/Hy+hntdg8Dxv2TrvBHD3MwbRs+zJHZGOX2IhEIfP
 6Stoc3NOFTl0XMP62XQts26CXCxje5I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622196098;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+jVo25Ne0wntTlIwQibNSlvQMYAko1Al5KMn7yr8VW8=;
 b=ohaTazCT+RM3RvCOMGD0CWkzGpmhELS5OlZlCX+CacG/RG4vQLhcjuGgAhSrAfvdANlfXc
 MN79Fnk8SwKZtvBg==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 2507C11A98;
 Fri, 28 May 2021 10:01:38 +0000 (UTC)
Date: Fri, 28 May 2021 12:01:36 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YLC/gApc5oJ9noMW@pevik>
References: <20210526104633.29561-1-pvorel@suse.cz>
 <YLCddN29evt3O5jw@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLCddN29evt3O5jw@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] sendfile0{2,9}: Remove OFF_T workaround
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

Hi Cyril,

> Hi!
> > Using OFF_T definition to off64_t for 64bit variants seems to be am old
> > workaround for buggy libc. Nowadays we can rely on off_t to have correct size
> > (i.e.: 32bit: 4 bytes; 64bit or 32bit with -D_FILE_OFFSET_BITS=64: 8 bytes)

> Looks good to me, Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

> > Suggested-by: Cyril Hrubis <chrubis@suse.cz>
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > NOTE: -DOFF_T=off64_t is also defined in testcases/kernel/io/disktest
> > and mentioned in {tst_,}safe_macros.h.

> We should remove the -DOFF_T=off64_t comment from the *safe_macros.h and
> keep only the _FILE_OFFSET_BITS there.

Good. OK, after I solve our CI (github actions) I'll merge this and send another
patch which removes it in testcases/kernel/io/disktest + the comment in
*safe_macros.h.

Thanks for review and hints!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
