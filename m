Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9FB392E69
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 14:54:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BBC523C80D7
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 14:54:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 79F0A3C2A93
 for <ltp@lists.linux.it>; Thu, 27 May 2021 14:54:42 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DFEC0600FB1
 for <ltp@lists.linux.it>; Thu, 27 May 2021 14:54:41 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 176252190B;
 Thu, 27 May 2021 12:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622120081; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KaQbEYig3NGYPydnU2RvBAGMoQBte32PQzTGLmslBQw=;
 b=sQ/N8bo7oAOrRULhvwYv5V5aLNF0VTVNMjmhz/Jk+HSb6wrkCIgk3HpL4w8t80I7pnMxT9
 SkL6zBZ9jtFQaU3i0R6Jq6gB4us1PJ3yCUiYqNBs/vQqp1kOYxACxENmo/CmsXbufORs0j
 vK1MX95pejOBcYsvcGg4L1Xdx6cSMF0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622120081;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KaQbEYig3NGYPydnU2RvBAGMoQBte32PQzTGLmslBQw=;
 b=C7DoASMViA83foHJVq8tuQYELF8h8OL7rTs9WJT5bKN3lZEWo3Uv3l5Qrv+fSgu6UGlxzJ
 uCWcCqm8Uxem3YAQ==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 064EF11A98;
 Thu, 27 May 2021 12:54:41 +0000 (UTC)
Date: Thu, 27 May 2021 14:28:41 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YK+QeafN4q6IUvOn@yuki>
References: <20210526154949.4473-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210526154949.4473-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] doc: Split test-writing-guidelines
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
Cc: ltp@lists.linux.it, Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Test Writing Guidelines wiki page is too long, thus split it
> into 3 parts:
> 
> 1) generic part (only first chapter, the same URL)
> 2) C test API (2.2 chapter, 4. Common problems)
> 3) shell test API
> 
> Unfortunately this breaks users' bookmarks.
> 
> Start numbering in headers from 1 on each page (links are broken
> anyway).
> 
> NOTE: in order to have '...' formatting as code,
> main header ====== was needed to add on the page.

The split looks good to me, acked.

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> See it:
> https://github.com/pevik/ltp/wiki/Test-Writing-Guidelines

This page should be updated, at least the paragraph about commenting code
should now explain top level comment format.

The backward compatibility should be improved as well, since we have
kernel config parser now as well, etc.

I guess that I should sit down and write a patch for that one once the
split is applied.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
