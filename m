Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF003EB946
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 17:33:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 075CB3C6599
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 17:33:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 89C3A3C6511
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 17:33:35 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DBD29600864
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 17:33:34 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0CD4222342;
 Fri, 13 Aug 2021 15:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628868814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/BIZrHvuSXWLtqIlx3a/VwsyWn8wN+59UYjM7LaLP1k=;
 b=op71plD8NfsFpRiNe4aGBwtK4gBX8NbG2l5LDRvfsbM31AHvYdvLs7iDxsvKUe+OAwsOMN
 JvTQ5+5S9G6QFyabx5zIDtYmyDMQLzECht0ixOrDaCM5jsnuG/3eBSgFMloVArUm7Z7u3p
 l0J3PaPc1CkO6w4QHm2Vw/n0QkKCybg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628868814;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/BIZrHvuSXWLtqIlx3a/VwsyWn8wN+59UYjM7LaLP1k=;
 b=8rxKh7K9H/9QdMhER431W2u3zmZsrpxvbDCthxwLHqBhB/36dLkFIWtyyw4YaojAuhkSut
 hiD64Ob/v1V/t7Cw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id EE8EF1374D;
 Fri, 13 Aug 2021 15:33:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id dnjEOM2QFmHqGAAAGKfGzw
 (envelope-from <mdoucha@suse.cz>); Fri, 13 Aug 2021 15:33:33 +0000
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210806154557.19551-1-mdoucha@suse.cz> <YRZ4TmJWcL8zJgg6@yuki>
 <97c36f43-f567-f384-0c55-4282ed1cd448@suse.cz> <YRaBPzw2Cv1Bo1Ag@yuki>
 <482bfc93-5be1-020d-b3d9-1101a3a32d5e@suse.cz> <YRaNQvWy0uAnnlUU@yuki>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <68c16d3e-09f6-568d-15e2-43685a0619a2@suse.cz>
Date: Fri, 13 Aug 2021 17:33:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRaNQvWy0uAnnlUU@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] syscalls/creat08: Convert to new API
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

On 13. 08. 21 17:18, Cyril Hrubis wrote:
>> If nobody/nogroup + 1 turns out to be root gid (or any group where root
>> is an explicit member), then we may end up with false negatives in the
>> last subtest.
> 
> The root GID is 0 by definition and on my machine root is a member of
> bin group yet the test seems to work fine. I do not get how root having
> the bin group (or nobody+1) in the list of supplementary groups will
> interfere with the test.

Simple: The last test case is checking whether root has an exception
from the setgid bit removal logic that fixed the CVE. This logic is not
applied when the file is being created by a member of the group which
owns the parent directory. If root happens to be an explicit member of
the second group, the last subtest will pass even when the kernel
doesn't apply the root exception properly.

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
