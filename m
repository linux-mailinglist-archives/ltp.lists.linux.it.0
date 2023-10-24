Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2316F7D4C82
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Oct 2023 11:34:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C5C343CEC76
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Oct 2023 11:34:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D68213CCE48
 for <ltp@lists.linux.it>; Tue, 24 Oct 2023 11:34:03 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0A8A11A0C247
 for <ltp@lists.linux.it>; Tue, 24 Oct 2023 11:34:02 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A6E762189E;
 Tue, 24 Oct 2023 09:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1698140041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jIHaUscQTq1/wxwXcDzx5FjA6aS8KhMLGKHlRvr84P4=;
 b=Taeu222UV9/DMDpx+957XHJpswK8QtqtYGHN1uLSpQ81q3ZbEI4u1QL0qU+C42fUn+sgDS
 i7FnNcPjV2ZfcE67admWeGxW/8bMz8+JkEm10iV1O2Y4Q/CHBhdBIMthFMLYJMlyEpGXqj
 rN37fr9zRKJ41rNYsYHsoR91TZqx8pA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1698140041;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jIHaUscQTq1/wxwXcDzx5FjA6aS8KhMLGKHlRvr84P4=;
 b=6swiuuTumTS5psyi1mb8eNNLazSJ9YvK6C10hwZ0DfJG0JR6SkC0WoR3U+Me5UmGiot67X
 56CQibwllqrJMIBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8CBF1134F5;
 Tue, 24 Oct 2023 09:34:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sAkpIYmPN2XTCAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 24 Oct 2023 09:34:01 +0000
Date: Tue, 24 Oct 2023 11:34:33 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <ZTePqRn48CjcZT1T@yuki>
References: <20231016123320.9865-1-chrubis@suse.cz>
 <20231016123320.9865-4-chrubis@suse.cz> <87fs20v07j.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87fs20v07j.fsf@suse.de>
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -7.60
X-Spamd-Result: default: False [-7.60 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 NEURAL_HAM_LONG(-3.00)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 REPLY(-4.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCPT_COUNT_SEVEN(0.00)[8];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_NOT_FQDN(0.50)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.00)[37.18%]
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/4] syscalls: accept: Add tst_fd test
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
Cc: mszeredi@redhat.com, brauner@kernel.org, Jan Kara <jack@suse.cz>,
 Matthew Wilcox <willy@infradead.org>, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >  int invalid_socketfd = 400; /* anything that is not an open file */
> > -int devnull_fd;
> >  int socket_fd;
> >  int udp_fd;
> >  
> > @@ -45,10 +44,6 @@ static struct test_case {
> >  		(struct sockaddr *)&fsin1, sizeof(fsin1), EBADF,
> >  		"bad file descriptor"
> >  	},
> > -	{
> > -		PF_INET, SOCK_STREAM, 0, &devnull_fd, (struct sockaddr *)&fsin1,
> > -		sizeof(fsin1), ENOTSOCK, "fd is not socket"
> > -	},
> >  	{
> >  		PF_INET, SOCK_STREAM, 0, &socket_fd, (struct sockaddr *)3,
> >  		sizeof(fsin1), EINVAL, "invalid socket buffer"
> > @@ -73,8 +68,6 @@ static void test_setup(void)
> >  	sin0.sin_port = 0;
> >  	sin0.sin_addr.s_addr = INADDR_ANY;
> >  
> > -	devnull_fd = SAFE_OPEN("/dev/null", O_WRONLY);
> > -
> >  	socket_fd = SAFE_SOCKET(PF_INET, SOCK_STREAM, 0);
> >  	SAFE_BIND(socket_fd, (struct sockaddr *)&sin0, sizeof(sin0));
> >  
> > @@ -88,7 +81,6 @@ static void test_setup(void)
> >  
> >  static void test_cleanup(void)
> >  {
> > -	SAFE_CLOSE(devnull_fd);
> >  	SAFE_CLOSE(socket_fd);
> >  	SAFE_CLOSE(udp_fd);
> >  }
> 
> Is this supposed to be part of the patchset?
> 
> I don't mind, but if we are strict, it should be in another commit.

That removes ENOTSOCK test that is now handled in accept03, I suppose I
should have explained that better in the comit message.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
