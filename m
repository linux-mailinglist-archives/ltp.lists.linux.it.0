Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8943F8B0E
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 17:31:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7EACC3C2F29
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 17:31:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 70CB23C2E47
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 17:31:38 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4359D1000929
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 17:31:36 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9862322216;
 Thu, 26 Aug 2021 15:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629991896;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=juH7qUq8zYlhpbja0mDYxVfkb4+fiTOQr9ewXfAVYFY=;
 b=dvB22TBquUz5hZX8k8LVaETi/YajMnkDYXh02aCYLzg2nLmGk0qQHLSw1ghdLcA2T9izAv
 fB+YK6+Koc9SMFurPi0Zih+mAT7ZzYqMd1DPqrLDsu4acLU5XwKd8rZ/umszegidl41RLq
 GNeRS5oTyxJF7GKO25gvAp2lnsLoNsU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629991896;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=juH7qUq8zYlhpbja0mDYxVfkb4+fiTOQr9ewXfAVYFY=;
 b=ZCU9xsdtkJB+QFBnIf4xtlBItvfKQOlTy6e6YfhTM+mxAu6G3k+bFR5rN3O+aLWFq8wIWB
 z5/Bg+S2fadEF5Dg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 6995513689;
 Thu, 26 Aug 2021 15:31:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id RUxvF9izJ2EJbgAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 26 Aug 2021 15:31:36 +0000
Date: Thu, 26 Aug 2021 17:31:34 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YSez1mJYk2RVmZY3@pevik>
References: <20210826112212.26394-1-mdoucha@suse.cz>
 <20210826112212.26394-4-mdoucha@suse.cz> <YSeWymK0elcbiqzt@pevik>
 <89e96508-581a-e60c-58cb-37c0c3b3b176@suse.cz>
 <YSek9Snd8uZ8PIEY@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSek9Snd8uZ8PIEY@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/4] Add test for CVE 2018-13405
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

Hi Cyril, Martin,

...
> > As for if/else braces, I thought the coding style was to add braces
> > around multi-line statements even if it's a single command.

> Indeed that's the preferred way.

Thanks for info.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
