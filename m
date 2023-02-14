Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B1069679D
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Feb 2023 16:08:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 731513CC7B1
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Feb 2023 16:08:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F2F0D3CB4DB
 for <ltp@lists.linux.it>; Tue, 14 Feb 2023 16:08:26 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6BE3560068B
 for <ltp@lists.linux.it>; Tue, 14 Feb 2023 16:08:25 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A3F5621892;
 Tue, 14 Feb 2023 15:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1676387305; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N2wsVg9Xy9watQ0N4rff4KqGhdG2U9pT/nPqydJSJxs=;
 b=MFt/P5NbrOxIkeIoSP27rgl2BhJuVUdqJP0cwc3hGFXhor6YjQjILeylQpZFVLTQRLpMkR
 OlGJL4Na/oW8MnB0t71ZBg9w4UJ9alHd30dM87w6vsZ+mJJ/fOT6duCGSkSrNqPsPFvufg
 XDiUQDkOa6gGGGYYjBsQ6GRvqHmYutU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1676387305;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N2wsVg9Xy9watQ0N4rff4KqGhdG2U9pT/nPqydJSJxs=;
 b=Tur/3See5ry20bZK/BFpe3jvzZ2pGmGugZ6dlr9v2o8rjnJ1CxjNMliCaYAf71uaMjFmrh
 R4+vNVEdqCNGzsCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8F4C0138E3;
 Tue, 14 Feb 2023 15:08:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4Rd3Iumj62O+aQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 14 Feb 2023 15:08:25 +0000
Date: Tue, 14 Feb 2023 16:09:52 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Leo Liang <ycliang@andestech.com>
Message-ID: <Y+ukQAh4GMXh1TiK@yuki>
References: <20230214122509.2957225-1-ycliang@andestech.com>
 <20230214122509.2957225-2-ycliang@andestech.com>
 <Y+uOimkvJ76Q8diX@pevik> <Y+uQB1iojD/0oQDY@yuki>
 <Y+uYAn0RyjKBTfj4@ubuntu01> <Y+uZ+ngyoz94gp9e@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+uZ+ngyoz94gp9e@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [v2 2/2] lib/tst_pid.c: Increase PIDS_RESERVED to avoid
 fork failure.
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
> > > > > After Adjusting how we count used pid, we increase
> > > > > the number of PIDS_RESERVED to void fork failure.
> > > > nit: in this case I'd actually keep changes in single commit
> > > > (otherwise first commit alone would break tests),
> > > 
> > > Do we get a different result from ps and parsing /proc? That sounds
> > > strange...
> > 
> > I think that's because "ps -eT" would list threads with the same PID
> > but with different SPID.
> > 
> > I get the following output on my VM.
> > 
> > ycliang@ubuntu01:~$ ps -eT | wc -l
> > 170
> > ycliang@ubuntu01:~$ ls -d /proc/[0-9]* | xargs -n1 | wc -l
> > 127
> 
> Adjusting the RESERVED constant is then a lousy workaround that wouldn't
> work for systems with many threads per process.
> 
> One alternative would be to open /proc/$PID/status and read the number
> of threads from there. Should be as easy as one call to
> SAFE_FILE_LINES_SCANF().

Thinking of it again using SAFE_FILE_LINES_SCANF() may be prone to a
race where the process exits and the file disappears between the call to
the readdir() and the open in the SAFE_FILE_LINES_SCANF() so I suppose
that we should use just the FILE_LINES_SCANF() instead and add the
threads value only if the call succeeded.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
