Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D54442D84
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Nov 2021 13:06:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 89A6F3C711B
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Nov 2021 13:06:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EB19F3C697C
 for <ltp@lists.linux.it>; Tue,  2 Nov 2021 13:06:42 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5C667600704
 for <ltp@lists.linux.it>; Tue,  2 Nov 2021 13:06:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AB7BF1FD75;
 Tue,  2 Nov 2021 12:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635854801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vGKX09vg5cvV9vgPaBBH52c8ujpqPA6iYWDTL3PAU6M=;
 b=qRlQiX+IHrsB9CH4qPAetT3t9YJZWAlq6giiII4n+4XI1kGAyqGQ+eoJRZq6uPQf11FFVO
 QBYLc16WjbnXeTShbFuGyHtzyEZOAo/XWO+hvohAGwBYmHvRsec06vYczKzomHTX2qvTej
 X6jPk3PRvA5FiJIO5j1LUSs+xf8BDGU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635854801;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vGKX09vg5cvV9vgPaBBH52c8ujpqPA6iYWDTL3PAU6M=;
 b=SSpJdupcC8MfrvzhNXjgpQzJOjL4l5hq0qu7/W6e1unb7ZOXm7TK4jt5seBQsslcoTLpQd
 uY+Nct532ZlrTvDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9919513BF7;
 Tue,  2 Nov 2021 12:06:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Sb3VJNEpgWGZXQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 02 Nov 2021 12:06:41 +0000
Date: Tue, 2 Nov 2021 13:07:36 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YYEqCApMgxUAoY7X@yuki>
References: <20211101145342.7166-1-chrubis@suse.cz>
 <20211101145342.7166-5-chrubis@suse.cz> <87o872ok4b.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o872ok4b.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/7] docparse: Implement ARRAY_SIZE()
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
> > +
> > +		if (strcmp(buf[cur_buf], "]") && strcmp(buf[cur_buf], "[")) {
> 
> So this seems to mean we would silently ignore a variants array which
> was declared with an explicit size. A quick grep doesn't turn up any
> instances of that. However this would be an unexpected result. People
> may intuitively think adding an explicity size would make parsing
> easier.

I would say that adding explicit size to arrays whose size is defined
by their initialize is a mistake, at least in our case so I'm inclined
to keep this as it is.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
