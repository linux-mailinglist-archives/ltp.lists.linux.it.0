Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA0E60D161
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Oct 2022 18:13:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D55713CA346
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Oct 2022 18:13:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 364853C793C
 for <ltp@lists.linux.it>; Tue, 25 Oct 2022 18:13:40 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 311D71400C41
 for <ltp@lists.linux.it>; Tue, 25 Oct 2022 18:13:39 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 035BB1FA17;
 Tue, 25 Oct 2022 16:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1666714419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xRODuzqUQe92+2XIMZKu5uZHHjOfs/A1xUzm06n/l9U=;
 b=VAoS+a+Gj6cvrnnlCc+f1GEdJilhZnl7jV4lu1w9mpqsingNYMYx91LZADGTSndZSyv7X9
 cy22ApCKBLUTcCFL+9ZjsPluHHWUnPFa9LTIhfz42XNjd/R34XIzBuVNgpUlBRLnwrgSQ4
 kXHDLPFIerQBbonH4J3q50yrXwupKik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1666714419;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xRODuzqUQe92+2XIMZKu5uZHHjOfs/A1xUzm06n/l9U=;
 b=YsAyG3xVE2MLUVVGewXFLTutqa+wyMgfL5pRmpihV6Bniy3JIT/KRML6+4TAsvTtu1ajCd
 8Hci/0MbrRqzZsAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF995134CA;
 Tue, 25 Oct 2022 16:13:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6sxENTILWGOWFQAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Tue, 25 Oct 2022 16:13:38 +0000
Message-ID: <3f3dca4e-79d9-9e5b-293f-f27c6644dec8@suse.cz>
Date: Tue, 25 Oct 2022 18:13:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Jan Stancek <jstancek@redhat.com>, Petr Vorel <pvorel@suse.cz>
References: <20221021155740.8339-1-mdoucha@suse.cz> <Y1MCbP1yjLOuoPLb@pevik>
 <CAASaF6ySEcVE=b-7nGy+FeLyg_6dNMjL6J_bivjZ6JYzSx5b=w@mail.gmail.com>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <CAASaF6ySEcVE=b-7nGy+FeLyg_6dNMjL6J_bivjZ6JYzSx5b=w@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] save_restore: Check whether path is writable
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 24. 10. 22 9:16, Jan Stancek wrote:
> On Fri, Oct 21, 2022 at 10:35 PM Petr Vorel <pvorel@suse.cz> wrote:
> Problem description makes it sound like this issue affects all 3 types
> of config options. Isn't the problem affecting only optional config paths?
> 
> Having entry with "(no prefix)" or "!" in save_restore implies that
> test wants to write to that path - if we TCONF on root privileges or
> read/write access probably doesn't make much difference - we can't
> continue.
> 
> For "?" prefix, I agree that since its optional, test should be able
> to run cleanly without root privileges.

It does affect all 3 but slightly differently, depending on the "val" 
field of the respective .save_restore item. The current implementation 
behaves like this without root privileges:
- (no prefix): If val is NULL, the test will save the data, run the test 
and trigger TWARN at the end. If val is not NULL, the test will fail 
immediately after saving sysfile data because it'll try to write into a 
read-only file. We'd want TCONF instead in the latter case.
- '!': Same behavior as with no prefix but we want to keep it.
- '?': Same behavior as with no prefix. We want either TCONF or to 
ignore the sysfile entirely with a TINFO message.

> For optional path, if test can't read/write it (b/o of no root privileges),
> I think library shouldn't try to save it - then that would also skip
> attempt to restore it.

There are be two different kinds of optional paths, though:
1) paths that sometimes don't exist but must be written to if they do
2) paths that may be left alone if they exist and already contain the 
right value (otherwise TCONF)

So the question is whether I should steal the '?' prefix for type #2 and 
we'll introduce a new prefix later if needed, or whether we'll reserve 
the '?' prefix for type #1 according to current behavior and introduce 
the new prefix now.

On 21. 10. 22 22:34, Petr Vorel wrote:
> Looking at files which use '?', some of them (mostly network related, I guess
> written/rewritten by Martin) use SAFE_TRY_FILE_PRINTF() on
> /proc/sys/user/max_user_namespaces. It looks to me these need to to skip
> read-only files, i.e. define new flag with this behavior.

All those SAFE_TRY_FILE_PRINTF() calls are writing a constant so they 
can be eliminated by filling the second field of the .save_restore 
struct. I'll do that in the follow-up patchset when we agree how to 
implement this part.

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
