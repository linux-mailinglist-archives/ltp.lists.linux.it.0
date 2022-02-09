Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D172C4AEF57
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Feb 2022 11:35:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 873543C9B7B
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Feb 2022 11:35:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2037E3C030D
 for <ltp@lists.linux.it>; Wed,  9 Feb 2022 11:35:53 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 18E466011EF
 for <ltp@lists.linux.it>; Wed,  9 Feb 2022 11:35:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3609F210DC;
 Wed,  9 Feb 2022 10:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1644402952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=12aMlqTX5XSEUR7wU810TLmwAQXtm74xffvJnqRij5s=;
 b=JYBbSwiwU2Jq0zxhN4rrrMBaHMY/AumcjU7pxey4TdcNZERQDLjEpDEfkJWZ5o08KiKQJE
 kROfw8s1YJzKx/Y/IY43R85Qdnc+oQ6BuDhrnti6iJ+AOoIlMSRmM25bd5ptYHRHBOjwtC
 RxGw66tz3Uz47S7koA+rzfONDLBPwAw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1644402952;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=12aMlqTX5XSEUR7wU810TLmwAQXtm74xffvJnqRij5s=;
 b=RBEnpKr70r3rkOwB2Bpi2vX2p/KriqlcHGZrA9KQyU2gHbu0gyEUlaMir+uy7lT3qnzXyz
 FpjAh3aLmTdS2PAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1877A13D23;
 Wed,  9 Feb 2022 10:35:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 55hHBAiZA2LhZAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 09 Feb 2022 10:35:52 +0000
Date: Wed, 9 Feb 2022 11:35:45 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <YgOZAU+63z47I1Lf@rei>
References: <20220207144148.27033-1-andrea.cervesato@suse.de>
 <20220207144148.27033-2-andrea.cervesato@suse.de>
 <YgJPeBY+B1H9aq80@yuki>
 <3980d9c5-6d05-5974-8bab-ae52c2e96307@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3980d9c5-6d05-5974-8bab-ae52c2e96307@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/3] Add TST_THREAD_STATE_WAIT macro
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
> > Maybe we can just put this code into the existing tst_process_state.h
> > header and C source.
> The tst_safe_process_state.c implementation is currently using old API 
> and it's importing "test.h" . If we want to add TST_THREAD_STATE_WAIT 
> into tst_process_state.h then we also need to rewrite process state 
> headers/implementation files in order to support both old and new API.

Good point, I wouldn't bother. Maybe just use single header then and
keep the implementation split?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
