Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CE499393E59
	for <lists+linux-ltp@lfdr.de>; Fri, 28 May 2021 10:02:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7FA6F3C7661
	for <lists+linux-ltp@lfdr.de>; Fri, 28 May 2021 10:02:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EE7C03C2A33
 for <ltp@lists.linux.it>; Fri, 28 May 2021 10:02:20 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4E4AF6005CE
 for <ltp@lists.linux.it>; Fri, 28 May 2021 10:02:20 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 40DEF218B3;
 Fri, 28 May 2021 08:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622188939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NhXbeS6333HVTu5gorHLT0QqniIHaiOLqmbgqh6j+qY=;
 b=pkg8tpZOYSDzAcm0Suhpo7swrFIEWN3FtB3hpEjilZJlgHVHJ+T1QG+qghW5zBxG73I4Cq
 d5ixFNyoWga+bt4C08oX3YezUkyXsnkSLFed9ydHi3bRxEzedezLBED4uCFJHPWO6R0WzH
 IxtztaTId9gfbb9NgnwRm6SOgT8GGKI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622188939;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NhXbeS6333HVTu5gorHLT0QqniIHaiOLqmbgqh6j+qY=;
 b=tveJIvSep9fJM6O0PPfte/Bqh8g5Bj6MYdYiCNyKTAg3uogY2XFIzsn26v6v22H6nDuL/e
 MNlCZmPiDbLb1aBg==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 313DA11A98;
 Fri, 28 May 2021 08:02:19 +0000 (UTC)
Date: Fri, 28 May 2021 09:36:20 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YLCddN29evt3O5jw@yuki>
References: <20210526104633.29561-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210526104633.29561-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Using OFF_T definition to off64_t for 64bit variants seems to be am old
> workaround for buggy libc. Nowadays we can rely on off_t to have correct size
> (i.e.: 32bit: 4 bytes; 64bit or 32bit with -D_FILE_OFFSET_BITS=64: 8 bytes)

Looks good to me, Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

> Suggested-by: Cyril Hrubis <chrubis@suse.cz>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> NOTE: -DOFF_T=off64_t is also defined in testcases/kernel/io/disktest
> and mentioned in {tst_,}safe_macros.h.

We should remove the -DOFF_T=off64_t comment from the *safe_macros.h and
keep only the _FILE_OFFSET_BITS there.


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
