Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F165B698EF1
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Feb 2023 09:45:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B56C33CBEE8
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Feb 2023 09:45:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4DF723CB1CD
 for <ltp@lists.linux.it>; Thu, 16 Feb 2023 09:45:34 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C8C951A00A56
 for <ltp@lists.linux.it>; Thu, 16 Feb 2023 09:45:33 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B4B49208D0;
 Thu, 16 Feb 2023 08:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1676537132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D+K3Wt1E6Xxthwh3HU7vGuJSBu+mftdwzfr6X4gYN/Y=;
 b=CzgNUG70GGhFiOUzEuOki2l4z0yXC/fInDqwK1VarZ8jAOjTKMDkVDO6QkM8ztFwhYT5YX
 +dWkENDXKZfpdh9NjJYsubdLwUueHnNRWFhpo0lS1EBqjA58HO4vZEo7jwIVMNpQt3NrD7
 xSaYd+TI5n0FlHdJA73Qvq/BK08vMIE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1676537132;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D+K3Wt1E6Xxthwh3HU7vGuJSBu+mftdwzfr6X4gYN/Y=;
 b=eZgi0kcStQ/VqdUNLF2HclMpj5RtbJqyRkw3xUB25b70Si1PI1nontCbh0PuANHAQrmjlW
 rsRNA2wZGAj3OqDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A0D7C13484;
 Thu, 16 Feb 2023 08:45:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tCDYJizt7WMXFQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 16 Feb 2023 08:45:32 +0000
Date: Thu, 16 Feb 2023 09:46:59 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Leo Liang <ycliang@andestech.com>
Message-ID: <Y+3tg68PkP7ce2eV@yuki>
References: <20230214122509.2957225-1-ycliang@andestech.com>
 <20230214122509.2957225-2-ycliang@andestech.com>
 <Y+uOimkvJ76Q8diX@pevik> <Y+uQB1iojD/0oQDY@yuki>
 <Y+uYAn0RyjKBTfj4@ubuntu01> <Y+uZ+ngyoz94gp9e@yuki>
 <Y+ukQAh4GMXh1TiK@yuki> <Y+3B1yAqIMrivj1O@ubuntu01>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+3B1yAqIMrivj1O@ubuntu01>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
> Just out of curiosity, is there any reason that we should do this in plain C ?
> (Otherwise, we could drop this patchset and stay with the current implementation)

There are a few, calling random scripts from C is a bad practice
overall.

Portabilitity may be one of the problems, there are several
iimplementations of the basic UNIX utilities for Linux eg. coreutils,
busybox, toybox, etc. These implemtations are subtly incompatible, not
all commandline options are supported and so on. And for the busybox and
toybox some options can be disabled at a compile time. We leaned that
sometimes you have to double check if the functionality available and
most of the time the end result is that it's just easier to rewrite the
code in C.

We also have rule to make tests as self contained as possible, which
simplifies debugging. One of the problems is that we do not have the
environment the shell code runs in under control, we had a few test
failing for non-standard settings of the LANG variables.

In this case the code is reasonably simple, so it will be less likely to
be problematic, however I would stil lean towards replacing it with C
code.

tl;dr Calling shell code from C programs makes things less predictable
      and possibly unstable.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
