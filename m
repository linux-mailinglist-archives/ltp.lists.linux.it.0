Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5223EB6B8
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 16:31:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 57DCC3C6580
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 16:31:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5D8C93C30C7
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 16:31:00 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DAE841A01440
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 16:30:59 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2169E1FFCF;
 Fri, 13 Aug 2021 14:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628865059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kPXoJM3ZVW/e15cAsKgEwuALG4fL3PLqphOZHwaRpvw=;
 b=IDl+NG+QvBmsg6enJTKdrkqRgBPKNI72N1+soBkMhilhDD+u0E1GfvzYOe7YH6QWfnqdD+
 xU/qqW8TmlS36c3nJLKg/d8H9GzAIK97tUMTnbf4OEtnDuu8Mf3liLBtFRHNJ2c+NyVAZB
 qtyRnGdfI506pgFDChRBiw1Bx/y50+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628865059;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kPXoJM3ZVW/e15cAsKgEwuALG4fL3PLqphOZHwaRpvw=;
 b=A44sLgdBMt+k/t2oYTu5IAE/hcLDMsA6IaBz1Tldg+RSi/PdU9kYtpx5PeqsLP5Fz0uzzh
 LSLvzgceNBVzGCAA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 0CB8B13806;
 Fri, 13 Aug 2021 14:30:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id sNnPASOCFmGLDQAAGKfGzw
 (envelope-from <mdoucha@suse.cz>); Fri, 13 Aug 2021 14:30:59 +0000
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210806154557.19551-1-mdoucha@suse.cz> <YRZ4TmJWcL8zJgg6@yuki>
 <97c36f43-f567-f384-0c55-4282ed1cd448@suse.cz> <YRaBPzw2Cv1Bo1Ag@yuki>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <482bfc93-5be1-020d-b3d9-1101a3a32d5e@suse.cz>
Date: Fri, 13 Aug 2021 16:30:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRaBPzw2Cv1Bo1Ag@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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

On 13. 08. 21 16:27, Cyril Hrubis wrote:
>> We can't pick just any group numbers. The test user (nobody) must be a
>> member of the first group but not the other. Using nobody/nogroup is
>> probably safe so for the second group we can just scan all existing
>> groups and pick for example max(gid)+1.
> 
> I guess that simply git for nobody/nogroup + 1 should work well then.

If nobody/nogroup + 1 turns out to be root gid (or any group where root
is an explicit member), then we may end up with false negatives in the
last subtest.

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
