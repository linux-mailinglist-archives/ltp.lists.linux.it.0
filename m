Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E953CB5CB
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 12:10:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C90063C8616
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 12:10:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 140703C19CA
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 12:10:46 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 90AD5601E9B
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 12:10:45 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D874E1FE92;
 Fri, 16 Jul 2021 10:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626430244;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jm6QUgB1WUsSjfbDy1qKlO/oaIm0kEgAWEibl+bc0uA=;
 b=MvwUWJY5dSE8iH/dy8mOQLyVulr1Yrv6SC9n47h8JsaTeu8ybKB7vTGHMPWyyw80RjO7zI
 EEQXlUaToujIsVOJi6fa3OUHROMS3rrCxLQA8DMt02S+zzsVgfEZLkLOHCdc7d7/OOukQd
 XcLrmzyMwDM+FOZbfuqBleZozA+TsCE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626430244;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jm6QUgB1WUsSjfbDy1qKlO/oaIm0kEgAWEibl+bc0uA=;
 b=2KpeovTxnQ0X1mO5StOOZ5IIpCF3x4rAqDa7q2b04JppMArWmkS3lXi47P9uzzkL5r19Y3
 A7iopAfYQ3tsCYCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7570C13C6A;
 Fri, 16 Jul 2021 10:10:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8ZsdGyRb8WC6BQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 16 Jul 2021 10:10:44 +0000
Date: Fri, 16 Jul 2021 12:10:42 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YPFbIiNl3W9RR2i/@pevik>
References: <CAHLe9YYCDFxqoaciAcz4Ec9bU7cQPJM9SDL2_4ygjcaWx967-A@mail.gmail.com>
 <48573d84-20e4-11a1-6306-d82b6ada6efd@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48573d84-20e4-11a1-6306-d82b6ada6efd@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [question] tst_rhost_run.sh not installed
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

> Hi,

> Sorry for the duplicate, I forgot to add the mailing list...

> On 7/16/2021 8:13 AM, Boyang Xue wrote:
> > Hi,

> > I'm trying to build, install and run LTP like this:
> > ```
> > git clone https://github.com/linux-test-project/ltp.git repo_ltp
> > pushd repo_ltp/
> > make autotools
> > ./configure
> > make
> > make install
> > # export RHOST, LHOST, etc. test vars
> > export LTPROOT=/opt/ltp; export PATH=$LTPROOT/bin:$LTPROOT/testcases/bin:$PATH
> > ./runltp -d /test -f net.nfs
> > ```

> > During the test run, it complains that
> > ```
> > /opt/ltp/testcases/bin/tst_net.sh: line 979: bash:: command not found
> > ```
> > line#979 is:
> > ```
> > eval $(tst_rhost_run -c 'tst_net_iface_prefix -r '$IPV4_RHOST || echo "exit $?")
> > ```

> > I can find tst_net_iface_prefix in the $PATH, so it should be
> > tst_rhost_run which leads to the error.
> > Searching for tst_rhost_run in /opt/ltp and $PATH shows not found, so
> > is it a bug or did I miss something that the file wasn't installed?
> No tst_rhost_run is a shell function defined in tst_net.sh.
> I guess the problem is your RHOST setup.
> LTP supports two setups for network tests:
> 1. network namespace based. This is used if you don't set RHOST and LHOST.
> 2. Two-host setup, where RHOST points to a second host.

> The important thing in two host setup is, that $LTP_ROOT/testcases/bin is in
> the PATH for the user, that is used on the RHOST.
> I guess what happens in your setup is that tst_net_iface_prefix is not found
> on the RHOST, because it is not in the path.

+1
FYI see
https://github.com/linux-test-project/ltp/tree/master/testcases/network

Kind regards,
Petr

> Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
