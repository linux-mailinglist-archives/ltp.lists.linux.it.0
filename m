Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DFED7962243
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Aug 2024 10:24:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 91E583D2789
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Aug 2024 10:24:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3228A3C7031
 for <ltp@lists.linux.it>; Wed, 28 Aug 2024 10:24:17 +0200 (CEST)
Authentication-Results: in-3.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3EDAC1A0C24E
 for <ltp@lists.linux.it>; Wed, 28 Aug 2024 10:24:16 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E25601FBED;
 Wed, 28 Aug 2024 08:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1724833456;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W2dRgp/cBG57vE4RNJLl2sr2qXzWa1FUbUXiUJzbitg=;
 b=FTtsjl5po3CoQnQekyUMbJqX9PfLMUWt55Jtp3m0EghDvwX+K5/jnaDb3RfkXMnZl4hH02
 XbcL5EuTAjwWVSK4q0mkbQm+X2ougQcCIm6OZohVOYkeUuFwN306lsJXPnWOOw+uIyqp+J
 RLd0X7C2l1AkdNi85/2VcK2Fxc+5X9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1724833456;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W2dRgp/cBG57vE4RNJLl2sr2qXzWa1FUbUXiUJzbitg=;
 b=mGrIHvPQRLxsntLWxrBQ3ClQSJlZsuiWav9SoZUBmIhlC/OhHtICGOp2WYZXKZ/7IjB+oC
 sR1xfRh+k67JUKDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1724833455;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W2dRgp/cBG57vE4RNJLl2sr2qXzWa1FUbUXiUJzbitg=;
 b=GQsK3PVg9oGugtR68o19eFJQORMr7wx/RnunSrXtoSnVn7UCVNvI/I2WBFz9Ti3Vn1AS3g
 U96aBnPg4Isce0OWqo0SeXUSaqN89dNn36YSSC3jYKLojFgi/rl1rVrcOYt8sethLphXp4
 NPGug4WhFpMk/zZImqRWFJBM34opBl8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1724833455;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W2dRgp/cBG57vE4RNJLl2sr2qXzWa1FUbUXiUJzbitg=;
 b=PNdyiilAOEnTCDQ8BqZPWlIECBz9DIgkDblcApU6gnmkyDx8I0hfNYUut50IX5ugodxsJj
 OQRy0WIin7yJjEDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E573138D2;
 Wed, 28 Aug 2024 08:24:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AnAxJa/ezmYTQQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 28 Aug 2024 08:24:15 +0000
Date: Wed, 28 Aug 2024 10:24:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: NeilBrown <neilb@suse.de>
Message-ID: <20240828082410.GA1665124@pevik>
References: <> <9afef16d-52b2-435d-902a-7ccfa5824968@suse.cz>
 <172479295459.11014.9802161915427616319@noble.neil.brown.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <172479295459.11014.9802161915427616319@noble.neil.brown.name>
X-Spam-Score: -7.50
X-Spamd-Result: default: False [-7.50 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:replyto,suse.cz:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 1/1] nfsstat01: Update client RPC calls for
 kernel 6.9
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
Cc: linux-nfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 stable@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Neil,

> On Tue, 27 Aug 2024, Martin Doucha wrote:
> > On 23. 08. 24 23:59, NeilBrown wrote:
> > > On Fri, 23 Aug 2024, Petr Vorel wrote:
> > >> We discussed in v1 how to fix tests.  Neil suggested to fix the test the way so
> > >> that it works on all kernels. As I note [1]

> > >> 1) either we give up on checking the new functionality still works (if we
> > >> fallback to old behavior)

> > > I don't understand.  What exactly do you mean by "the new
> > > functionality".
> > > As I understand it there is no new functionality.  All there was was and
> > > information leak between network namespaces, and we stopped the leak.
> > > Do you consider that to be new functionality?

> > The new functionality is that the patches add a new file to network 
> > namespaces: /proc/net/rpc/nfs. This file did not exist outside the root 
> > network namespace at least on some of the kernels where we still need to 
> > run this test. So the question is: How aggressively do we want to 
> > enforce backporting of these NFS patches into distros with older kernels?

> Thanks for explaining that.  I had assumed that the the file was always
> visible from all name spaces, but before the fix every namespace saw the
> same file.  Clearly I was wrong.


> > We have 3 options how to fix the test depending on the answer:
> > 1) Don't enforce at all. We'll check whether /proc/net/rpc/nfs exists in 
> > the client namespace and read it only if it does. Otherwise we'll fall 
> > back on the global file.
> > 2) Enforce aggressively. We'll hardcode a minimal kernel version into 
> > the test (e.g. v5.4) and if the procfile doesn't exist on any newer 
> > kernel, it's a bug.
> > 3) Enforce on new kernels only. We'll set a hard requirement for kernel 
> > v6.9+ as in option 2) and check for existence of the procfile on any 
> > older kernels as in option 1).

> I think there are two totally separate questions here.
> 1/ How to fix the existing test to work on new and old kernels.  The
>   existing test checked that the rpc count increased when NFS traffic
>   happened.  I think 1 is the correct fix.  I don't think the test
>   should check kernel version.

> 2/ We have discovered a bug and want to add a test to guard against
>   regression.  This should be a new test.  That test can simply check if
>   the given file exist in a non-init namespace.  I have no particular
>   opinion about testing kernel versions.  A credible approach would be
>   to choose the oldest kernel which it still maintained at the time that
>   that bug was discovered.  Or maybe create a list of kernel versions
>   where were maintained at that time and only run the test on versions
>   in that list, or after the last in the list.

> I really think there is value in having two different tests because we
> are testing two different things.

IMHO this is 3), just split in 2 tests (maybe more obvious for a reviewer).
Sure, we can be explicit and split it into 2 tests.

Regards the version, I would really either draw the line for new change for 6.9
or whatever stable will be the last which gets that. I mean, if it's e.g. 5.14,
this test should fail on some old e.g. unsupported 5.15 some companies may test.
When we in LTP test if fix is still working (no regression), usually the same
tests is used to verify if the fix was applied.

Kind regards,
Petr

> Thanks,
> NeilBrown



> > -- 
> > Martin Doucha   mdoucha@suse.cz
> > SW Quality Engineer
> > SUSE LINUX, s.r.o.
> > CORSO IIa
> > Krizikova 148/34
> > 186 00 Prague 8
> > Czech Republic




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
