Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE6E401B67
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Sep 2021 14:47:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 695263C9783
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Sep 2021 14:47:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 985B33C259B
 for <ltp@lists.linux.it>; Mon,  6 Sep 2021 14:47:39 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D9B811400E44
 for <ltp@lists.linux.it>; Mon,  6 Sep 2021 14:47:38 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0D3171FEF2;
 Mon,  6 Sep 2021 12:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630932458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vsm8AgZ8CgcVlrqFrdW/hLZYQVANt8RNhWwI7TOWQK8=;
 b=gc+9dC9Sq+PbMLt6PNsT3A8oKFUzUQL0sFiTrol3FGA6UqbVdy20K7fJCia+SjqaHJZOSL
 eqlxIKR42DL62TDjc2rqFfIAOiZphraJjdLnxs0g2QgEP9UqXIEeKV9e1iIWZG09dcau2l
 r3lRPcoq47axq2QGKIcbhkr8em/ef+I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630932458;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vsm8AgZ8CgcVlrqFrdW/hLZYQVANt8RNhWwI7TOWQK8=;
 b=r4M5gdfD3AIr28w7gqn1BU2NJkUnabkkk5NgciC0m6k1jf5IcNuSU4SNE3nCnTPPAm5roc
 Nl2syslpOXp8/QAg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id EB0C61396D;
 Mon,  6 Sep 2021 12:47:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id KxS0N+kNNmFYNgAAGKfGzw
 (envelope-from <mdoucha@suse.cz>); Mon, 06 Sep 2021 12:47:37 +0000
Message-ID: <77fd98d9-5257-c1da-a01b-77d8cc1b6bce@suse.cz>
Date: Mon, 6 Sep 2021 14:47:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Content-Language: en-US
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210903154848.18705-1-mdoucha@suse.cz>
 <20210903154848.18705-5-mdoucha@suse.cz> <YTYJUPFc75TuOJSb@yuki>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <YTYJUPFc75TuOJSb@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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

On 06. 09. 21 14:28, Cyril Hrubis wrote:
> Hi!
>> Usernames such as "bin" may not exist on some systems. Find and use any two
>> unprivileged user IDs for the test instead of specific named users.
> 
> I do wonder if we have to lookup the UIDs in this case. As long as I
> understand the test correctly we are testing that no signals are send to
> a process if the sender real of effective UID do not match either of
> real and saved set UIDs of the receiving process. If my understanding is
> correct we can just take two arbitrary UIDs that != 0 and the test
> should work just fine.

We could just use UID 1 and 2 for this test but I'd rather not assume
that set*uid() functions allow setting unused UIDs. Even if it works
now, it could easily break in the future or on some special system auth
backends.

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
