Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC8F3B2C1B
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 12:06:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7B5403C8947
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 12:06:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7F9AD3C2020
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 12:06:37 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 084401001187
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 12:06:36 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E936821967;
 Thu, 24 Jun 2021 10:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624529195;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PTRILi1keHnMcmDK5v99yIkn4KGgpg/Fz6Xrf/PUJsk=;
 b=pfzoYSyKdPXEIRH9GQ44SjMcwtdtYbTxAuhFpWcaJ1V4I7XpfzGKIVLr4QlCRGmFNb03pQ
 hpWzYVJQkvQcNsF+YMhfBTFZU6yeFsgXvHYWDjrfkB/RtEQgEJMvvHJobZk0t20mzByace
 xeqs7rThWSsMGZUWvSxHywcjdDpqi4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624529195;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PTRILi1keHnMcmDK5v99yIkn4KGgpg/Fz6Xrf/PUJsk=;
 b=F3qxKe0JT2YTFoit9hiqmZnHff8T+3KxV3KQWw9NT1DL/gUUMB/x5qsB769ojJzPwcYZc0
 BusTwbpgpprFTqCw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id A54EC11A97;
 Thu, 24 Jun 2021 10:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624529195;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PTRILi1keHnMcmDK5v99yIkn4KGgpg/Fz6Xrf/PUJsk=;
 b=pfzoYSyKdPXEIRH9GQ44SjMcwtdtYbTxAuhFpWcaJ1V4I7XpfzGKIVLr4QlCRGmFNb03pQ
 hpWzYVJQkvQcNsF+YMhfBTFZU6yeFsgXvHYWDjrfkB/RtEQgEJMvvHJobZk0t20mzByace
 xeqs7rThWSsMGZUWvSxHywcjdDpqi4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624529195;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PTRILi1keHnMcmDK5v99yIkn4KGgpg/Fz6Xrf/PUJsk=;
 b=F3qxKe0JT2YTFoit9hiqmZnHff8T+3KxV3KQWw9NT1DL/gUUMB/x5qsB769ojJzPwcYZc0
 BusTwbpgpprFTqCw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id WPlwJStZ1GBZVwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Thu, 24 Jun 2021 10:06:35 +0000
Date: Thu, 24 Jun 2021 12:06:34 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YNRZKs9cHbGxzg4Q@pevik>
References: <fc235ab1-4796-c1d4-d5b0-f1f112c9ce54@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fc235ab1-4796-c1d4-d5b0-f1f112c9ce54@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC] fs_bind rework
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
Cc: LTP List <ltp@lists.linux.it>, Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> Hi,

> is there any reason, why the fs_bind suite cannot be reworked into "real"
> ltp tests?
> At the moment all tests from the suite are run by the wrapper script.
Thanks for having a look into dark areas of LTP :). Various testsuites were
imported in 2008, with questionable quality even then, with very little
maintenance since then. There is no reason, just nobody has had a time for =
that.

First it'd be good to check how much relevant are these tests nowadays.
Ideally asking on relevant kernel mailing list (probably fstests and
linux-fsdevel).

Also checking whether there is a kselftest contain similar test,
to compare which one is more perspective to spend time on improving it.
Quickly looking, there is just tools/testing/selftests/mount (testing wheth=
er
unprivileged user cannot remount a read-only mount bind mount as read-write)
and tools/testing/selftests/mount_setattr, thus not really much.

FYI We've been also porting some kselftest tests to LTP (these being releva=
nt
and reasonable clean; benefits are 1) more readable code due lack of reason=
able
kselftest API 2) support for more kernel versions).

> If I would convert them, I'd try this programmatically, because of the hu=
ge
> number of tests.
> 1. Move stuff from test_fs_bind.sh to a library file
> 2. Convert all tests in fs_bind/* to ltp tests using the library and addi=
ng
> them to the runtest file

If there is something just for these tests, maybe just converting it to
fs_bind_lib.sh, which use tst_test.sh and be used by tests - usual approach=
, see
e.g. cgroup_lib.sh, ipsec_lib.sh (which uses tst_net.sh). Or maybe having m=
ore
libs as it looks to me there are more separate test groups (rbind, cloneNS).
Also tools in fs_bind/bin probably have LTP API alternatives.

> This would make every single fs_bind test a single ltp test (~100).
> I do not think that runtime increases significantly, because as far as I =
see
> it from first glance, test_fs_bind.sh resets the "sandbox" used for the
> tests before every test anyway.
Yep, I wouldn't be worry about increased runtime, this is actually the pref=
erred
approach. Also, various tests can be probably grouped into single shell tes=
t,
with $TST_CNT (looking into tests in fs_bind/cloneNS).

> If there is no objection, I would give converting the tests a shot.
+1

> J=F6rg

Kind regards,
Petr

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
