Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC273F76F4
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 16:15:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 65CA73C9DA4
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 16:15:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1E8783C2F63
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 16:15:13 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7AE806008C0
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 16:15:12 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C3ABB221A4;
 Wed, 25 Aug 2021 14:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629900911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5DJlJUTVOMACqeZNf7ULlZ6OaFe0hqfbl8GI7gVcFRU=;
 b=DYXObhO5K7b6alUO0nEsZYXbYKRwYtPWBdVc9sbkGqgAToc4vuFhHURZP0ByKItoKTg7fD
 DIqXa5nfTnK0RFbliglPqZFtO3+EmLSBL4YGl7mMgdQOM3f8ZniSRRikeLOZlQdu6lFSNb
 MkDVWDQStDNBwJ0C/bITz7eBQh/lsfA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629900911;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5DJlJUTVOMACqeZNf7ULlZ6OaFe0hqfbl8GI7gVcFRU=;
 b=JoELb3zvJ3w667FkQJBb20ZlLmje7kuJgnr0DftqcIlRBpt/ljmVpZslWJYxazVjraHmWD
 fhSZZMuz/bYqzRBQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id A5D9613A82;
 Wed, 25 Aug 2021 14:15:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id wvjPJm9QJmHmRwAAGKfGzw
 (envelope-from <mdoucha@suse.cz>); Wed, 25 Aug 2021 14:15:11 +0000
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210825104300.15255-1-mdoucha@suse.cz>
 <20210825104300.15255-3-mdoucha@suse.cz> <87k0k9lpld.fsf@suse.de>
 <025997b0-e0a8-d450-e387-f1a2e8a720e9@suse.cz> <YSY1oaE3794Asrp8@yuki>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <57a4f942-a97e-c82b-8a63-1da862eca168@suse.cz>
Date: Wed, 25 Aug 2021 16:15:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSY1oaE3794Asrp8@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] Add test for CVE 2021-3609
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

On 25. 08. 21 14:20, Cyril Hrubis wrote:
> Hi!
>>> I think you dropped NS due to lack of CAN support on older kernels?
>>
>> Exactly. If I create a new network namespace, SAFE_SOCKET() will fail
>> with EAFNOSUPPORT on kernel 4.4.
> 
> Then I guess that we have to remove the needs_kconfig before pushing,
> right?

Yes, please. I forgot to remove needs_kconfig after rewriting setup()
and cleanup() 5 times...

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
