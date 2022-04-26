Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 188AE5102F8
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Apr 2022 18:14:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A3BD63CA450
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Apr 2022 18:14:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 08A6C3C9B81
 for <ltp@lists.linux.it>; Tue, 26 Apr 2022 18:14:09 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7E46E6002F9
 for <ltp@lists.linux.it>; Tue, 26 Apr 2022 18:14:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B27B21F380;
 Tue, 26 Apr 2022 16:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1650989648; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wZizFmiMQDUxhDofNU/9lMcVeKJEbITkIGvo91QVuVA=;
 b=YtdwcvnlpG787XZYEYh8JQi/AzSeDV+QJsLxYO75X2W/gGF1EpX4aKYyKUMEo/TK7hxO6a
 ZyqmbnP7WSvfHptx4FDakfC0VwdErllB/spvj4OJVyhXseNCIOFefzm/YrjgDmN+SHOdIN
 5ou9jvsrJHYoFtk5xczeSzgMVP0GjLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1650989648;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wZizFmiMQDUxhDofNU/9lMcVeKJEbITkIGvo91QVuVA=;
 b=ENmTfYgdrVVP56rFqjzIPSOiEqRJe4cRjPp8dusoWl6ZQ0Mrxvg4eXvMwGwnbWobXNgcYg
 +7D3FN5Fuw9BUtBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9F4FA13223;
 Tue, 26 Apr 2022 16:14:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /ubSJVAaaGLWegAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Tue, 26 Apr 2022 16:14:08 +0000
Message-ID: <c7b54e0f-641d-9188-fd29-4b1b35bf27a7@suse.cz>
Date: Tue, 26 Apr 2022 18:14:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Cyril Hrubis <chrubis@suse.cz>
References: <20220406110837.14773-1-mdoucha@suse.cz> <Yma8g4NUSRAIvMAW@yuki>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <Yma8g4NUSRAIvMAW@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.8 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls: Check for leftover partition info in
 loopdev ioctl tests
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

On 25. 04. 22 17:21, Cyril Hrubis wrote:
> Hi!
>> Due to a kernel bug, successful ioctl09 and ioctl_loop01 test runs
>> sometimes leave behind stale partition info on the loop device they used,
>> which then causes mkfs.vfat to fail in later tests. Check that partition
>> info was properly removed in cleanup.
>>
>> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
>> ---
>>
>> This does not fix the mkfs.vfat failures but it makes the true cause visible.
>> We could add a workaround for the mkfs.vfat failures by simply initializing
>> the loop device with the LO_FLAGS_PARTSCAN flag by default, or at least when
>> stale partition info is found by tst_find_free_loopdev().
> 
> I guess that it would be cleaner to put the stale partition info
> detection into the loop library. We can print a warning there and then
> do the workaround.

The workaround needs to be added into tst_attach_device(). It doesn't
make sense to add it to test cleanup, in part because
tst_detach_device() can and occasionally does fail on timeout.

On the other hand, we need a cleanup check in ioctl tests which create
partitions on loop devices, otherwise they'll leave garbage behind silently.

> Also do we want to add a regression test for the stale partition info?
> Should be easy enough. Or at least add the hash of the kernel commit
> that fixed it to the ioctl tests?

I haven't investigated deep enough to find out how to reliably trigger
the bug or which patch fixed it (if any). Regression test would be nice
but it's not a trivial task at the moment.

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
