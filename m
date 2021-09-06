Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E217401C42
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Sep 2021 15:27:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6147A3C9784
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Sep 2021 15:27:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D65183C260E
 for <ltp@lists.linux.it>; Mon,  6 Sep 2021 15:27:02 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5AA171A00A43
 for <ltp@lists.linux.it>; Mon,  6 Sep 2021 15:27:01 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 697F51FF01;
 Mon,  6 Sep 2021 13:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630934821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Xeg8Wl5Ht9Px3ck/U9rd05zFWHARuc2w9r6+uspN7I=;
 b=GHuDkrcmJHQoKNmz9GNKXRoEaEbPY6dGGQ5rs/m24ct8CA4+IebA167n1ZW2zWqw2mfTV6
 iHoQXBVVYNwoxf0cxi0NG+V9EZlOW9ty7oMOuycm1r7e2ASn63HD9NW2A0t54KHskjDPvy
 oydlaZEHy0M7hUQ4JAd+G7jgKa5gGrM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630934821;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Xeg8Wl5Ht9Px3ck/U9rd05zFWHARuc2w9r6+uspN7I=;
 b=Ls/6kZrKoewMz6j3ru+lU+fAz6am/evz1V6yBMs/KD7qxtwI64c/pobqWFvQWHyA4FOoNw
 FyF7KV2Mxc+M/pAg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 4FDC613991;
 Mon,  6 Sep 2021 13:27:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id iN1BEiUXNmHkQAAAGKfGzw
 (envelope-from <mdoucha@suse.cz>); Mon, 06 Sep 2021 13:27:01 +0000
Message-ID: <1bd7a640-363d-6f7e-b221-613688906e09@suse.cz>
Date: Mon, 6 Sep 2021 15:27:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Content-Language: en-US
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210903154848.18705-1-mdoucha@suse.cz>
 <20210903154848.18705-5-mdoucha@suse.cz> <YTYJUPFc75TuOJSb@yuki>
 <77fd98d9-5257-c1da-a01b-77d8cc1b6bce@suse.cz> <YTYOpPM5uupQrayf@yuki>
 <2ce3b46e-b503-a44d-8c16-819e587e217a@suse.cz> <YTYSMBjdtVayFnOc@yuki>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <YTYSMBjdtVayFnOc@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/7] syscalls/kill05: Use any two unprivileged
 users
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

On 06. 09. 21 15:05, Cyril Hrubis wrote:
> Hi!
>> But setting a non-existent UID/GID on a running process is different
>> because the kernel might try to look up some additional data in the
>> user/group database and block the credentials change if the lookup fails.
> 
> No it will not, kernel does not care and never cared about system users
> and groups, that's purely userspace concept. The login(1) process that
> sets up all the process IDS as well as shell variables.

The man pages give no guarantee that it'll stay that way. I'd rather
play it safe with process credentials. From test setup perspective, it's
still less work than the old lookup of specific usernames.

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
