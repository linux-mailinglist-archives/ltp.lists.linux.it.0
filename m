Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D149C69630F
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Feb 2023 13:05:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 216603CC5E8
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Feb 2023 13:05:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CF77F3C1D84
 for <ltp@lists.linux.it>; Tue, 14 Feb 2023 13:05:45 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 412DE1A00807
 for <ltp@lists.linux.it>; Tue, 14 Feb 2023 13:05:44 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 32F2A1F383;
 Tue, 14 Feb 2023 12:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1676376344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O5TDemRf2SUiAoPME0GRRG1fyA2XKElbOzOl7uPbk7M=;
 b=wnJvIL/l0NN/5UMg236bZDpjsWuZAFRLE1m3wHzqKqNsVzpx7iRG5qO4JjntAfvFbbb+Om
 pYStAT8mVmt4Ks7HMKbO6cNBb01RxvSvMQDOS+sZmnPbIKrz6uPdC7521tLuRsJXASF4va
 O8g0v5HsJe0RVkMfD5rTcF19UW6g66w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1676376344;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O5TDemRf2SUiAoPME0GRRG1fyA2XKElbOzOl7uPbk7M=;
 b=tsTE8qr2s4rc/PPUExCievKP1B6J/wv81QYMAl0ryCnWdljmXJnWzpHlX791RjHBS5E3hp
 EMaJIbkf8GXUl+Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A55113A21;
 Tue, 14 Feb 2023 12:05:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uiLPBRh562OfDgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 14 Feb 2023 12:05:44 +0000
Date: Tue, 14 Feb 2023 13:07:10 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <Y+t5bm5dn/BzKnYj@yuki>
References: <20230208091120.9994-1-andrea.cervesato@suse.com>
 <Y+ZDlj7gSCgdWFC1@yuki>
 <5be1311a-6057-5362-93f6-ee623279e79e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5be1311a-6057-5362-93f6-ee623279e79e@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] Refactor pidns30 test using new LTP API
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
> >> +static void run(void)
> >>   {
> >> -	int status;
> >> -	char buf[5];
> >> -	pid_t cpid;
> >> +	const struct tst_clone_args args = { CLONE_NEWPID, SIGCHLD };
> >>   
> >> -	setup();
> >> +	remove_mqueue(mqd);
> >> +	received = 0;
> > I wonder if we really need to clear the flag here, as far as I can see
> > we only modify that variable in the child process and that shouldn't
> > propagate to parent, unless we pass CLONE_VM of course.
> Flag reset has been added to be 100% sure we are receiving the signal on 
> -i > 1.

My point was that the variable is only changed in the child process,
that means that this change will never make it back to the parent since
the whole VM is copy-on-write...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
