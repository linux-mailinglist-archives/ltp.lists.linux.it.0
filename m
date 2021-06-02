Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B75EA398E40
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Jun 2021 17:18:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5314B3C551E
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Jun 2021 17:18:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3C5E23C54B7
 for <ltp@lists.linux.it>; Wed,  2 Jun 2021 17:18:30 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B419E10007DE
 for <ltp@lists.linux.it>; Wed,  2 Jun 2021 17:18:29 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C66B01FD71;
 Wed,  2 Jun 2021 15:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622647108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nHmmSY5vJlGOI6+kamX5sCNjgfqTUh2lUNTPlykUHIw=;
 b=oILpN8pnjA9H0AJzhwXirDeKLB6ywibW6Db1rn4Fp4Qcp6DrZEBKK4ROcnxWLGr732KVJK
 x8DGzTp6xZSgG8ZZLPT+FZprfLHmtkGfvE3u8syU3e4f0mbsP9SaE4Nm9DmSPa/tjTDvcN
 hJ3Kn3lOR6h033gba0k2ifzEcfnfyjY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622647108;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nHmmSY5vJlGOI6+kamX5sCNjgfqTUh2lUNTPlykUHIw=;
 b=As89al3h65afxc1kg4IC0zMNET3oaAmnZ4gcUwyBTpq3LNoqilDw2ZQvTG0LRil2s24L/n
 kywbP5XsFIRvvBAQ==
Received: by imap.suse.de (Postfix, from userid 51)
 id C1CA811CD7; Wed,  2 Jun 2021 15:28:32 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 8A1DA11E0D;
 Wed,  2 Jun 2021 12:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622636143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nHmmSY5vJlGOI6+kamX5sCNjgfqTUh2lUNTPlykUHIw=;
 b=r/Qlu42EonBDMF/aIJ3UVMVcqzQFoiQ6mNnBmD+fQ9UPURdd06nzRT0GZykOyAftRi/Qel
 BWPL6mhR/J/QcYriIKWxB+RohbJ/rEDLK/lzIGUC+OWQ6FYpkHA8XEiEde6OQIyXOfzJ0A
 XA6zs+4VtsgsykP3AAroy3ZRor/+ShU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622636143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nHmmSY5vJlGOI6+kamX5sCNjgfqTUh2lUNTPlykUHIw=;
 b=pH82Oh8DYCl9b6oZevky7fOE5LhrfcK2cTUblPj0vPkpf7acYk+rkI2qq8w1GzX7rKhpd+
 BmNdK6MzkS+LijCg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Ll2MIG92t2D6EwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 02 Jun 2021 12:15:43 +0000
Date: Wed, 2 Jun 2021 13:49:52 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Zorro Lang <zlang@redhat.com>
Message-ID: <YLdwYJ3Kw5qf64d2@yuki>
References: <20210601155427.996321-1-zlang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210601155427.996321-1-zlang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ltp-aiodio: help aiodio test work normally
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
> ltp aiodio related cmdfiles (runtest/ltp-aio*.part*) can't be used,
> due to they have unfixed path name. Before we run aiodio test, we
> need to create some files (e.g. junkfile), and give it to the tests.
> But current cmdfiles use too many $TMPDIR and aiodio.$$ things, e.g:
> 
>   AD022 time aiocp -b 1k -n 64 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
> 
> TMPDIR is a directory created by `mktemp ${TMPBASE}/ltp-XXXXXXXXXX`,
> it's not a fixed path. The aiodio.$$ is also can be sure before
> running ltp. That cause we can't prepare files in the unfixed path.
> Even the testscripts/ltp-aiodio.sh can't work well either, due to it
> try to create files in $TMP/aiodio/..., the $TMP is $TMPBASE, not
> $TMPDIR, and aiodio is not aiodio.$$.
>
> So this patch trys to help runtest/ltp-aio*.part* to use fixed path
> name, and put all aiodio test related files in $TMPBASE/aiodio/, the
> $TMPBASE is a fixed pathname comes from runltp -d <directory> option.
> So after this fix, users will know where they should create files in,
> no matter running ltp-aiodio.sh or runltp -f runtest/ltp-aio*.part*.

I do not like this solution. I think that we should instead fix the
scripts. I think that the runltp should just export TMPDIR if it was
passed on commandline and it should be the resposibility of the caller
to set up a temporary directory somewhere in /tmp in that case.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
